QBCore = exports['qb-core']:GetCoreObject() -- Core
local lastCd = 0

RegisterServerEvent("rs-vehicleshredding:giveitem")
AddEventHandler("rs-vehicleshredding:giveitem", function(class)
    local src = source
        local xPlayer = QBCore.Functions.GetPlayer(src)
        if xPlayer then
            local normalrim = math.random(2, 4)
            local qualityrims = math.random(2, 4)
            local doors = math.random(1,2)
            local speaker = math.random(2,4)

            if math.random(0, 100) < 40 then 
                xPlayer.Functions.AddItem('splaka', 1)
            end

            if math.random(0, 100) > 80 then
                xPlayer.Functions.AddItem('lockpick', 1)
            end

            if math.random(0, 100) > 50 then
                xPlayer.Functions.AddItem('belt', 1)
            end

            xPlayer.Functions.AddItem('battery', 1)


            xPlayer.Functions.AddItem('speaker', speaker)
            xPlayer.Functions.AddItem('doors', doors)
        
            if not class == 8 and not class == 4 then
                xPlayer.Functions.AddItem('airbag', 1)
            end

            if class == 7 or class == 6 then
                xPlayer.Functions.AddItem('highradio', 1)
                xPlayer.Functions.AddItem('highrim', qualityrims)
                -- if math.random(0, 100) > 98 then 
                --     xPlayer.Functions.AddItem('labcard', doors)
                -- end
            else
                xPlayer.Functions.AddItem('lowradio', 1)
                xPlayer.Functions.AddItem('stockrim', normalrim)
        end
    end
end)


RegisterNetEvent('rs-vehicleshredding:server:sellItems', function(itemName, itemAmount, itemPrice)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local totalPrice = (tonumber(itemAmount) * itemPrice)
    if Player.Functions.RemoveItem(itemName, tonumber(itemAmount)) then
        if Config.BankMoney then
            Player.Functions.AddMoney('bank', totalPrice)
        else
            Player.Functions.AddMoney('cash', totalPrice)
        end
        TriggerClientEvent('QBCore:Notify', src, Lang:t('success.sold', { value = tonumber(itemAmount), value2 = QBCore.Shared.Items[itemName].label, value3 = totalPrice }),'success')
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[itemName], 'remove')
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.no_items'), 'error')
    end
    TriggerClientEvent('rs-vehicleshredding:client:openMenu', src)
end)


QBCore.Functions.CreateCallback('rs-vehicleshredding:server:getInv', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    local inventory = Player.PlayerData.items
    return cb(inventory)
end)


QBCore.Functions.CreateCallback('rs-vehicleshredding:check-cd', function(source, cb)
    if lastCd == 0 or (os.time() - lastCd) > 60 then 
        lastCd = os.time()
        cb(true)
    else
        cb(false)
    end
end)