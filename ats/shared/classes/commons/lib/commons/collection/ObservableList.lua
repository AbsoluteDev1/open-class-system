--[[
--- Created: 24/12/2023 14:17
--- Author: Absolute
--Made with ❤
-------
-------


-------
--]]

_cn.ObservableList = "ObservableList"
loadClass(_cn.ObservableList)

---@type Signal
local Signal = import("Signal");

---@class ObservableList : BaseObject
---@field onAdded Signal
---@field onRemoved Signal
---@field onChanged Signal
---@field list table<number, any>
local ObservableList = class("ObservableList",nil,true)

--- Attributs ---

ObservableList.list = {}

--- Methods ---

function ObservableList.new()
    local signalOnAdded = Signal.new();
    local signalOnRemoved = Signal.new();
    local signalOnChanged = Signal.new();

    local self = initMetatable(ObservableList);
    self.onAdded = signalOnAdded;
    self.onRemoved = signalOnRemoved;
    self.onChanged = signalOnChanged;

    return self;
end

function ObservableList:add(item)
    table.insert(self.list, item);
    self.onAdded:fire(item);
    self.onChanged:fire(item);
end

function ObservableList:remove(item)
    for i, v in ipairs(self.list) do
        if v == item then
            table.remove(self.list, i);
            self.onRemoved:fire(item);
            self.onChanged:fire(item);
            return;
        end
    end
end

function ObservableList:clear()
    for i, v in ipairs(self.list) do
        self:remove(v);
    end
end

function ObservableList:contains(item)
    for i, v in ipairs(self.list) do
        if v == item then
            return true;
        end
    end
    return false;
end

function ObservableList:count()
    return #self.list;
end

---@generic T
---@param clazz T
---@param func fun(item:T):boolean
function ObservableList:forEach(clazz,func)
    for i, v in ipairs(self.list) do
        func(v);
    end
end

---@generic T
---@param clazz T
---@param func fun(item:T):boolean
---@return T | nil
function ObservableList:find(clazz,func)
    for i, v in ipairs(self.list) do
        if func(v) then
            return v;
        end
    end
    return nil;
end

function ObservableList:serialize()
    local data = {}
    for k,v in pairs(self.list) do
        if type(v) ~= "function" then
            data[k] = v
        end
    end
    return data
end

function ObservableList:deserialize(data)
    for k,v in pairs(data) do
        if type(v) ~= "function" then
            self.list[k] = v
        end
    end
end

_c.ObservableList = ObservableList
classloaded(_cn.ObservableList)