--[[
--- Created: 23/12/2023 15:04
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


_cn.ApplicationScopeProducer = "ApplicationScopeProducer"
classloaded(_cn.ApplicationScopeProducer)

---@type DependencyInjection
local DependencyInjection = import("DependencyInjection")

---@class ApplicationScopeProducer : BaseObject
local ApplicationScopeProducer = extends("ApplicationScopeProducer","Producer",true)

--- Attributs ---

--- Methods ---

function ApplicationScopeProducer.new()
    local self = initMetatable(ApplicationScopeProducer);
    local DependencyInjection = getSingleton(DependencyInjection)
    DependencyInjection:registerScope(Enum.Scope.SINGLETON,self)
    return self;
end

function ApplicationScopeProducer:produce(name)
    if not self.instances[name] then
        local class = getClasses()[name]
        self.instances[name] = getSingleton(class);
    end
    return self.instances[name];
end

_c.ApplicationScopeProducer = ApplicationScopeProducer
classloaded(_cn.ApplicationScopeProducer)
singleton(_cn.ApplicationScopeProducer, ApplicationScopeProducer)