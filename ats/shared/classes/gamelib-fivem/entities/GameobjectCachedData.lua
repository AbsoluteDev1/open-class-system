--[[
--- Created: 26/12/2023 09:36
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

_cn.GameobjectCachedData = "GameobjectCachedData"
loadClass(_cn.GameobjectCachedData)

--- Imports ---


---@class GameobjectCachedData : BaseObject
local GameobjectCachedData = class(_cn.GameobjectCachedData)

--- Attributs ---

GameobjectCachedData.position = Interface.Vector3(0,0,0)
GameobjectCachedData.rotation = Interface.Vector3(0,0,0)
GameobjectCachedData.scale = Interface.Vector3(0,0,0)
GameobjectCachedData.heading = 0
GameobjectCachedData.timeCache = 500

--- Methods ---

function GameobjectCachedData.new()
    ---@type GameobjectCachedData
    local self = initMetatable(GameobjectCachedData);


    return self;
end

_c.GameobjectCachedData = GameobjectCachedData
classloaded(_cn.GameobjectCachedData)