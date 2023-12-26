--[[
--- Created: 25/12/2023 23:16
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

_cn.Gameobject = "Gameobject"
loadClass(_cn.Gameobject)

--- Imports ---

import(_c.GameobjectCachedData)

---@class Gameobject : BaseObject
local Gameobject = class(_cn.Gameobject)

--- Attributs ---


--- Methods ---

function Gameobject.new(id,x,y,z,model)
    ---@type Gameobject
    local self = initMetatable(Gameobject);

    self.id = Interface.natives.CreateObject(x,y,z,model)
    self.cacheData = _c.GameobjectCachedData.new();
    self:analyzeForCache();
    return self;
end

function Gameobject:setPosition(x,y,z)
    Interface.natives.setEntityCoords(self.id,x,y,z)
end

function Gameobject:getPosition()
    return Interface.natives.getEntityCoords(self.id)
end

function Gameobject:getHeading()
    return Interface.natives.getHeading(self.id)
end

function Gameobject:analyzeForCache()
    Interface.setTimeout(self.cacheData.timeCache,function()
        if Interface.doesEntityExist(self.id) then
            self.cacheData.position = self:getPosition()
            self.cacheData.heading = self:getHeading()
            self:analyzeForCache()
        end
    end)
end

_c.Gameobject = Gameobject
classloaded(_cn.Gameobject)