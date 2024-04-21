--[[
--- Created: 25/12/2023 10:01
--- Author: Absolute
--Made with ❤
-------
-------


-------
--]]

_cn.BaseValue = "BaseValue"
loadClass(_cn.BaseValue)

--- Imports ---

import("Signal")
import("BindedValue")

---@class BaseValue : BaseObject
local BaseValue = class("BaseValue")

--- Attributs ---

BaseValue.value = nil;

--- Methods ---

function BaseValue.new(value)

    ---@type BaseValue
    local self = initMetatable(BaseValue);
    local signal = _c.Signal.new();
    self.value = value
    self.onValueChanged = signal;
    self.changed:connect(function(attr)
        if attr == "value" then
            self.onValueChanged:fire(self.value)
        end
    end)
    return self;
end

function BaseValue:setValue(value)
    self.value = value;
end

function BaseValue:getValue()
    return self.value;
end

---@param otherBaseValue BaseValue
function BaseValue:bind(otherBaseValue)
    self:setValue(otherBaseValue:getValue())

end



_c.BaseValue = BaseValue
classloaded(_cn.BaseValue)