local newProp = nil
local car = nil
local carDismantlingActive = false
local processDrsEating = false
local clientcooldown = true
local numberdoors = 0
local process = 0
local backdoor = false
local CurrentCops = 0

QBCore = exports['qb-core']:GetCoreObject() -- Core

local carPartDot = {
	{
		["name"] = Lang:t("drawtext.frontleftdoor"),
		["code-name"] = "on_sol_kapi",
		["time"] = 3000,
		["time-name"] = Lang:t("drawtext.dismantlingdoor"),
		["parca-native-no"] = 0,
		["coordinate"] = {
			["x"] = -558.96,
			["y"] = -1696.59,
			["z"] = 19.13,
			["h"] = 296.08,
		},
		["animation"] = {
			["scenario"] = "true",
			["scenario-anim"] = "WORLD_HUMAN_WELDING"
		},
		["prop"] =  "prop_car_door_01",
		["entity-attach"] = {
			["bone"] = 57005,
			["xPos"] = 0.4,
			["yPos"] = 0,
			["zPos"] = 0,
			["xRot"] = 0,
			["yRot"] = 270.0,
			["zRot"] = 60.0,
		},
		["prop-anim"] = {
			["prop-dics"] = "anim@heists@narcotics@trash",
			["prop-name"] = "walk"
		}
	},
	{
		["name"] = Lang:t("drawtext.boxfrontleftdoor"),
		["code-name"] = "on_sol_kapi_kutu",
		["time"] = 2500,
		["time-name"] = Lang:t("drawtext.frontleftdoorboxing"),
		["coordinate"] = {
			["x"] = -556.23,
			["y"] = -1704.21,
			["z"] = 19.06,
			["h"] = 114.17,
		},
		["animation"] = {
			["scenario"] = false,
			["anim-disc"] = "anim@heists@load_box",
			["anim-name"] = "load_box_3"
		},
		["prop"] =  "sil",
	},
	{
		["name"] = Lang:t("drawtext.frontrightdoor"),
		["code-name"] = "on_sag_kapi",
		["time"] = 3000,
		["time-name"] = Lang:t("drawtext.dismantlingdoor"),
		["parca-native-no"] = 1,
		["coordinate"] = {
			["x"] = -556.79,
			["y"] = -1694.99,
			["z"] = 19.2,
			["h"] = 120.54,
		},
		["animation"] = {
			["scenario"] = true,
			["scenario-anim"] = "WORLD_HUMAN_WELDING"
		},
		["prop"] =  "prop_car_door_01",
		["entity-attach"] = {
			["bone"] = 57005,
			["xPos"] = 0.4,
			["yPos"] = 0,
			["zPos"] = 0,
			["xRot"] = 0,
			["yRot"] = 270.0,
			["zRot"] = 60.0,
		},
		["prop-anim"] = {
			["prop-dics"] = "anim@heists@narcotics@trash",
			["prop-name"] = "walk"
		}
	},
	{
		["name"] = Lang:t("drawtext.boxfrontrightdoor"),
		["code-name"] = "on_sag_kapi_kutu",
		["time"] = 2500,
		["time-name"] = Lang:t("drawtext.frontrightdoorboxing"),
		["coordinate"] = {
			["x"] = -556.23,
			["y"] = -1704.21,
			["z"] = 19.06,
			["h"] = 114.17,
		},
		["animation"] = {
			["scenario"] = false,
			["anim-disc"] = "anim@heists@load_box",
			["anim-name"] = "load_box_3"
		},
		["prop"] =  "sil",
	},
	{
		["name"] = Lang:t("drawtext.rearleftdoor"),
		["code-name"] = "arka_sol_kapi",
		["time"] = 3000,
		["time-name"] = Lang:t("drawtext.dismantlingdoor"),
		["parca-native-no"] = 2,
		["coordinate"] = {
			["x"] = -558.48,
			["y"] = -1697.1,
			["z"] = 19.13,
			["h"] = 304.72,
		},
		["animation"] = {
			["scenario"] = true,
			["scenario-anim"] = "WORLD_HUMAN_WELDING"
		},
		["prop"] =  "prop_car_door_01",
		["entity-attach"] = {
			["bone"] = 57005,
			["xPos"] = 0.4,
			["yPos"] = 0,
			["zPos"] = 0,
			["xRot"] = 0,
			["yRot"] = 270.0,
			["zRot"] = 60.0,
		},
		["prop-anim"] = {
			["prop-dics"] = "anim@heists@narcotics@trash",
			["prop-name"] = "walk"
		}
	},
	{
		["name"] = Lang:t("drawtext.boxtherearleftdoor"),
		["code-name"] = "arka_sol_kapi_kutu",
		["time"] = 2500,
		["time-name"] = Lang:t("drawtext.boxingtherearleftdoor"),
		["coordinate"] = {
			["x"] = -556.23,
			["y"] = -1704.21,
			["z"] = 19.06,
			["h"] = 114.17,
		},
		["animation"] = {
			["scenario"] = false,
			["anim-disc"] = "anim@heists@load_box",
			["anim-name"] = "load_box_3"
		},
		["prop"] =  "sil",
	},
	{
		["name"] = Lang:t("drawtext.rearrightdoor"),
		["code-name"] = "arka_sag_kapi",
		["time"] = 3000,
		["time-name"] = Lang:t("drawtext.dismantlingdoor"),
		["parca-native-no"] = 3,
		["coordinate"] = {
			["x"] = -556.26,
			["y"] = -1695.81,
			["z"] = 19.19,
			["h"] = 122.01,
		},
		["animation"] = {
			["scenario"] = true,
			["scenario-anim"] = "WORLD_HUMAN_WELDING",
		},
		["prop"] =  "prop_car_door_01",
		["entity-attach"] = {
			["bone"] = 57005,
			["xPos"] = 0.4,
			["yPos"] = 0,
			["zPos"] = 0,
			["xRot"] = 0,
			["yRot"] = 270.0,
			["zRot"] = 60.0,
		},
		["prop-anim"] = {
			["prop-dics"] = "anim@heists@narcotics@trash",
			["prop-name"] = "walk"
		}
	},
	{
		["name"] = Lang:t("drawtext.boxrearrightdoor"),
		["code-name"] = "arka_sag_kapi_kutu",
		["time"] = 2500,
		["time-name"] = Lang:t("drawtext.boxingtherearrightdoor"),
		["coordinate"] = {
			["x"] = -556.23,
			["y"] = -1704.21,
			["z"] = 19.06,
			["h"] = 114.17,
		},
		["animation"] = {
			["scenario"] = false,
			["anim-disc"] = "anim@heists@load_box",
			["anim-name"] = "load_box_3"
		},
		["prop"] =  "sil",
	},
	{
		["name"] = Lang:t("drawtext.trunk"),
		["code-name"] = "bagaj",
		["time"] = 3000,
		["time-name"] = Lang:t("drawtext.youdismantletheluggage"),
		["parca-native-no"] = 5,
		["coordinate"] = {
			["x"] = -555.21,
			["y"] = -1697.39,
			["z"] = 19.18,
			["h"] = 75.46,
		},
		["animation"] = {
			["scenario"] = true,
			["scenario-anim"] = "PROP_HUMAN_BUM_BIN"
		},
		["prop"] =  "prop_cs_cardbox_01",
		["entity-attach"] = {
			["bone"] = 28422,
			["xPos"] = 0.0,
			["yPos"] = -0.03,
			["zPos"] = 0.0,
			["xRot"] = 5.0,
			["yRot"] = 0.0,
			["zRot"] = 0.0,
		},
		["prop-anim"] = {
			["prop-dics"] = "anim@heists@box_carry@",
			["prop-name"] = "idle"
		}
	},
	{
		["name"] = Lang:t("drawtext.boxluggage"),
		["code-name"] = "bagaj_kutula",
		["time"] = 2500,
		["time-name"] = Lang:t("drawtext.thetailgateisboxed"),
		["coordinate"] = {
			["x"] = -556.23,
			["y"] = -1704.21,
			["z"] = 19.06,
			["h"] = 114.17,
		},
		["animation"] = {
			["scenario"] = false,
			["anim-disc"] = "anim@heists@load_box",
			["anim-name"] = "load_box_3"
		},
		["prop"] =  "sil",
	},
	{
		["name"] = Lang:t("drawtext.fronthood"),
		["code-name"] = "on_kaput",
		["time"] = 3000,
		["time-name"] = Lang:t("drawtext.youareremovingthefronthood"),
		["parca-native-no"] = 4,
		["coordinate"] = {
			["x"] = -559.76,
			["y"] = -1694.32,
			["z"] = 19.15,
			["h"] = 252.67,
		},
		["animation"] = {
			["scenario"] = true,
			["scenario-anim"] = "PROP_HUMAN_BUM_BIN"
		},
		["prop"] =  "prop_cs_cardbox_01",
		["entity-attach"] = {
			["bone"] = 28422,
			["xPos"] = 0.0,
			["yPos"] = -0.03,
			["zPos"] = 0.0,
			["xRot"] = 5.0,
			["yRot"] = 0.0,
			["zRot"] = 0.0,
		},
		["prop-anim"] = {
			["prop-dics"] = "anim@heists@box_carry@",
			["prop-name"] = "idle"
		}
	},
	{
		["name"] = Lang:t("drawtext.boxthefronthood"),
		["code-name"] = "on_kaput_kutula",
		["time"] = 2500,
		["time-name"] = Lang:t("drawtext.fronthoodboxing"),
		["coordinate"] = {
			["x"] = -556.23,
			["y"] = -1704.21,
			["z"] = 19.06,
			["h"] = 114.17,
		},
		["animation"] = {
			["scenario"] = false,
			["anim-disc"] = "anim@heists@load_box",
			["anim-name"] = "load_box_3"
		},
		["prop"] =  "sil",
	},
	{
		["name"] = Lang:t("drawtext.radio"),
		["code-name"] = "radyo",
		["time"] = 3000,
		["time-name"] = Lang:t("drawtext.youdisassembletheradio"),
		["parca-native-no"] = nil,
		["coordinate"] = {
			["x"] = -558.72,
			["y"] = -1696.33,
			["z"] = 19.13,
			["h"] = 313.86,
		},
		["animation"] = {
			["scenario"] = true,
			["scenario-anim"] = "PROP_HUMAN_BUM_BIN"
		},
		["prop"] =  "prop_cs_cardbox_01",
		["entity-attach"] = {
			["bone"] = 28422,
			["xPos"] = 0.0,
			["yPos"] = -0.03,
			["zPos"] = 0.0,
			["xRot"] = 5.0,
			["yRot"] = 0.0,
			["zRot"] = 0.0,
		},	
		["prop-anim"] = {
			["prop-dics"] = "anim@heists@box_carry@",
			["prop-name"] = "idle"
		}
	},
	{
		["name"] = Lang:t("drawtext.radiobox"),
		["code-name"] = "radyo_kutula",
		["time"] = 2500,
		["time-name"] = Lang:t("drawtext.radioboxing"),
		["coordinate"] = {
			["x"] = -556.23,
			["y"] = -1704.21,
			["z"] = 19.06,
			["h"] = 114.17,
		},
		["animation"] = {
			["scenario"] = false,
			["anim-disc"] = "anim@heists@load_box",
			["anim-name"] = "load_box_3"
		},
		["prop"] =  "sil",
	},
	{
		["name"] = Lang:t("drawtext.getboxedpieces"),
		["code-name"] = "parcaları_al",
		["time"] = 1000,
		["time-name"] = Lang:t("drawtext.collectingboxedpieces"),
		["coordinate"] = {
			["x"] = -556.23,
			["y"] = -1704.21,
			["z"] = 19.06,
			["h"] = 114.17,
		},
		["animation"] = {
			["scenario"] = false,
			["anim-disc"] = "anim@mp_fireworks",
			["anim-name"] = "place_firework_3_box"
		},
		["prop"] =  "sil",
	}

}

