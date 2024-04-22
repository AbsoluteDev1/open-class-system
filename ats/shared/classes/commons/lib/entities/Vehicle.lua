--[[
--- Created: 22/04/2024 00:57
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

_cn.Vehicle = "Vehicle"
loadClass(_cn.Vehicle)

--- Imports ---

---@class Vehicle : Entity
local Vehicle = extends(_cn.Vehicle, _cn.Entity)

--- Attributs ---


--- Methods ---

function Vehicle.new(model,coords,heading)
	---@type Vehicle
	local self = initMetatable(Vehicle);

	self.model = model or "adder";
	self.coords = coords or vector3(0,0,0);
	self.heading = heading or 0;

	return self;
end

_c.Vehicle = Vehicle
classloaded(_cn.Vehicle)