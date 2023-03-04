[![](https://img.shields.io/github/issues-raw/VelaEurope/e2power.svg)]()
[![](https://img.shields.io/github/release/VelaEurope/e2power.svg)]()
[![](https://img.shields.io/github/license/VelaEurope/e2power.svg)]()

Due to lack of time and active devs compatibility with latest versions of WireMod is not guaranteed.\
Use [this version](https://github.com/wiremod/wire/tree/02e15b5ed8fc8f21b7809400d4437321425a06f6) instead.

# E2Power
E2Power or E2P - is extension for Wiremod, which adds a lot of useful E2 commands.

## Changes from original fork

+ For functions entity:setKeyValue() and entity:setFire() was entered a blacklist. Superadmins ignore it.
+ Fixed functions entity:removeOnDelete(entity), entity:setUndoName(string) and array:setUndoName(string). Now they can't delete players.
+ Now password generates with 12 symbols (include letters).
+ Deleted global banlist.
+ Deleted functions e2pSetPassword(string), entity:e2pRemoveAccess() and entity:e2pGiveAccess().
+ Fixed functions such as setHealth and heal.
+ Using function shootTo now can't spawn prohibited effects.
+ Fixed bug with playerSetBoneAng.
+ Added function entity:hasGodMode.
+ Fixed function setParent (now doesn't delete players).
+ Regular players can't change admins' E2 chips.
+ Fixed bug with soundURLload, now long URLs are working.
+ Play music on whole map (using soundURLload) can players, who has access to E2Power only.
+ Deleted useless command (e2power_set_pass_free).
+ Added functions entity:setWeaponColor(v), entity:setPlayerColor(v), entity:getWeaponColor() and entity:getPlayerColor().
+ Changed particle size limit from 3000 to 800.
+ Fixed some functions in Tool.lua, diff.lua and health.lua.
+ Added checking for admin right for entity spawn.
+ Added bruteforce protection.

## Authors

**[G-moder]FertNoN**

+ [Steam](https://steamcommunity.com/id/FertNoN)
+ [Steam Group](https://steamcommunity.com/groups/E2Power)

**Tengz**

+ [Steam](http://steamcommunity.com/id/Tengz)
+ [Github](https://github.com/tengzl33t)

**0Fox**
+ [Steam](http://steamcommunity.com/id/Zimon4eR)
+ [Github](https://github.com/0Fox)
