--[[
--- Created: 30/12/2023 18:45
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
_cn.Vector3 = "Vector3"
loadClass(_cn.Vector3)

---@class Vector3
---@field x number
---@field y number
---@field z number
local Vector3 = class("Vector3")

function Vector3.new(x, y, z)
	local self = initMetatable(Vector3)
	self.x = x or 0
	self.y = y or 0
	self.z = z or 0
	return self
end

function Vector3:add(other)
	self.x = self.x + other.x
	self.y = self.y + other.y
	self.z = self.z + other.z
end

function Vector3:subtract(other)
	self.x = self.x - other.x
	self.y = self.y - other.y
	self.z = self.z - other.z
end

function Vector3:multiply(value)
	if type(value) == "number" then
		self.x = self.x * value
		self.y = self.y * value
		self.z = self.z * value
	elseif type(value) == "table" then -- Assuming it's a Vector3
		self.x = self.x * value.x
		self.y = self.y * value.y
		self.z = self.z * value.z
	end
end

function Vector3:divide(value)
	if type(value) == "number" then
		self.x = self.x / value
		self.y = self.y / value
		self.z = self.z / value
	elseif type(value) == "table" then -- Assuming it's a Vector3
		self.x = self.x / value.x
		self.y = self.y / value.y
		self.z = self.z / value.z
	end
end

function Vector3:magnitude()
	return math.sqrt(self.x * self.x + self.y * self.y + self.z * self.z)
end

function Vector3:normalize()
	local mag = self:magnitude()
	if mag > 0 then
		self.x = self.x / mag
		self.y = self.y / mag
		self.z = self.z / mag
	end
end

function Vector3:dot(other)
	return self.x * other.x + self.y * other.y + self.z * other.z
end

function Vector3:cross(other)
	return Vector3.new(
			self.y * other.z - self.z * other.y,
			self.z * other.x - self.x * other.z,
			self.x * other.y - self.y * other.x
	)
end

_c.Vector3 = Vector3
classloaded(_cn.Vector3)
