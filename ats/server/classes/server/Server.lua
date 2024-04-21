--[[
--- Created: 24/12/2023 15:49
--- Author: Absolute
--Made with ❤
-------
-------
-------
--]]

_cn.Server = "Server"
loadClass(_cn.Server)

--- Imports ---
import("ApplicationScope")
import("ModuleManager")

---@class Server : BaseObject
local Server = class("Server")
_a.ApplicationScope(Server)

--- Attributs ---

_a.Inject(Server,"moduleManager",_c.ModuleManager)
---@type ModuleManager
Server.moduleManager = nil;

--- Methods ---

function Server.new()
    ---@type Server
    local self = initMetatable(Server);
    BasicLog.info("Server starting...");
    self:waitForModules()
    return self;
end

function Server:waitForModules()
    local time = Interface.getGameTimer();
    repeat
        Interface.wait(0);
    until self.moduleManager:allModulesLoaded();
    BasicLog.info("All modules loaded in " .. Interface.getGameTimer() - time .. " ms");
end

_a.NetEvent(Server,"isServerReady")
function Server:isServerReady(source)
    TriggerClientEvent("Client:isServerReady",source);
end

_c.Server = Server
classloaded(_cn.Server)