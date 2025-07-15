local discordWebhook = "your_webhook"
local lastKillLog = {}

RegisterServerEvent('killLogs:log')
AddEventHandler('killLogs:log', function(attackerServerId, weaponName, killType)
    local src = source
    local victimPed = GetPlayerPed(src)

    if lastKillLog[src] and os.time() - lastKillLog[src] < 1000 then return end
    lastKillLog[src] = os.time()

    if not DoesEntityExist(victimPed) then return end

    local attackerName = "Unknown"
    local text = ""

    local victimName = GetPlayerName(src) or ("Player "..src)

    if killType == "self" then
        text = string.format("**%s** [%s] committed suicide using **%s**", victimName, src, weaponName)

    elseif killType == "explosion" then
        text = string.format("**%s** [%s] died in an explosion with **%s**", victimName, src, weaponName)

    elseif killType == "player" and attackerServerId and GetPlayerName(attackerServerId) then
        attackerName = GetPlayerName(attackerServerId)

        if attackerServerId == src then return end

        text = string.format("**%s** [%s] killed **%s** [%s] using **%s**", attackerName, attackerServerId, victimName, src, weaponName)

    elseif killType == "npc_or_env" then
        text = string.format("**%s** [%s] was killed by an NPC or the environment using **%s**", victimName, src, weaponName)

    else
        text = string.format("**%s** [%s] died under unknown circumstances with **%s**", victimName, src, weaponName)
    end

    local embed = {
        {
            ["color"] = 65352,
            ["author"] = {
                ["icon_url"] = 'https://cdn.discordapp.com/attachments/1213547373628756008/1394471480116379659/image.png?ex=6876ee44&is=68759cc4&hm=d895842dd2a82fea3560bdfa362f4f7dbb004e49eb2ac1c44b1493c1831829ad&',
                ["name"] = '[r01] - Kill Logs',
            },
            ["title"] = "Kill Log",
            ["description"] = text,
            ["footer"] = {["text"] = os.date('%d/%m/%Y [%X]')}
        }
    }

    PerformHttpRequest(discordWebhook, function(err, text, headers) end, 'POST', json.encode({ username = 'R01 - Logs', embeds = embed }), { ['Content-Type'] = 'application/json' })
end)
