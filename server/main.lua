local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent("apex:updateOnlineTime")
AddEventHandler("apex:updateOnlineTime", function()
    local _source = source
    local Player = QBCore.Functions.GetPlayer(_source)
    if Player ~= nil then
        exports.oxmysql:execute('UPDATE players SET onlinesure = onlinesure + @onlinesure WHERE citizenid = @citizenid',
                {
                    ['@onlinesure'] = 1,
                    ['@citizenid'] = Player.PlayerData.citizenid
                })
    end            
end)

RegisterServerEvent("apex:getOnlineTime")
AddEventHandler("apex:getOnlineTime", function()
    local _source = source
    local Player = QBCore.Functions.GetPlayer(_source)

   local result =  exports.oxmysql:execute('SELECT onlinesure FROM players WHERE citizenid = @citizenid',{['@citizenid'] = Player.PlayerData.citizenid},
    function(result)
    local onlinesure = result[1].onlinesure
    local saat = 0
    if onlinesure >= 60 then
        while onlinesure >= 60 do
        saat =  saat + 1
        onlinesure = onlinesure - 60
        end
    end
    if saat > 0 then
        TriggerClientEvent('QBCore:Notify', _source, { type = 'inform', text = 'Toplam sunucuda geçirdiğin süre: '..saat..' saat '..onlinesure..' dakika', length = 6000, style = { ['background-color'] = '#00CC00', ['color'] = '#000000' } })
    else
        TriggerClientEvent('QBCore:Notify', _source, { type = 'inform', text = 'Toplam sunucuda geçirdiğin süre: '..onlinesure..' dakika', length = 6000, style = { ['background-color'] = '#00CC00', ['color'] = '#000000' } })
    end
    end)
end)

RegisterServerEvent("apex:GiveCoin")
AddEventHandler("apex:GiveCoin", function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)
    local result =exports.oxmysql:execute('SELECT onlinesure FROM players WHERE citizenid = @citizenid',{['@citizenid'] = Player.PlayerData.citizenid},
    function(result)
        local onlinesure = result[1].onlinesure
        if onlinesure%Config.GiveCoinTime ==0  then
            Player.Functions.AddItem(Config.CoinName, Config.GiveCoinAmount, nil, info)
            TriggerClientEvent('QBCore:Notify',source , { type = 'inform', text = Config.GiveCoinAmount..' Adet Apex Coin Aldınız', length = 6000, style = { ['background-color'] = '#00CC00', ['color'] = '#000000' } })
        end
    end)
end)

RegisterServerEvent("apex:GiveItem")
AddEventHandler("apex:GiveItem", function (name)
    _name = name
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem(_name ,1 ,nil , info)
    Player.Functions.RemoveItem(Config.CoinName, 1, nil)
    TriggerClientEvent('QBCore:Notify',src , { type = 'inform', text = _name..'Aldınız', length = 6000, style = { ['background-color'] = '#00CC00', ['color'] = '#000000' } })
    
end)

RegisterServerEvent("apex:MoneyConvert")
AddEventHandler("apex:MoneyConvert", function (type)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local _type = type
    if _type == "white" then
    local result = Config.ApexCoinConvert * 5
    if Player.Functions.RemoveItem('apex',5,"test") then
        Player.Functions.AddMoney('bank', result, "test")
        TriggerClientEvent('QBCore:Notify',src , { type = 'inform', text = 'Paranız bankanıza yatırıldı', length = 6000, style = { ['background-color'] = '#00CC00', ['color'] = '#000000' } })
    else 
       TriggerClientEvent('QBCore:Notify', src, "üzerinizde yeterli apex coin yok", 'warning', 6000)
    end
    else if _type == "black" then
    local result = Config.ApexCoinConvert * 5
        if Player.Functions.RemoveItem('apex',5,"test") then
            Player.Functions.AddMoney('cash', result, "test")
            TriggerClientEvent('QBCore:Notify',src , { type = 'inform', text = 'Paranız teslim edildi.', length = 6000, style = { ['background-color'] = '#00CC00', ['color'] = '#000000' } })
        else 
           TriggerClientEvent('QBCore:Notify', src, "üzerinizde yeterli apex coin yok", 'warning', 6000)
          end
        end
    end
end)

RegisterServerEvent("apex:Pack")
AddEventHandler("apex:Pack", function (title)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local _title = title
    local random = math.random(1,3)
   
    for _, v in pairs(Config.ApexPack) do
        if _title == v.header then
            local items = v.items
           for _, x in ipairs(items) do
            if x.id == random then
                Player.Functions.AddItem(x.itemName, 1, nil)
                Player.Functions.RemoveItem(Config.CoinName, x.price, nil)
                TriggerClientEvent('QBCore:Notify',source , { type = 'inform', text = x.itemName..' Aldınız', length = 6000, style = { ['background-color'] = '#00CC00', ['color'] = '#000000' } })
                break
               end
           end
        end
    end
end)