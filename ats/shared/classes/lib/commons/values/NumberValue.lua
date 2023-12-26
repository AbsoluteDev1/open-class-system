--[[
--- Created: 25/12/2023 09:56
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

_cn.NumberValue = "NumberValue"
loadClass(_cn.NumberValue)

--- Imports ---


---@class NumberValue : BaseObject
local NumberValue = class("NumberValue")

--- Attributs ---

NumberValue.value = 0;

--- Methods ---

function NumberValue.new(value)



    ---@type NumberValue
    local self = initMetatable(NumberValue);

    self.value = value

    return self;
end

_c.NumberValue = NumberValue
classloaded(_cn.NumberValue)