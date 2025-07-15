local weaponsList = {
    [GetHashKey("WEAPON_KNIFE")] = "Knife",
    [GetHashKey("WEAPON_DAGGER")] = "Dagger",
    [GetHashKey("WEAPON_BOTTLE")] = "Broken Bottle",
    [GetHashKey("WEAPON_HATCHET")] = "Hatchet",
    [GetHashKey("WEAPON_STONE_HATCHET")] = "Stone Hatchet",
    [GetHashKey("WEAPON_KNUCKLE")] = "Knuckle",
    [GetHashKey("WEAPON_MACHETE")] = "Machete",
    [GetHashKey("WEAPON_SWITCHBLADE")] = "Switchblade",
    [GetHashKey("WEAPON_WRENCH")] = "Wrench",
    [GetHashKey("WEAPON_BATTLEAXE")] = "Battle Axe",
    [GetHashKey("WEAPON_FLASHLIGHT")] = "Flashlight",
    [GetHashKey("WEAPON_NIGHTSTICK")] = "Nightstick",
    [GetHashKey("WEAPON_HAMMER")] = "Hammer",
    [GetHashKey("WEAPON_BAT")] = "Bat",
    [GetHashKey("WEAPON_GOLFCLUB")] = "Golf Club",
    [GetHashKey("WEAPON_CROWBAR")] = "Crowbar",
    [GetHashKey("WEAPON_PISTOL")] = "Pistol",
    [GetHashKey("WEAPON_COMBATPISTOL")] = "Combat Pistol",
    [GetHashKey("WEAPON_APPISTOL")] = "AP Pistol",
    [GetHashKey("WEAPON_PISTOL50")] = ".50 Pistol",
    [GetHashKey("WEAPON_MICROSMG")] = "Micro SMG",
    [GetHashKey("WEAPON_SMG")] = "SMG",
    [GetHashKey("WEAPON_COMBATMG")] = "Combat SMG",
    [GetHashKey("WEAPON_ASSAULTSMG")] = "Assault SMG",
    [GetHashKey("WEAPON_ASSAULTRIFLE")] = "Assault Rifle",
    [GetHashKey("WEAPON_CARBINERIFLE")] = "Carbine Rifle",
    [GetHashKey("WEAPON_ADVANCEDRIFLE")] = "Advanced Rifle",
    [GetHashKey("WEAPON_MG")] = "MG",
    [GetHashKey("WEAPON_PUMPSHOTGUN")] = "Pump Shotgun",
    [GetHashKey("WEAPON_SAWNOFFSHOTGUN")] = "Sawed-Off Shotgun",
    [GetHashKey("WEAPON_ASSAULTSHOTGUN")] = "Assault Shotgun",
    [GetHashKey("WEAPON_BULLPUPSHOTGUN")] = "Bullpup Shotgun",
    [GetHashKey("WEAPON_STUNGUN")] = "Stun Gun",
    [GetHashKey("WEAPON_SNIPERRIFLE")] = "Sniper Rifle",
    [GetHashKey("WEAPON_HEAVYSNIPER")] = "Heavy Sniper",
    [GetHashKey("WEAPON_REMOTESNIPER")] = "Remote Sniper",
    [GetHashKey("WEAPON_GRENADELAUNCHER")] = "Grenade Launcher",
    [GetHashKey("WEAPON_GRENADELAUNCHER_SMOKE")] = "Smoke Grenade Launcher",
    [GetHashKey("WEAPON_RPG")] = "RPG",
    [GetHashKey("WEAPON_PASSENGER_ROCKET")] = "Passenger Rocket",
    [GetHashKey("WEAPON_AIRSTRIKE_ROCKET")] = "Airstrike Rocket",
    [GetHashKey("WEAPON_STINGER")] = "Stinger",
    [GetHashKey("WEAPON_MINIGUN")] = "Minigun",
    [GetHashKey("WEAPON_GRENADE")] = "Grenade",
    [GetHashKey("WEAPON_STICKYBOMB")] = "Sticky Bomb",
    [GetHashKey("WEAPON_SMOKEGRENADE")] = "Smoke Grenade",
    [GetHashKey("WEAPON_BZGAS")] = "BZ Gas",
    [GetHashKey("WEAPON_MOLOTOV")] = "Molotov",
    [GetHashKey("WEAPON_FIREEXTINGUISHER")] = "Fire Extinguisher",
    [GetHashKey("WEAPON_PETROLCAN")] = "Petrol Can",
    [GetHashKey("WEAPON_DIGISCANNER")] = "Digi Scanner",
    [GetHashKey("WEAPON_BRIEFCASE")] = "Briefcase",
    [GetHashKey("WEAPON_BRIEFCASE_02")] = "Briefcase 2",
    [GetHashKey("WEAPON_BALL")] = "Ball",
    [GetHashKey("WEAPON_FLARE")] = "Flare",
    [GetHashKey("WEAPON_PISTOL_MK2")] = "Pistol MK2",
    [GetHashKey("WEAPON_SNSPISTOL")] = "SNS Pistol",
    [GetHashKey("WEAPON_HEAVYPISTOL")] = "Heavy Pistol",
    [GetHashKey("WEAPON_VINTAGEPISTOL")] = "Vintage Pistol",
    [GetHashKey("WEAPON_MARKSMANPISTOL")] = "Marksman Pistol",
    [GetHashKey("WEAPON_REVOLVER")] = "Revolver",
    [GetHashKey("WEAPON_DOUBLEACTION")] = "Double Action Revolver",
    [GetHashKey("WEAPON_GADGETPISTOL")] = "Gadget Pistol",
    [GetHashKey("WEAPON_NAVYREVOLVER")] = "Navy Revolver",
    [GetHashKey("WEAPON_MACHINEPISTOL")] = "Machine Pistol",
    [GetHashKey("WEAPON_MINISMG")] = "Mini SMG",
    [GetHashKey("WEAPON_SMG_MK2")] = "SMG MK2",
    [GetHashKey("WEAPON_ASSAULTSMG")] = "Assault SMG",
    [GetHashKey("WEAPON_MG")] = "MG",
    [GetHashKey("WEAPON_COMBATMG")] = "Combat MG",
    [GetHashKey("WEAPON_GUSENBERG")] = "Gusenberg",
    [GetHashKey("WEAPON_COMBATMG_MK2")] = "Combat MG MK2",
    [GetHashKey("WEAPON_COMBATPDW")] = "Combat PDW",
    [GetHashKey("WEAPON_BULLPUPRIFLE_MK2")] = "Bullpup Rifle MK2",
    [GetHashKey("WEAPON_SPECIALCARBINE_MK2")] = "Special Carbine MK2",
    [GetHashKey("WEAPON_MILITARYRIFLE")] = "Military Rifle",
    [GetHashKey("WEAPON_ASSAULTRIFLE_MK2")] = "Assault Rifle MK2",
    [GetHashKey("WEAPON_COMPACTRIFLE")] = "Compact Rifle",
    [GetHashKey("WEAPON_COMBATSHOTGUN")] = "Combat Shotgun",
    [GetHashKey("WEAPON_TACTICALRIFLE")] = "Tactical Rifle",
    [GetHashKey("WEAPON_REVOLVER_MK2")] = "Revolver MK2",

    [-1553120962] = "Car",
    [-1569615261] = "Punches",
}

