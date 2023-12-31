--[[
--- Created: 25/12/2023 09:24
--- Author: Absolute
--Made with ❤
-------
-------
--Copyright (c) Qinoxe, All Rights Reserved.
--This file is part of Qinoxe project.
--Unauthorized using, copying, modifying and/or distributing of this file
--via any medium is strictly prohibited. This code is confidential.
-------
--]]

_cn.Command = "Command"
loadClass(_cn.Command)

--- Imports ---


---@class Command : BaseObject
local Command = class("Command")

--- Attributs ---


--- Methods ---

function Command.new()
    ---@type Command
    local self = initMetatable(Command);
    self.name = "";
    self.description = "";
    self.args = {}
    return self;
end

---@param name string
---@return Command
function Command:named(name)
    self.name = name;
    return self;
end

---@param description string
---@return Command
function Command:describe(description)
    self.description = description;
end

---@param callback fun(player:Player, args:any)
---@return Command
function Command:onUse(callback)
    self.callback = callback;
end

function Command:execute()
    error("Command:execute() must be overrided");
end

---@param arg Argument
---@return Command
function Command:addArgument(arg)
    table.insert(self.args,arg);
    return self;
end

_c.Command = Command
classloaded(_cn.Command)