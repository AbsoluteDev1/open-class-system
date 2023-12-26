--[[
--- Created: 25/12/2023 09:32
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

_cn.Argument = "Argument"
loadClass(_cn.Argument)

--- Imports ---


---@class Argument : BaseObject
local Argument = class("Argument")

--- Attributs ---

_a.NotEmptyAnnotation(Argument, "name")
Argument.name = "DefaultName"
Argument.description = ""
Argument.args = {}

--- Methods ---

function Argument.new()
    ---@type Argument
    local self = initMetatable(Argument);

    return self;
end

function Argument:named(name)
    self.name = name;
    return self;
end

---@param description string
---@return Argument
function Argument:describe(description)
    self.description = description;
    return self;
end

---@param argument Argument
---@return Argument
function Argument:addArgument(argument)
    table.insert(self.args,argument);
    return self;
end

_c.Argument = Argument
classloaded(_cn.Argument)