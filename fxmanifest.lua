fx_version 'cerulean'
game 'gta5' 

author 'Apex'
description 'Apex Reward System'


client_script {
    'client/main.lua',
}
shared_script "config.lua"

server_script {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua'
}
