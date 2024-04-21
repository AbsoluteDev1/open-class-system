--[[
--- Created: 30/12/2023 18:32
--- Author: Absolute
--Made with ❤
-------
-------


-------
--]]

_cn.GameObject = "GameObject"
loadClass(_cn.GameObject)

--- Imports ---

---@class GameObject : BaseObject
local GameObject = class(_cn.GameObject)

--- Attributs ---


--- Methods ---

function GameObject.new()
	---@type GameObject
	local self = initMetatable(GameObject);

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