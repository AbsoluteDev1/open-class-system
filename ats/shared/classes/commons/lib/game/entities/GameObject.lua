--[[
--- Created: 30/12/2023 18:32
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

_cn.GameObject = "GameObject"
loadClass(_cn.GameObject)

--- Imports ---

import(_cn.Vector3)
import(_cn.Vector3)
---@class GameObject : BaseObject
local GameObject = class(_cn.GameObject)

--- Attributs ---


--- Methods ---

function GameObject.new()
	---@type GameObject
	local self = initMetatable(GameObject);

	self.position = Vector3.new(0,0,0)
	self.rotation = Vector3.new(0,0,0)
	self.scale = Vector3.new(1,1,1)
	self.viewNode = nil

	return self;
end

function GameObject:setViewNode(viewNode)
	self.viewNode = viewNode
end

function GameObject:getViewNode()
	return self.viewNode
end

function GameObject:draw()
	if self.viewNode then
		self.viewNode:draw()
	end
end

function GameObject:update(dt)

end

_c.GameObject = GameObject
classloaded(_cn.GameObject)