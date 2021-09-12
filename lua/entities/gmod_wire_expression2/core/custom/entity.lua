/******************************************************************************\
Entity Core by Informatixa and MetaGamerz Team
\******************************************************************************/

hook.Add("PlayerInitialSpawn", "wire_expression2_entitycore", function(ply)
	ply:SendLua('language.Add("Undone_e2_spawned_entity", "E2 Spawned Entity")')
end)

local sbox_e2_maxentitys = CreateConVar( "sbox_e2_maxentitys", "30", FCVAR_ARCHIVE )
local sbox_e2_maxentitys_persecond = CreateConVar( "sbox_e2_maxentitys_persecond", "6", FCVAR_ARCHIVE )
local sbox_e2_entitycore = CreateConVar( "sbox_e2_entitycore", "2", FCVAR_ARCHIVE )

local E2Helper = { Descriptions = {} }
local E2totalspawnedentitys = 0
local E2tempSpawnedEntitys = 0

local function ValidSpawn()
	if E2tempSpawnedEntitys >= sbox_e2_maxentitys_persecond:GetInt() then return false end
	if sbox_e2_maxentitys:GetInt() <= -1 then
		return true
	elseif E2totalspawnedentitys >= sbox_e2_maxentitys:GetInt() then
		return false
	end
	return true
end

local function ValidAction(ply)
	return sbox_e2_entitycore:GetInt()==2 or (sbox_e2_entitycore:GetInt()==1 and ply:IsAdmin())
end
local BlackListForCoders = {"game_end","lua_run","point_commentary_node","env_entity_maker","npc_maker","worldspawn","npc_template_maker"}
local BlackListForPlayers = {"env_entity_dissolver","env_entity_igniter","env_headcrabcanister","env_screenoverlay","script_intro","sky_camera","env_viewpunch","point_tesla","game"} -- Блеклист второй степени

local function createentitysfromE2(self,entity,pos,angles,freeze)
	if not ValidSpawn() then return nil end

	for _, i in pairs(BlackListForCoders) do
		if entity:lower():find(i) then
			if not self.player:IsSuperAdmin() then return end
			if not self.player:GetNWBool("E2PowerAccess") then return end
		end
	end

	for _, i in pairs(BlackListForPlayers) do
		if entity:lower():find(i) and not self.player:GetNWBool("E2PowerAccess") then return end
	end

	if ( IsValid( self.player ) && !self.player:IsAdmin() ) then
		if ( scripted_ents.GetMember( entity, "AdminOnly" ) ) then return end
	end

	local ent = ents.Create(entity)
	if not IsValid(ent) then return nil end
	ent:SetPos(pos)
	ent:SetAngles(angles)
	ent:SetOwner(self.player)
	ent:Spawn()
	ent.e2co = true
	self.player:AddCleanup( "props", ent )
	undo.Create("e2_Ent("..tostring(ent:GetClass())..")")
		undo.AddEntity( ent )
		undo.SetPlayer( self.player )
	undo.Finish()
	local phys = ent:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
		if freeze then phys:EnableMotion( false ) end
	end
	--ent.OnDieFunctions.GetCountUpdate.Function2 = ent.OnDieFunctions.GetCountUpdate.Function
	--ent.OnDieFunctions.GetCountUpdate.Function =  function(self,player,class)
	--	if CLIENT then return end
	--	E2totalspawnedentitys=E2totalspawnedentitys-1
	--	self.OnDieFunctions.GetCountUpdate.Function2(self,player,class)
	--end
	E2totalspawnedentitys = E2totalspawnedentitys+1
	E2tempSpawnedEntitys = E2tempSpawnedEntitys+1
	if E2tempSpawnedEntitys==1 then
		timer.Simple( 1, function()
			E2tempSpawnedEntitys=0
		end)
	end
	return ent
end

--------------------------------------------------------------------------------

__e2setcost(100)
e2function void entity:setModel(string model)
	if not ValidAction(self.player) then return end
	if not IsValid(this) then return nil end
	if !isOwner(self, this) then return end
	if ( !util.IsModelLoaded(model) ) then MsgC( Color(255, 74, 74), "[E2p]: используется невалидная модель в setModel()!" ) end

	this:SetModel(model)
end

e2function void entity:setOwnerNoEntity()
	if !IsValid(this) then return end
	if !isOwner(self, this) then return end
	if !this.e2co then return end
	if not self.player:GetNWBool("E2PowerAccess") then MsgC( Color(255, 74, 74), "[E2p]: у тебя нет доступа к setOwnerNoEntity()!" ) return end
	this:SetOwner(nil)
end
