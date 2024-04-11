local QBCore = exports['qb-core']:GetCoreObject()
RegisterCommand(Config.CommandName, function()
    TriggerServerEvent('apex:getOnlineTime')
end)

Citizen.CreateThread(function()
    if Config.interaction == false then
    while true do
        Citizen.Wait(10)
        if IsControlPressed(0, Config.Keybinds) then
            TriggerEvent('qb-menu:client:mainMenu',function ()
            end)
        end
    end
    elseif Config.interaction == true then 
    RegisterCommand(Config.MenuCommandName, function ()
       TriggerEvent('qb-menu:client:mainMenu',function ()
         end)
      end)
   end 
end)



Citizen.CreateThread(function()
    while true do
        Citizen.Wait(60000)
        TriggerServerEvent('apex:updateOnlineTime')
        Citizen.Wait(1000)
        TriggerServerEvent('apex:GiveCoin')
    end
end)

RegisterNetEvent("qb-menu:client:mainMenu", function ()
    local ApexMenu = {
        {
            header = 'Apex Reward System',
            icon = 'fas fa-code',
            isMenuHeader = true
        },
        
    }
    for _, v in pairs(Config.MenuList) do
        ApexMenu[#ApexMenu + 1] = {
            header = v.title,
            txt = v.label,
            icon = v.icon,
            params = {
                id = v.id,
                event = "qb-menu:client:subMenu"..v.id,
                args = {
                    id = v.id,
                }
            }
        }
    end
    exports['qb-menu']:openMenu(ApexMenu)
end)

RegisterNetEvent('qb-menu:client:subMenu1', function()
    local subMenu = {
        {
            header = 'Apex Reward System',
            icon = 'fas fa-code',
            isMenuHeader = true
        },
        {
            header = 'Return to main menu',
            icon = 'fa-solid fa-backward',
            params = {
                event = 'qb-menu:client:mainMenu',
                args = {}
            }
        },
    }
    for _, v in pairs(Config.MenuList) do
        
        if v.id ==1 then
            for _, v in pairs(Config.SubMenuCar) do
                subMenu[#subMenu + 1] = {
                    header = v.title,
                    txt = v.label,
                    icon = v.icon,
                    params = {
                        id = v.id,
                        event = "apex:client:GiveVehicle",
                        args = {
                            title =v.title,
                            price = v.price
                        }
                    }
                }
            end
        end
    end
        
    exports['qb-menu']:openMenu(subMenu)
end)

RegisterNetEvent('qb-menu:client:subMenu2', function()
 
    local subMenu = {
        {
            header = 'Apex Reward System',
            icon = 'fas fa-code',
            isMenuHeader = true
        },
        {
            header = 'Return to main menu',
            icon = 'fa-solid fa-backward',
            params = {
                event = 'qb-menu:client:mainMenu',
                args = {}
            }
        },
    }
    for _, v in pairs(Config.MenuList) do
        
        if v.id ==2 then
            for _, v in pairs(Config.SubMenuWeapon) do
                subMenu[#subMenu + 1] = {
                    header = v.title,
                    txt = v.label,
                    icon = v.icon,
                    params = {
                        id = v.id,
                        event = "apex:client:GiveWeapon",
                        args = {
                            Item = v.Item,
                        }
                    }
                }
            end
        end
    end
        
    exports['qb-menu']:openMenu(subMenu)
end)

RegisterNetEvent('qb-menu:client:subMenu3', function()
  
    local subMenu = {
        {
            header = 'Apex Reward System',
            icon = 'fas fa-code',
            isMenuHeader = true
        },
        {
            header = 'Return to main menu',
            icon = 'fa-solid fa-backward',
            params = {
                event = 'qb-menu:client:mainMenu',
                args = {}
            }
        },
    }
    for _, v in pairs(Config.MenuList) do
        
        if v.id ==3 then
            for _, v in pairs(Config.SubMenuBox) do
                subMenu[#subMenu + 1] = {
                    header = v.title,
                    txt = v.label,
                    icon = v.icon,
                    params = {
                        id = v.id,
                        event = "apex:client:Pack",
                        args = {
                            title = v.title
                        }
                    }
                }
            end
        end
    end
        
    exports['qb-menu']:openMenu(subMenu)
end)

RegisterNetEvent('qb-menu:client:subMenu4', function()

    local subMenu = {
        {
            header = 'Apex Reward System',
            icon = 'fas fa-code',
            isMenuHeader = true
        },
        {
            header = 'Return to main menu',
            icon = 'fa-solid fa-backward',
            params = {
                event = 'qb-menu:client:mainMenu',
                args = {}
            }
        },
    }
    for _, v in pairs(Config.MenuList) do
        
        if v.id ==4 then
            for _, v in pairs(Config.SubMenuItem) do
                subMenu[#subMenu + 1] = {
                    header = v.title,
                    txt = v.label,
                    icon = v.icon,
                    params = {
                        event = "apex:client:GiveItem",
                        args = {
                            id = v.id,
                            Item = v.Item
                        }
                    }
                }
            end
        end
    end
        
    exports['qb-menu']:openMenu(subMenu)
end)

RegisterNetEvent('qb-menu:client:subMenu5', function()

    local subMenu = {
        {
            header = 'Apex Reward System',
            icon = 'fas fa-code',
            isMenuHeader = true
        },
        {
            header = 'Return to main menu',
            icon = 'fa-solid fa-backward',
            params = {
                event = 'qb-menu:client:mainMenu'
            }
        },
        {
            header = 'White Money wash',
            icon = 'fa-solid fa-backward',
            label = 't1',
            params = {
                event = 'apex:client:MoneyConvert',
                args = {
                    type = 'white'
                }
            }
        },
        {
            header = 'Black Money wash',
            icon = 'fa-solid fa-backward',
            label = 't2',
            params = {
                event = 'apex:client:MoneyConvert',
                args = {
                    type = 'black'
                }
            }
        },
    }
    exports['qb-menu']:openMenu(subMenu)
end)


RegisterNetEvent("apex:client:GiveItem", function (data)
TriggerServerEvent("apex:GiveItem", data.Item)
end)

RegisterNetEvent("apex:client:GiveWeapon", function (data)
    print(data.Item)
    TriggerServerEvent("apex:GiveItem", data.Item)
end)

RegisterNetEvent("apex:client:MoneyConvert",function (data)
    TriggerServerEvent("apex:MoneyConvert",data.type)
end)

RegisterNetEvent("apex:client:Pack",function (data)
    TriggerServerEvent("apex:Pack", data.title)
end)



