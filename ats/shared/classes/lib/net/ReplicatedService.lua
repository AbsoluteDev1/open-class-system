--[[
--- Created: 26/12/2023 08:02
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

_cn.ReplicatedService = "ReplicatedService"
loadClass(_cn.ReplicatedService)

--- Imports ---

import(_cn.RemoteEvent)

---@class ReplicatedService : BaseObject
local ReplicatedService = class(_cn.ReplicatedService)
_a.ApplicationScope(ReplicatedService)

--- Attributs ---
---


--- Methods ---

function ReplicatedService.new()
    ---@type ReplicatedService
    local self = initMetatable(ReplicatedService);

    self.rReplicatedObject = _c.RemoteEvent.new("ReplicatedObject")
    self.rChangeReplicatedObject = _c.RemoteEvent.new("ChangeReplicatedObject")
    self.replicatedObjects = {}

    if not Interface.isServer() then
        self.rReplicatedObject.onClient:connect(function(object)
            local class = _c[object.__class__]
            local obj = class.new()
            self.replicatedObjects[object.id] = obj
        end)
        self.rChangeReplicatedObject.onClient:connect(function(object)
            local obj = self.replicatedObjects[object.id]
            for k,v in pairs(object) do
                obj[k] = v
            end
        end)
    else
    end

    return self;
end

_c.ReplicatedService = ReplicatedService
classloaded(_cn.ReplicatedService)