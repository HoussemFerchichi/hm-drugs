fx_version 'adamant'

game 'gta5'

author 'Houssem'
description 'Gang Turf Made By houssem'

ui_page 'web/ui.html'


shared_script 'config.lua'

client_scripts {
	'client.lua'
}

server_scripts {
	'server.lua',
	'@mysql-async/lib/MySQL.lua',
}server_scripts { '@mysql-async/lib/MySQL.lua' }