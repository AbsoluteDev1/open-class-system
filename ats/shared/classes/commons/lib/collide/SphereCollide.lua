--[[
--- Created: 31/03/2024 21:39
--- Author: Absolute
--Made with ❤
-------
-------


-------
--]]

_cn.SphereCollide = "SphereCollide"
loadClass(_cn.SphereCollide)

--- Imports ---

---@class SphereCollide : Collide
local SphereCollide = extends(_cn.SphereCollide, _cn.Collide)

--- Attributs ---
SphereCollide.coords = nil;

--- Methods ---

function SphereCollide.new(coords,radius)
	---@type SphereCollide
	local self = initMetatable(SphereCollide);

	self.coords = coords or vector3(0,0,0);
	self.radius = radius or 1.0;

	return self;
end

function SphereCollide:draw()

end

function SphereCollide:isInCollide(coords)
	local distance = #(coords - self.coords);
	return distance <= self.radius;
end

_c.SphereCollide = SphereCollide
classloaded(_cn.SphereCollide)