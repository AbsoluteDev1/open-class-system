--[[
--- Created: 31/12/2023 01:46
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

_cn.GameWorld = "GameWorld"
loadClass(_cn.GameWorld)

--- Imports ---

import(_cn.ApplicationScope)
import(_cn.ObservableList)

---@class GameWorld : BaseObject
local GameWorld = class(_cn.GameWorld)
_a.ApplicationScope(GameWorld)
--- Attributs ---


--- Methods ---

function GameWorld.new()
	---@type GameWorld
	local self = initMetatable(GameWorld);

	self.gameobjects = ObservableList.new()

	return self;
end

function GameWorld:addGameObject(entity)
	self.gameobjects:add(entity)
end

function GameWorld:removeGameObject(entity)
	self.gameobjects:remove(entity)
end

_c.GameWorld = GameWorld
classloaded(_cn.GameWorld)