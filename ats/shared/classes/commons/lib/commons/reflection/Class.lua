--[[
--- Created: 23/12/2023 21:28
--- Author: Absolute
--Made with ❤
-------
-------


-------
--]]

_cn.Class = "Class"
loadClass(_cn.Class)

---@type StringUtils
local StringUtils = import("StringUtils");

---@class Class : BaseObject
local Class = class("Class")

--- Attributs ---


--- Methods ---

---@param className string
function Class.new(className)
    local self = initMetatable(Class);
    self.className = className;
    return self;
end

function Class:getClassName()
    return self.className;
end

function Class:isInstanceOf(class)
    return self.className == class:getClassName();
end

function Class:getAttributes()
    local attr = {};
    local class = getClassByName(self.className);
    for k,v in pairs(class) do
        if type(v) ~= "function" and not StringUtils:startsWith(k,"__") then
            attr[k] = v;
        end
    end
    return attr;
end

function Class:getMetaInfo()
    local attr = {};
    local class = getClassByName(self.className);
    for k,v in pairs(class) do
        if type(v) == "function" and StringUtils:startsWith(k,"__") then
            attr[k] = v;
        end
    end
    return attr;
end

function Class:getMethods()
    local attr = {};
    local class = getClassByName(self.className);
    for k,v in pairs(class) do
        if type(v) == "function" and not StringUtils:startsWith(k,"__") then
            attr[k] = v;
        end
    end
    return attr;
end

_c.Class = Class
classloaded(_cn.Class)