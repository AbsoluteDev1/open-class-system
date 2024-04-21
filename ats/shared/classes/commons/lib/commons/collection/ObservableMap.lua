--[[
--- Created: 24/12/2023 14:32
--- Author: Absolute
--Made with ❤
-------
-------


-------
--]]

_cn.ObservableMap = "ObservableMap"
loadClass(_cn.ObservableMap)

---@type Signal
local Signal = import("Signal");

---@class ObservableMap : BaseObject
---@field onPut Signal
---@field onRemove Signal
---@field data table<any, any>
local ObservableMap = class("ObservableMap")

--- Attributs ---

ObservableMap.data = {}

--- Methods ---

function ObservableMap.new()
    ---@type ObservableMap
    local self = initMetatable(ObservableMap);

    self.onPut = Signal.new();
    self.onRemove = Signal.new();

    return self;
end

function ObservableMap:put(key, value)
    self.data[key] = value;
    self.onPut:fire(key, value);
end

function ObservableMap:remove(key)
    local value = self.data[key];
    self.data[key] = nil;
    self.onRemove:fire(key, value);
end

function ObservableMap:get(key)
    return self.data[key];
end

function ObservableMap:containsKey(key)
    return self.data[key] ~= nil;
end

function ObservableMap:containsValue(value)
    for _, v in pairs(self.data) do
        if v == value then
            return true;
        end
    end
    return false;
end

---@return table<number, any>
function ObservableMap:keys()
    local keys = {};
    for k, _ in pairs(self.data) do
        table.insert(keys, k);
    end
    return keys;
end

---@return table<number, any>
function ObservableMap:values()
    local values = {};
    for _, v in pairs(self.data) do
        table.insert(values, v);
    end
    return values;
end

_c.ObservableMap = ObservableMap
classloaded(_cn.ObservableMap )