local QBCore = exports['qb-core']:GetCoreObject()
local Shown2 = false
local Shown3 = false
local Shown1 = false
local done = false
local zone = ""
local drugitem = ""
local exit = 0
---functions
function ShowText(x)
	exports['okokTextUI']:Open(x, 'darkred', 'left')
end
function HideText()
	exports['okokTextUI']:Close()
end
function ShowNotif(x,y)
	exports['okokNotify']:Alert("Red Moon", x, 5000, y)
end

local function PlayATMAnimation(animation)
    local playerPed = PlayerPedId()
    if animation == 'enter' then
        RequestAnimDict('amb@prop_human_atm@male@enter')
        while not HasAnimDictLoaded('amb@prop_human_atm@male@enter') do
            Wait(0)
        end
        TaskPlayAnim(playerPed, 'amb@prop_human_atm@male@enter', "enter", 1.0,-1.0, 3000, 1, 1, true, true, true)
    end

    if animation == 'exit' then
        RequestAnimDict('amb@prop_human_atm@male@exit')
        while not HasAnimDictLoaded('amb@prop_human_atm@male@exit') do
            Wait(0)
        end
        TaskPlayAnim(playerPed, 'amb@prop_human_atm@male@exit', "exit", 1.0,-1.0, 3000, 1, 1, true, true, true)
    end
end



----threading
CreateThread(function()
	while true do
		-- draw every frame
		Wait(0)
		for k,v in pairs(Config.coords) do
			local pedCoords = GetEntityCoords(PlayerPedId())
			if (#(v - pedCoords)<Config.Distance  +5)then
				if(#(v-pedCoords) < Config.Distance)then
					ShowText("Use Your Key To Go In")
					Shown2 = true
					if (done == false)then
						RegisterNetEvent("key",function (k,v)
							local k = k
							local v =v
							if (done == false)then
								done = true
								PlayATMAnimation('enter')
								QBCore.Functions.Progressbar("accessing_atm", "Going To "..tostring(Config.zones[k]).." Farming", Config.WaitTime*1000, false, true, {
									disableMovement = false,
									disableCarMovement = false,
									disableMouse = false,
									disableCombat = false,
								}, {}, {}, {}, function() -- Done
									done = false
									teleport(k)
									k1 = k
									zone = Config.zones[k]
									drugitem = Config.items[k]
								end, function()
									done = false
									QBCore.Functions.Notify("Failed!", "error")
								end)
							end
						end)
					end
				elseif (Shown2 == true) and (Shown1 == false) and (Shown3 == false)then
					HideText()
					Shown2 = false
				end
			end
		end
		for k,v in pairs(Config.Exit) do
			local pedCoords = GetEntityCoords(PlayerPedId())
			if (#(v - pedCoords)<Config.Distance)then
				ShowText("[E] Tp to zone")
				Shown3 = true
				if IsControlJustReleased(0,46) then
					PlayATMAnimation('enter')
					ShowNotif("Going Back in"..tostring(Config.WaitTime).." seconds","success")
						QBCore.Functions.Progressbar("accessing_atm", "Going Out ...", Config.WaitTime*1000, false, true, {
							disableMovement = false,
							disableCarMovement = false,
							disableMouse = false,
							disableCombat = false,
						}, {}, {}, {}, function() -- Done
							teleportback(k1)
						end, function()
							QBCore.Functions.Notify("Failed!", "error")
						end)
					
				end
			elseif(Shown3 == true) and (Shown1 == false) and (Shown2 == false) then 
				HideText()
				Shown3 = false
			end
		end
	end
end)
function teleportback(k)
	TriggerServerEvent("tp2",k)
	shown = false
	Wait(2000)
	HideText()
	Duty = false
	zone = ""
	drugitem = ""
	exit = 0
end
function teleport(k)
	TriggerServerEvent("tp",k)
	shown = false
	Wait(2000)
	HideText()
	Duty = true
	Shown2 = false
	Shown3 = false
end

CreateThread(function()
	while true do
		-- draw every frame
		Wait(0)
		local zone = zone
		local drugitem = drugitem
		for k,v in pairs(Config.Farming) do
			
			DrawMarker(21,Config.Farming[k].x, Config.Farming[k].y, Config.Farming[k].z , 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 0.5, 0.5, 0.5, Config.colors[1], Config.colors[2], Config.colors[3], 50, false, true, 2, nil, nil, false)
			local pedCoords = GetEntityCoords(PlayerPedId())
			if (#(v - pedCoords)<Config.Distance + 5)then
				if(#(v-pedCoords) < Config.Distance)then
					if (Duty)then

					else
						ShowText("How Did You Get There Bitch ??")
						Wait(4000)
						Shown1 = false
						HideText()
						break
					end
					if IsControlJustReleased(0,46) then
						TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)
						QBCore.Functions.Progressbar("fullcut_cycle_v6_weedcutter", "Processing "..zone.." ...", Config.timeToProcess*1000, false, true, {
							disableMovement = false,
							disableCarMovement = false,
							disableMouse = false,
							disableCombat = true,
						}, {}, {}, {}, function() -- Done
							ClearPedTasks(PlayerPedId())
							TriggerServerEvent("server:loot",drugitem)
							TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[drugitem], "add")
						end)
					end
				end
			end
		end
	end
end)