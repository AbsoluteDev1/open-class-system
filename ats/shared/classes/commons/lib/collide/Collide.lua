--[[
--- Created: 31/03/2024 19:11
--- Author: Absolute
--Made with ❤
-------
-------


-------
--]]

_cn.Collide = "Collide"
loadClass(_cn.Collide)

--- Imports ---

---@class Collide : BaseObject
local Collide = class(_cn.Collide)

--- Attributs ---


--- Methods ---

function Collide.new()
	---@type Collide
	local self = initMetatable(Collide);

	return self;
end

function Collide:draw()

end

function Collide:isInCollide(coords)

end

_c.Collide = Collide
classloaded(_cn.Collide)