Citizen.CreateThread(function ()
	while true do
		local time = 1000
		if carDismantlingActive then
			local playerPed = PlayerPedId()
			local playercoordinate = GetEntityCoords(playerPed)
			local distance = #(playercoordinate - vector3(carPartDot[process]["coordinate"]["x"], carPartDot[process]["coordinate"]["y"], carPartDot[process]["coordinate"]["z"]))
			if distance < 18 then
				time = 1
				DrawMarker(2, carPartDot[process]["coordinate"]["x"], carPartDot[process]["coordinate"]["y"], carPartDot[process]["coordinate"]["z"]-0.5, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.3, 0.3, 0.3, 255, 0, 0, 100, false, true, 2, false, false, false, false)
				if distance < 2 and not processDrsEating then
					QBCore.Functions.DrawText3D(carPartDot[process]["coordinate"]["x"], carPartDot[process]["coordinate"]["y"], carPartDot[process]["coordinate"]["z"]-0.2, "~w~~g~[E]~w~ " .. carPartDot[process]["name"])
					if IsControlJustPressed(1, 38) then
						processDrsEating = true
						SetEntityHeading(playerPed, carPartDot[process]["coordinate"]["h"])

						if carPartDot[process]["prop"] == "sil" and carPartDot[process]["prop"] ~= "son" then 
							DeleteEntity(newProp)	
							if carPartDot[process]["prop"] == "sil" then
								newProp = CreateObject(`prop_cs_cardbox_01`, carPartDot[process]["coordinate"]["x"], carPartDot[process]["coordinate"]["y"], carPartDot[process]["coordinate"]["z"], true)
								SetEntityCollision(newProp, false, false)
								PlaceObjectOnGroundProperly(newProp)
								if DoesEntityExist(newProp) then
									AttachEntityToEntity(newProp, playerPed, GetPedBoneIndex(playerPed, 28422), 0.0, -0.03, 0.0, 5.0, 0.0, 0.0, true, true, false, true, 1, true)
									ClearPedTasks(PlayerPedId())
								end	
							end
						end

						if carPartDot[process]["animation"]["scenario"] then
							TaskStartScenarioInPlace(playerPed, carPartDot[process]["animation"]["scenario-anim"], 0, true)
						else
								RequestAnimDict(carPartDot[process]["animation"]["anim-disc"] )
								TaskPlayAnim(playerPed, carPartDot[process]["animation"]["anim-disc"], carPartDot[process]["animation"]["anim-name"], 8.0, 8.0, -1, 33, 0, 0, 0, 0)
							--end)
						end

						if carPartDot[process]["parca-native-no"] then
							SetVehicleDoorOpen(car, carPartDot[process]["parca-native-no"], false, false)
						end

						QBCore.Functions.Progressbar(carPartDot[process]["code-name"], carPartDot[process]["time-name"], carPartDot[process]["time"], false, true, { --p1: menu name, p2: text, p3: use while dead, p4: cancelable
							disableMovement = true,
							disableCarMovement = true,
							disableMouse = false,
							disableCombat = true,
						}, {}, {}, {}, function() -- Done
							ClearPedTasksImmediately(playerPed)
							if carPartDot[process]["prop"] ~= "sil" and carPartDot[process]["prop"] ~= "son" then
								newProp = CreateObject(GetHashKey(carPartDot[process]["prop"]), carPartDot[process]["coordinate"]["x"], carPartDot[process]["coordinate"]["y"], carPartDot[process]["coordinate"]["z"], true)
								SetEntityCollision(newProp, false, false)
								PlaceObjectOnGroundProperly(newProp)
								if DoesEntityExist(newProp) then
									AttachEntityToEntity(newProp, playerPed, GetPedBoneIndex(playerPed, carPartDot[process]["entity-attach"]["bone"]), carPartDot[process]["entity-attach"]["xPos"], carPartDot[process]["entity-attach"]["yPos"], carPartDot[process]["entity-attach"]["zPos"], carPartDot[process]["entity-attach"]["xRot"], carPartDot[process]["entity-attach"]["yRot"], carPartDot[process]["entity-attach"]["zRot"], true, true, false, true, 1, true)
									ClearPedTasks(PlayerPedId())
								end

								RequestAnimDict(carPartDot[process]["prop-anim"]["prop-dics"])
									TaskPlayAnim(playerPed, carPartDot[process]["prop-anim"]["prop-dics"], carPartDot[process]["prop-anim"]["prop-name"], 8.0, 8.0, -1, 50, 0, false, false, false)
								--end)	
							elseif carPartDot[process]["prop"] == "sil" then
								DeleteEntity(newProp)	
							end

							if carPartDot[process]["parca-native-no"] then
								SetVehicleDoorBroken(car, carPartDot[process]["parca-native-no"], true)
							end
							
							if process == #carPartDot then
								carDismantlingActive = true
								FinishedChopping()
							elseif process == 3 then
								if math.random(1,100) < 50 then
									exports[Config.dispatch]:chopcar()
								end
							end
							processDrsEating = false
							process = process + 1
							if not backdoor and process == 4 then
								process = process + 4
							end
						end, function() -- Cancel
							processDrsEating = false
							ClearPedTasksImmediately(playerPed)
							if IsEntityAttachedToEntity(newProp, playerPed) then
								DeleteEntity(newProp)
								ClearPedSecondaryTask(playerPed)
							end
						end)

					end
				end
			
			elseif carDismantlingActive then 
				carDismantlingActive = false
				if IsEntityAttachedToEntity(newProp, playerPed) then
					DeleteEntity(newProp)
					ClearPedSecondaryTask(playerPed)
				end
				QBCore.Functions.Notify(Lang:t('error.no_dist'))
			end
		end
		Citizen.Wait(time)
	end
