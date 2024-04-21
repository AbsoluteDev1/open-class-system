--[[
--- Created: 23/12/2023 15:10
--- Author: Absolute
--Made with ❤
-------
-------


-------
--]]

_cn.SessionScopeProducer = "SessionScopeProducer"
loadClass(_cn.SessionScopeProducer)

---@type DependencyInjection
local DependencyInjection = import("DependencyInjection")

---@class SessionScopeProducer : Producer
local SessionScopeProducer = extends("SessionScopeProducer","Producer",true)

--- Attributs ---

--- Methods ---

function SessionScopeProducer.new()
    local self = initMetatable(SessionScopeProducer);
    local DependencyInjection = getSingleton(DependencyInjection)
    DependencyInjection:registerScope(Enum.Scope.SESSION,self)

    return self;
end

function SessionScopeProducer:produce(name,sessionId)
    if not self.instances[sessionId] then
        self.instances[sessionId] = {}
    end
    if not self.instances[sessionId][name] then
        self.instances[sessionId][name] = getClasses()[name].new();
    end
    return self.instances[sessionId][name];
end

function SessionScopeProducer:Destroy(sessionId)
    self.instances[sessionId] = nil;
end

_c.SessionScopeProducer = SessionScopeProducer
classloaded(_cn.SessionScopeProducer)
singleton(_cn.SessionScopeProducer, SessionScopeProducer)