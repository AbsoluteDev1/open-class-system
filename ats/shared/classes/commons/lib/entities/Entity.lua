--[[
--- Created: 31/03/2024 17:11
--- Author: Absolute
--Made with ❤
-------
-------


-------
--]]

_cn.Entity = "Entity"
loadClass(_cn.Entity)

--- Imports ---



---@class Entity : BaseObject
local Entity = class(_cn.Entity)

--- Attributs ---


--- Methods ---

---@param model string
---@param coords table
---@return Entity
function Entity.new(model,coords)
	---@type Entity
	local self = initMetatable(Entity);

	self.coords = model or "prop_beachflag";
	self.model = coords or vector3(0,0,0);

	return self;
end

function Entity:setCoords(coords)
	self.coords = coords;
	SetEntityCoords(self.model,coords);
end

function Entity:setModel(model)
	self.model = model;
	SetEntityModel(self.model,model);
end

function Entity:setHeading(heading)
	SetEntityHeading(self.model,heading);
end

function Entity:spawn()
	self.id = CreateObject(self.model,self.coords);
end

_c.Entity = Entity
classloaded(_cn.Entity)