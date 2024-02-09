local QBCore = exports['qb-core']:GetCoreObject()

function ShowNotif(x,y)
	
end


QBCore.Functions.CreateUseableItem("key1", function(source, item)
    local src = source
    local pedCoords = GetEntityCoords(GetPlayerPed(source))
    local found = false
    for k,v in pairs(Config.coords) do
        local Player = QBCore.Functions.GetPlayer(source)
        if (#(v - pedCoords)<Config.Distance  +5)then
            if (k ~= 1) and (Player.Functions.RemoveItem("key1", 1, item.slot)) then
                Player.Functions.AddItem("key1",1,item.slot)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["key1"], 'add')
                TriggerClientEvent("QBCore:Notify",source, "Wrong Key !! ","error")
                return
            elseif(#(v-pedCoords) < Config.Distance)then
                TriggerClientEvent("key",source,k,v)
                TriggerClientEvent('QBCore:Notify', source,  "Going To "..Config.zones[1].." Farming Zone In "..tostring(Config.WaitTime).." seconds", "success")
                found = true
                break
            else
                TriggerClientEvent('QBCore:Notify', source,  "You Should Use That On A Door", "error")
                break
            end
        end
    end
    if (found == false) then
        TriggerClientEvent("QBCore:Notify",source, "You Should Use That On A Door","error")
    end
end)
QBCore.Functions.CreateUseableItem("key2", function(source, item)
    local src = source
    local pedCoords = GetEntityCoords(GetPlayerPed(source))
    local found = false
    for k,v in pairs(Config.coords) do
        local Player = QBCore.Functions.GetPlayer(source)
        if (#(v - pedCoords)<Config.Distance  +5)then
            if (k ~= 2) and (Player.Functions.RemoveItem("key2", 1, item.slot)) then
                Player.Functions.AddItem("key2",1,item.slot)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["key2"], 'add')
                TriggerClientEvent("QBCore:Notify",source, "Wrong Key !! ","error")
                return
            elseif(#(v-pedCoords) < Config.Distance)then
                TriggerClientEvent("key",source,k,v)
                TriggerClientEvent('QBCore:Notify', source,  "Going To "..Config.zones[k].." Farming Zone In "..tostring(Config.WaitTime).." seconds", "success")
                found = true
                break
            else
                TriggerClientEvent('QBCore:Notify', source,  "You Should Use That On A Door", "error")
                break
            end
        end
    end
    if (found == false) then
        TriggerClientEvent("QBCore:Notify",source, "You Should Use That On A Door","error")
    end
end)
QBCore.Functions.CreateUseableItem("key3", function(source, item)
    local src = source
    local pedCoords = GetEntityCoords(GetPlayerPed(source))
    local found = false
    for k,v in pairs(Config.coords) do
        local Player = QBCore.Functions.GetPlayer(source)
        if (#(v - pedCoords)<Config.Distance  +5)then
            if (k ~= 3) and (Player.Functions.RemoveItem("key3", 1, item.slot)) then
                Player.Functions.AddItem("key3",1,item.slot)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["key3"], 'add')
                TriggerClientEvent("QBCore:Notify",source, "Wrong Key !! ","error")
                return
            elseif(#(v-pedCoords) < Config.Distance)then
                TriggerClientEvent("key",source,k,v)
                TriggerClientEvent('QBCore:Notify', source,  "Going To "..Config.zones[1].." Farming Zone In "..tostring(Config.WaitTime).." seconds", "success")
                found = true
                break
            else
                TriggerClientEvent('QBCore:Notify', source,  "You Should Use That On A Door", "error")
                break
            end
        end
    end
    if (found == false) then
        TriggerClientEvent("QBCore:Notify",source, "You Should Use That On A Door","error")
    end
end)
QBCore.Functions.CreateUseableItem("key4", function(source, item)
    local src = source
    local pedCoords = GetEntityCoords(GetPlayerPed(source))
    local found = false
    for k,v in pairs(Config.coords) do
        local Player = QBCore.Functions.GetPlayer(source)
        if (#(v - pedCoords)<Config.Distance  +5)then
            if (k ~= 4) and (Player.Functions.RemoveItem("key4", 1, item.slot)) then
                Player.Functions.AddItem("key4",1,item.slot)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["key4"], 'add')
                TriggerClientEvent("QBCore:Notify",source, "Wrong Key !! ","error")
                return
            elseif(#(v-pedCoords) < Config.Distance)then
                TriggerClientEvent("key",source,k,v)
                TriggerClientEvent('QBCore:Notify', source,  "Going To "..Config.zones[1].." Farming Zone In "..tostring(Config.WaitTime).." seconds", "success")
                found = true
                break
            else
                TriggerClientEvent('QBCore:Notify', source,  "You Should Use That On A Door", "error")
                break
            end
        end
    end
    if (found == false) then
        TriggerClientEvent("QBCore:Notify",source, "You Should Use That On A Door","error")
    end
end)

RegisterServerEvent("tp")
AddEventHandler("tp",function(k)
    local src = source
    playerPed = GetPlayerPed(src)
    SetEntityCoords(playerPed, Config.tps[k].x, Config.tps[k].y, Config.tps[k].z)
end)


RegisterServerEvent("tp2")
AddEventHandler("tp2",function(k)
    local src = source
    playerPed = GetPlayerPed(src)
    SetEntityCoords(playerPed, Config.Exittps[k].x, Config.Exittps[k].y, Config.Exittps[k].z)
end)