--[[
--- Created: 23/12/2023 15:23
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

_cn.Producer = "Producer"
loadClass(_cn.Producer)

---@class Producer : BaseObject
local Producer = class(_cn.Producer)

--- Attributs ---

Producer.instances = {}
Producer.classes = {}

--- Methods ---

function Producer.new()
    local self = initMetatable(Producer);

    self.instances = {}

    return self;
end

function Producer:produce(...)
    error("Producer for " .. name .. " not found")
end

function Producer:registerCandidate(name)
    self.classes[name] = true
end

function Producer:Destroy(instanceId)
    self.instances[instanceId] = nil;
end

_c.Producer = Producer
classloaded(_cn.Producer)