--[[
--- Created: 31/12/2023 01:48
--- Author: Absolute
--Made with ❤
-------
-------


-------
--]]

_cn.GameObjectBuilder = "GameObjectBuilder"
loadClass(_cn.GameObjectBuilder)

--- Imports ---

import(_cn.ApplicationScope)
import(_cn.GameWorld)

---@class GameObjectBuilder : BaseObject
---@field gameWorld GameWorld
local GameObjectBuilder = class(_cn.GameObjectBuilder)
--- Attributs ---

_a.Inject(GameObjectBuilder,"gameWorld",_c.GameWorld)
GameObjectBuilder.gameWorld = nil

--- Methods ---

function GameObjectBuilder.new()
	---@type GameObjectBuilder
	local self = initMetatable(GameObjectBuilder);

	self.position = Vector3.new(0,0,0)
	self.rotation = Vector3.new(0,0,0)
	self.scale = Vector3.new(1,1,1)
	self.viewNode = nil

	return self;
end

function GameObjectBuilder:at(position)
	self.position = position
	return self
end

function GameObjectBuilder:withRotation(rotation)
	self.rotation = rotation
	return self
end

function GameObjectBuilder:withScale(scale)
	self.scale = scale
	return self
end

function GameObjectBuilder:withViewNode(viewNode)
	self.viewNode = viewNode
	return self
end

function GameObjectBuilder:build()
	local gameObject = GameObject.new()
	gameObject.position = self.position
	gameObject.rotation = self.rotation
	gameObject.scale = self.scale
	gameObject:setViewNode(self.viewNode)
	return gameObject
end

function GameObjectBuilder:buildAndAttach()
	local gameObject = self:build()
	self.gameWorld:addGameObject(gameObject)
	return gameObject
end

_c.GameObjectBuilder = GameObjectBuilder
classloaded(_cn.GameObjectBuilder)