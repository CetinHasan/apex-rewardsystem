Config = {} -- 
Config.interaction = false -- Make it false if you want it to run by command
Config.CommandName ="apex" --Command that allows the user to see the total hours spent on the server
Config.MenuCommandName = "apexmenu" --The command of the market where the user will spend the apex coins earned
Config.Keybinds = 168 --https://docs.fivem.net/docs/game-references/controls/
Config.CoinName = "apex"  
Config.GiveCoinTime = 60 --you can set how long it takes for coins to be issued here
Config.GiveCoinAmount = 5 --how much coin will be given in the specified time
Config.ApexCoinConvert = 15000 --The currency equivalent of the Apex coin in the game
Config.ApexBoxItemCount = 10 --Keep the quantity of products in Apex boxes the same in all boxes



-- MENU TİTLE --

Config.Title = 'Apex Reward System'

Config.MenuList = {
    [1] = {title = 'Car', icon = 'fa-solid fa-car', label = 'You can buy Car with Apex coins', id =1},
    [2] = {title = 'Weapon', icon = 'fa-solid fa-gun', label = 'You can buy Weapon with Apex coins', id =2},
    [3] = {title = 'Box', icon = 'fa-solid fa-box', label = 'You can buy Box with Apex coins', id =3},
    [4] = {title = 'Item', icon = 'fa-solid fa-inbox', label = 'You can buy Item with Apex coins', id =4},
    [5] = {title = 'Money', icon = 'fa-solid fa-money-bill', label = 'You can buy Money with Apex coins', id =5},

}
--The vehicle section was disabled for a short time and will be activated again with the update
Config.SubMenuCar = {
    [1] = {title = 'nero',icon = 'fa-solid fa-1', price =100 , label = 'You can buy vehicles with Apex coins', id =1},
    [2] = {title = 'zentorno', icon = 'fa-solid fa-2',price =250 ,label = 'You can buy vehicles with Apex coins', id =1},
    [3] = {title = 'xa21', icon = 'fa-solid fa-3', price =300 ,label = 'You can buy vehicles with Apex coins', id =1},
    [4] = {title = 'adder', icon = 'fa-solid fa-4',price =400 ,label = 'You can buy vehicles with Apex coins', id =1},
    [5] = {title = 'zeno',icon = 'fa-solid fa-5', price =500 ,label = 'You can buy vehicles with Apex coins', id =1},
}

Config.SubMenuWeapon = {
    [1] = {title = 'Pistol',Item ='weapon_pistol',icon = 'fa-solid fa-1',  label = 'You can buy vehicles with Apex coins'},
    [2] = {title = 'Combat Pistol',Item ='weapon_combatpistol', icon = 'fa-solid fa-2', label = 'You can buy vehicles with Apex coins'},
    [3] = {title = 'Sns pistol',Item ='weapon_snspistol', icon = 'fa-solid fa-3', label = 'You can buy vehicles with Apex coins'},
    [4] = {title = 'SMG',Item ='weapon_smg', icon = 'fa-solid fa-4', label = 'You can buy vehicles with Apex coins'},
    [5] = {title = 'Assault Rifle',Item ='weapon_assaultrifle_mk2', icon = 'fa-solid fa-5', label = 'You can buy vehicles with Apex coins'},
}

Config.SubMenuBox = {
    [1] = {title = 'Apex Bronz Pack', icon = 'fa-solid fa-1', label = 'You can buy vehicles with Apex coins'},
    [2] = {title = 'Apex Silver Pack', icon = 'fa-solid fa-2', label = 'You can buy vehicles with Apex coins'},
    [3] = {title = 'Apex Gold Pack', icon = 'fa-solid fa-3', label = 'You can buy vehicles with Apex coins'},
    [4] = {title = 'Apex Diamond Pack', icon = 'fa-solid fa-4', label = 'You can buy vehicles with Apex coins'},
    [5] = {title = 'Apex Dark Pack', icon = 'fa-solid fa-5', label = 'You can buy vehicles with Apex coins'},
    
}

