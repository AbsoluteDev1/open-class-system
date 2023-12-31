--[[
--- Created: 25/12/2023 23:28
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

_cn.ReplicatedObject = "ReplicatedObject"
loadClass(_cn.ReplicatedObject)
local GLOBAL_REPLICATED_ID = 0
--- Imports ---


---@class ReplicatedObject : BaseObject
---@field id number
---@field replicateService ReplicatedService
local ReplicatedObject = class(_cn.ReplicatedObject)

--- Attributs ---
_a.Inject(ReplicatedObject, "replicateService",_c.ReplicatedService)
ReplicatedObject.replicateService = nil;

--- Methods ---

function ReplicatedObject.new()
    ---@type ReplicatedObject
    local self = initMetatable(ReplicatedObject);

    GLOBAL_REPLICATED_ID = GLOBAL_REPLICATED_ID + 1
    self.id = GLOBAL_REPLICATED_ID
    self.replicateService.rReplicatedObject:fireAllClients(self);

    return self;
end

function ReplicatedObject:replicate()
    rReplicatedObject:fireClient(self)
end

_c.ReplicatedObject = ReplicatedObject
classloaded(_cn.ReplicatedObject)