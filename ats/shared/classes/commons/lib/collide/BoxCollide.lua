--[[
--- Created: 31/03/2024 21:42
--- Author: Absolute
--Made with ❤
-------
-------


-------
--]]

_cn.BoxCollide = "BoxCollide"
loadClass(_cn.BoxCollide)

--- Imports ---

---@class BoxCollide : Collide
local BoxCollide = extends(_cn.BoxCollide, _cn.Collide)

--- Attributs ---


--- Methods ---

function BoxCollide.new(coords, sizeX, sizeY, sizeZ)
	---@type BoxCollide
	local self = initMetatable(BoxCollide);

	self.coords = coords or vector3(0,0,0);
	self.sizeX = sizeX or 1.0;
	self.sizeY = sizeY or 1.0;
	self.sizeZ = sizeZ or 1.0;

	return self;
end

function BoxCollide:draw()

end

function BoxCollide:isInCollide(coords)
	local x = coords.x;
	local y = coords.y;
	local z = coords.z;

	local x1 = self.coords.x - self.sizeX;
	local x2 = self.coords.x + self.sizeX;

	local y1 = self.coords.y - self.sizeY;
	local y2 = self.coords.y + self.sizeY;

	local z1 = self.coords.z - self.sizeZ;
	local z2 = self.coords.z + self.sizeZ;

	return x >= x1 and x <= x2 and y >= y1 and y <= y2 and z >= z1 and z <= z2;
end

_c.BoxCollide = BoxCollide
classloaded(_cn.BoxCollide)