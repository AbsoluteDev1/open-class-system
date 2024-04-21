
Dev = "dev";

fx_version 'bodacious'
games { 'gta5', 'rdr3' }

author 'Absolute'
description 'qx class system'
version '0.0.1'

--ui_page 'http://localhost:4200/web'
ui_page 'web/index.html'
lua54 'yes'

files{

}
shared_scripts {
    "core/**",
    "shared/classes/**",
}

server_scripts{
    "server/classes/**",
}
client_scripts {
    "client/classes/**",
}
