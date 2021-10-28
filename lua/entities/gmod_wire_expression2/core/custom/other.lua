e2function number lerp(t, from, to) 
	return Lerp( t, from, to )
end

e2function vector lerpVec(fraction, vector from, vector to) 
	return LerpVector( fraction, Vector(from[1], from[2], from[3]), Vector(to[1], to[2], to[3]) )
end

e2function angle lerpAng(ratio, angle angleStart, angle angleEnd) 
	return LerpAngle( ratio, Vector(angleStart[1], angleStart[2], angleStart[3]), Vector(angleEnd[1], angleEnd[2], angleEnd[3]) )
end

e2function void entity:chatPrint(...)
	if !self.player:GetNWBool("E2PowerAccess") then error( "[E2p]: у тебя нет доступа к entity:chatPrint()!" ) return end
	if (!this:IsPlayer()) then error( "[E2p]: в entity:chatPrint() энтити не игрок!" ) return end

	this:ChatPrint(...)
end

e2function void chatPrint(entity ply, ...)
	if !self.player:GetNWBool("E2PowerAccess") then error( "[E2p]: у тебя нет доступа к chatPrint()!" ) return end
	if (!ply:IsPlayer()) then error( "[E2p]: в chatPrint() энтити не игрок!" ) return end

	ply:ChatPrint(...)
end