end)

Citizen.CreateThread(function()
	local blip = AddBlipForCoord(-557.64, -1695.82, 19.16)

	SetBlipSprite(blip, 380)
	SetBlipScale(blip, 0.5)
	SetBlipColour(blip, 6)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName('STRING')
	AddTextComponentSubstringPlayerName(Lang:t("blip.vehicleshredding"))
	EndTextCommandSetBlipName(blip)
	--end
end)

CreateThread(function()
	for k,v in pairs(Config.Places) do
        RequestModel(v.pedhash) while not HasModelLoaded(v.pedhash) do Wait(10) end
        local ped = CreatePed("carpartibus_sales", v.pedhash, vector4(v.peddot.x, v.peddot.y, v.peddot.z, v.peddot.w))
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
		TaskStartScenarioInPlace(SurvivalPed, "WORLD_HUMAN_TOURIST_MAP", 0, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        local label = Lang:t("target.label")
        exports['qb-target']:AddCircleZone("carpartibus_sales", vector3(v.tped.x, v.tped.y, v.tped.z), 2.0,{
            name = Lang:t("target.name"),
            useZ = true 
        }, {
            options = {
                {
                    type = "client",
                    event = "rs-vehicleshredding:client:openMenu",
					icon = "fas fa-shop",
                    label = label,
                },
            },
            distance = 2.0
        })
	end
end)


Citizen.CreateThread(function ()
	while true do
		for k,v in pairs(Config.Places) do
		local time = 1000
		local playerPed = PlayerPedId()
		local playercoordinate = GetEntityCoords(playerPed)
		local distance = #(playercoordinate - vector3(v.pdot.x, v.pdot.y, v.pdot.z))

			if not carDismantlingActive and distance then 
				if IsPedSittingInAnyVehicle(PlayerPedId()) then
					if distance < 25.0 then
						time = 1 
						DrawMarker(20, v.pdot.x, v.pdot.y, v.pdot.z, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 255, 0, 0, 155, 0, 0, 2, 0, 0, 0, 0)
						if distance < 1.2 then 
							QBCore.Functions.DrawText3D(v.pdot.x, v.pdot.y, v.pdot.z - 0.1, tostring(Lang:t("drawtext.smashthecar")))
							if IsControlJustPressed(0, 46) and not clientcooldown then
								if CurrentCops >= Config.MinimumCops then
									StartChopThisCar()
								else
									QBCore.Functions.Notify(Lang:t('error.no_cops'))
								end
							elseif IsControlJustPressed(0, 46) and clientcooldown then
								QBCore.Functions.Notify(Lang:t('error.no_cartheif'))
							end
						end
					end
				end
			end
		end
	Citizen.Wait(time)
	end
end)

Citizen.CreateThread(function ()
	while true do
		if clientcooldown then
			Citizen.Wait(1800000) -- Citizen.Wait(1800000) -- 1800000
			clientcooldown = false
		end 
		Citizen.Wait(1000)
	end
end)

local class = 0
function StartChopThisCar()
	local playerPed = PlayerPedId()
	car = GetVehiclePedIsIn(playerPed, false)
	class = GetVehicleClass(car)
	backdoor = false
	if class ~= 8 then
		process = 1

		for i=0, 5 do
			if DoesVehicleHaveDoor(car, i) then
				numberdoors = numberdoors + 1
				SetVehicleDoorOpen(car, i, false, true)
			end
		end

		if numberdoors >= 4 then
			backdoor = true
		end

		SetEntityCoords(car, -557.64, -1695.82, 19.16)
		SetEntityHeading(car, 27.77)
		SetEntityAsMissionEntity(car, true, true)
		TaskLeaveVehicle(playerPed, car, 256)
		SetVehicleDoorsLocked(car, 2)
		carDismantlingActive = true
		clientcooldown = true
	--end
  end
end

RegisterNetEvent('rs-vehicleshredding:client:openMenu', function()
            local chopShop = {
                {
                    header = Lang:t('info.title'),
                    isMenuHeader = true,
                },
                {
                    header = Lang:t('info.sell'),
                    txt = Lang:t('info.sell_chop'),
                    params = {
                        event = 'rs-vehicleshredding:client:openChop',
                        args = {
                            items = Config.ChopItems
                        }
                    }
                }
            }
    exports['qb-menu']:openMenu(chopShop)
        local chopShop = {
            {
                header = Lang:t('info.title'),
                isMenuHeader = true,
            },
            {
                header = Lang:t('info.sell'),
                txt = Lang:t('info.sell_chop'),
                params = {
                    event = 'rs-vehicleshredding:client:openChop',
                    args = {
                        items = Config.ChopItems
                    }
                }
            }
        }
        exports['qb-menu']:openMenu(chopShop)
end)

RegisterNetEvent('rs-vehicleshredding:client:openChop', function(data)
    QBCore.Functions.TriggerCallback('rs-vehicleshredding:server:getInv', function(inventory)
        local PlyInv = inventory
        local chopMenu = {
            {
                header = Lang:t('info.title'),
                isMenuHeader = true,
            }
        }
        for _, v in pairs(PlyInv) do
            for i = 1, #data.items do
                if v.name == data.items[i].item then
                    chopMenu[#chopMenu + 1] = {
                        header = QBCore.Shared.Items[v.name].label,
                        txt = Lang:t('info.sell_items', { value = data.items[i].price }),
                        params = {
                            event = 'rs-vehicleshredding:client:chopitems',
                            args = {
                                label = QBCore.Shared.Items[v.name].label,
                                price = data.items[i].price,
                                name = v.name,
                                amount = v.amount
                            }
                        }
                    }
                end
            end
        end
        chopMenu[#chopMenu + 1] = {
            header = Lang:t('info.back'),
            params = {
                event = 'rs-vehicleshredding:client:openMenu'
            }
        }
        exports['qb-menu']:openMenu(chopMenu)
    end)
end)


RegisterNetEvent('rs-vehicleshredding:client:chopitems', function(item)
    local sellingItem = exports['qb-input']:ShowInput({
        header = Lang:t('info.title'),
        submitText = Lang:t('info.sell'),
        inputs = {
            {
                type = 'number',
                isRequired = false,
                name = 'amount',
                text = Lang:t('info.max', { value = item.amount })
            }
        }
    })
     if sellingItem then
         if not sellingItem.amount then
             return
         end

        if tonumber(sellingItem.amount) > 0 then
            TriggerServerEvent('rs-vehicleshredding:server:sellItems', item.name, sellingItem.amount, item.price)
        else
            QBCore.Functions.Notify(Lang:t('error.negative'), 'error')
        end
    end
end)


RegisterNetEvent('police:SetCopCount', function(amount)
    CurrentCops = amount
end)

function FinishedChopping()
	carDismantlingActive = false
	DeleteEntity(car)
	TriggerServerEvent("rs-vehicleshredding:giveitem", class)
	TriggerServerEvent('ak4y-blackmarket:taskCountAdd', 2, 1)
end