Config.SubMenuItem = {
    [1] = {title = 'Pistol', Item ='weapon_pistol', price = 10 , icon = 'fa-solid fa-1', label = 'You can buy vehicles with Apex coins', id =1},
    [2] = {title = 'Bandage',Item ='bandage' ,price = 3 , icon = 'fa-solid fa-2', label = 'You can buy vehicles with Apex coins', id =2},
    [3] = {title = 'Lockpick',Item ='Lockpick' ,price = 2 , icon = 'fa-solid fa-3', label = 'You can buy vehicles with Apex coins', id =3},
    [4] = {title = 'Bag', Item ='bag' ,price = 1 , icon = 'fa-solid fa-4', label = 'You can buy vehicles with Apex coins', id =4},
    [5] = {title = 'wine',Item ='wine' ,price = 2 , icon = 'fa-solid fa-5', label = 'You can buy vehicles with Apex coins', id =5},
}
--You can adjust the products included in Apex packages here
Config.ApexPack = {
        [1] = {
            event = "apex:client:Pack",
            header = "Apex Bronz Pack",
            items = {
                [1] = {
                    label = "Şarap (7$)",--The name of the item that appears on the UI side
                    id = 1,
                    description = "",
                    itemName = "wine",--QBCore item name will be written
                    price = 7,
                },
                [2] = {
                    label = "Kereste (15$)",
                    id = 2,
                    description = "",
                    itemName = "apex",
                    price = 15,
                },
                [3] = {
                    label = "Paketlenmiş Tavuk (30$)",
                    id = 3,
                    description = "",
                    itemName = "iron",
                    price = 30,
                },
            },
        },
        [2] = {
            event = "apex:client:Pack",
            header = "Apex Silver Pack",
            items = {
                [1] = {
                    label = "Şarap (7$)",
                    id = 1,
                    description = "",
                    itemName = "weapon_combatpistol",
                    price = 7,
                },
                [2] = {
                    label = "Kereste (15$)",
                    id = 2,
                    description = "",
                    itemName = "weapon_appistol",
                    price = 15,
                },
                [3] = {
                    label = "Paketlenmiş Tavuk (30$)",
                    id = 3,
                    description = "",
                    itemName = "weapon_heavypistol",
                    price = 30,
                },
    
            },
        },
        [3] = {
            event = "apex:client:Pack",
            header = "Apex Gold Pack",
            items = {
                [1] = {
                    label = "Şarap (7$)",
                    id = 1,
                    description = "",
                    itemName = "wine",
                    price = 7,
                },
                [2] = {
                    label = "Kereste (15$)",
                    id = 2,
                    description = "",
                    itemName = "apex",
                    price = 15,
                },
                [3] = {
                    label = "Paketlenmiş Tavuk (30$)",
                    id = 3,
                    description = "",
                    itemName = "iron",
                    price = 30,
                },
    
            },
        },
        [4] = {
            event = "apex:client:Pack",
            header = "Apex Diamond Pack",
            items = {
                [1] = {
                    label = "Şarap (7$)",
                    id = 1,
                    description = "",
                    itemName = "wine",
                    price = 7,
                },
                [2] = {
                    label = "Kereste (15$)",
                    id = 2,
                    description = "",
                    itemName = "apex",
                    price = 15,
                },
                [3] = {
                    label = "Paketlenmiş Tavuk (30$)",
                    id = 3,
                    description = "",
                    itemName = "iron",
                    price = 30,
                },
    
            },
        },
        [5] = {
            event = "apex:client:Pack",
            header = "Apex Dark Pack",
            items = {
                [1] = {
                    label = "Şarap (7$)",
                    id = 1,
                    description = "",
                    itemName = "wine",
                    price = 7,
                },
                [2] = {
                    label = "Kereste (15$)",
                    id = 2,
                    description = "",
                    itemName = "apex",
                    price = 15,
                },
                [3] = {
                    label = "Paketlenmiş Tavuk (30$)",
                    id = 3,
                    description = "",
                    itemName = "iron",
                    price = 30,
                },
    
            },
        },
}


