--[[
--- Created: 30/12/2023 19:09
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

_cn.GameCachedData = "GameCachedData"
loadClass(_cn.GameCachedData)

--- Imports ---

---@class GameCachedData : BaseObject
local GameCachedData = class(_cn.GameCachedData)

--- Attributs ---


--- Methods ---

function GameCachedData.new()
	---@type GameCachedData
	local self = initMetatable(GameCachedData);

	self.position = Vector3.new(0,0,0)
	self.rotation = Vector3.new(0,0,0)
	self.scale = Vector3.new(1,1,1)

	return self;
end

_c.GameCachedData = GameCachedData
classloaded(_cn.GameCachedData)