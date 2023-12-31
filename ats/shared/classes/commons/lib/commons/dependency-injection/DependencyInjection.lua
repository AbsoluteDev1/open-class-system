--[[
--- Created: 23/12/2023 14:29
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

_cn.DependencyInjection = "DependencyInjection"
loadClass(_cn.DependencyInjection)

---@class DependencyInjection : BaseObject
---@field producers table<string,Producer>
---@field instances table<string,BaseObject>
---@field classesScope table<string,string>
local DependencyInjection = class("DependencyInjection")

--- Attributs ---

DependencyInjection.producers = {}
DependencyInjection.instances = {}
DependencyInjection.classesScope = {}

--- Methods ---

function DependencyInjection.new()
    ---@type DependencyInjection
    local self = initMetatable(DependencyInjection);
    return self;
end

function DependencyInjection:registerScope(scope,producer)
    self.producers[scope] = producer;
end

---@param scope 'ApplicationScope'|'SessionScope'
---@param name string
---@param producer Producer
function DependencyInjection:registerProducer(scope,producer)
    self.producers[scope] = producer;
end

---
function DependencyInjection:produce(scope,name,...)
    BasicLog.trace("Producing " .. name .. " in scope " .. scope)

    ---@type Producer
    local producer = self.producers[scope];
    return producer:produce(name,...);
end

function DependencyInjection:inject(name,...)
    BasicLog.trace("Injecting " .. name .. " in scope ", self.classesScope[name])
    return self:produce(self.classesScope[name],name,...);
end

function DependencyInjection:registerInjectableCandidat(className,scope)
    Interface.thread(function()
        while self.producers[scope] == nil do
            Interface.wait(0)
        end
        self.producers[scope]:registerCandidate(className);
        self.classesScope[className] = scope;
        BasicLog.trace("Registered " .. className .. " in scope " .. scope)
    end)
end

_c.DependencyInjection = DependencyInjection
classloaded(_cn.DependencyInjection)
singleton(_cn.DependencyInjection, DependencyInjection)