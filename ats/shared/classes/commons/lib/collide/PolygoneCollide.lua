--[[
--- Created: 31/03/2024 21:43
--- Author: Absolute
--Made with ❤
-------
-------


-------
--]]

_cn.PolygoneCollide = "PolygoneCollide"
loadClass(_cn.PolygoneCollide)

--- Imports ---

---@class PolygoneCollide : BaseObject
local PolygoneCollide = class(_cn.PolygoneCollide)

--- Attributs ---


--- Methods ---

---@param coords table
function PolygoneCollide.new(points)
	---@type PolygoneCollide
	local self = initMetatable(PolygoneCollide);

	self.points = points or {};

	return self;
end

function PolygoneCollide:draw()

end

function PolygoneCollide:isInCollide(coords)
	local x = coords.x;
	local y = coords.y;
	local z = coords.z;

	local inside = false;
	for i = 1, #self.points do
		local point = self.points[i];
		local x1 = point.x;
		local y1 = point.y;
		local z1 = point.z;
	end

	return inside;
end

_c.PolygoneCollide = PolygoneCollide
classloaded(_cn.PolygoneCollide)