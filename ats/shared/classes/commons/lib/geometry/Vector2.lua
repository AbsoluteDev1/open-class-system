--[[
--- Created: 30/12/2023 18:46
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
_cn.Vector2 = "Vector2"
loadClass(_cn.Vector2)

---@class Vector2
---@field x number
---@field y number
local Vector2 = class("Vector2")

function Vector2.new(x, y)
	local self = initMetatable(Vector2)
	self.x = x or 0
	self.y = y or 0
	return self
end

function Vector2:add(other)
	self.x = self.x + other.x
	self.y = self.y + other.y
end

function Vector2:subtract(other)
	self.x = self.x - other.x
	self.y = self.y - other.y
end

function Vector2:multiply(value)
	if type(value) == "number" then
		self.x = self.x * value
		self.y = self.y * value
	elseif type(value) == "table" then -- Assuming it's a Vector2
		self.x = self.x * value.x
		self.y = self.y * value.y
	end
end

function Vector2:divide(value)
	if type(value) == "number" then
		self.x = self.x / value
		self.y = self.y / value
	elseif type(value) == "table" then -- Assuming it's a Vector2
		self.x = self.x / value.x
		self.y = self.y / value.y
	end
end

function Vector2:magnitude()
	return math.sqrt(self.x * self.x + self.y * self.y)
end

function Vector2:normalize()
	local mag = self:magnitude()
	if mag > 0 then
		self.x = self.x / mag
		self.y = self.y / mag
	end
end

function Vector2:dot(other)
	return self.x * other.x + self.y * other.y
end

_c.Vector2 = Vector2
classloaded(_cn.Vector2)