local alreadyDead
AddEventHandler('gameEventTriggered', function(event, args)
    if event ~= "CEventNetworkEntityDamage" then return end
    if alreadyDead then return end

    local victim = args[1]
    local attacker = args[2]
    local died = GetEntityHealth(victim) <= 105
    local weaponHash = args[7]
    
    if victim ~= PlayerPedId() or not died then return end

    alreadyDead = true

    local attackerPlayerId = NetworkGetPlayerIndexFromPed(attacker)
    local isSelfKill = attacker == PlayerPedId()

    local weaponName = weaponHash and weaponsList[weaponHash] and string.upper(weaponsList[weaponHash]) or (weaponHash ~= 0 and tostring(weaponHash) or "UNKNOWN")

    local killType
	
    if isSelfKill then
        killType = "self"
    elseif attackerPlayerId ~= -1 and attackerPlayerId ~= nil then
        killType = "player"
    elseif weaponHash == GetHashKey("WEAPON_RPG") or weaponHash == GetHashKey("WEAPON_GRENADE") or weaponHash == GetHashKey("WEAPON_STICKYBOMB") then
        killType = "explosion"
    else
        killType = "npc_or_env"
    end

    local attackerServerId = (killType == "player") and GetPlayerServerId(attackerPlayerId) or -1
    TriggerServerEvent("killLogs:log", attackerServerId, weaponName, killType)

    while GetEntityHealth(PlayerPedId()) <= 105 do
        Wait(500)
    end

    alreadyDead = false
end)