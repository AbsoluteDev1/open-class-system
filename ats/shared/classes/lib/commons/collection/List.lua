--[[
--- Created: 23/12/2023 09:20
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

_cn.List = "List"
loadClass(_cn.List)

---@class List : BaseObject
local List = class("List")

---@return List
function List.new(clazz)
    local self = initMetatable(List);
    self.data = {};
    return self;
end

---Pushes an element to the list
---@generic T
---@param clazz T
---@param element T
---@return List
function List:push(clazz,element)
   table.insert(self.data, element);
end

---Removes the last element of the list
function List:pop()
    table.remove(self.data, #self.data);
end

---Removes all elements of the list
function List:clear()
    self.data = {};
end

---Each element of the list
---@generic T
---@param clazz T
---@param callback fun(element:T,index:number)
function List:each(clazz,callback)
    for i = 1, #self.data do
        callback(self.data[i], i);
    end
end

function List:serialize()
    local data = {}
    for k,v in pairs(self.data) do
        if type(v) ~= "function" then
            data[k] = v
        end
    end
    return data
end

function List:deserialize(data)
    for k,v in pairs(data) do
        self[k] = v
    end
end

_c.List = List
classloaded(_cn.List)




