--[[
--- Created: 25/12/2023 10:07
--- Author: Absolute
--Made with ❤
-------
-------


-------
--]]

_cn.BindedValue = "BindedValue"
loadClass(_cn.BindedValue)

--- Imports ---


---@class BindedValue : BaseObject
---@field value BaseValue
---@field bindedValue BaseValue
local BindedValue = class("BindedValue")

--- Attributs ---

BindedValue.value = nil;
BindedValue.bindedValue = nil;

--- Methods ---

function BindedValue.new(baseValue)
    ---@type BindedValue
    local self = initMetatable(BindedValue);

    self.value = baseValue;

    return self;
end

function BindedValue:multiplyBy(numberValue)
    self.value.onValueChanged:connect(function(value)
        self.bindedValue:setValue(value * numberValue:getValue())
    end)
end

_c.BindedValue = BindedValue
classloaded(_cn.BindedValue)