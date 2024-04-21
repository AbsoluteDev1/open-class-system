--[[
--- Created: 25/12/2023 00:24
--- Author: Absolute
--Made with ❤
-------
-------


-------
--]]

_cn.System = "System"
loadClass(_cn.System)

--- Imports ---


---@class System : BaseObject
local System = class("System")
_a.ApplicationScope(System)
--- Attributs ---


--- Methods ---

function System.new()
    ---@type System
    local self = initMetatable(System);
    BasicLog.info(string.format("^2Class system initialized in %d ms", Interface.getGameTimer() - Interface.startTime))

    return self;
end

_c.System = System
classloaded(_cn.System)