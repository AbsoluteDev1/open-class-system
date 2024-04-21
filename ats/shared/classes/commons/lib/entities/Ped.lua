--[[
--- Created: 11/04/2024 14:23
--- Author: Absolute
--Made with ❤
-------
-------


-------
--]]

_cn.Ped = "Ped"
loadClass(_cn.Ped)

--- Imports ---

---@type Signal
local Signal = import(_cn.Signal)

---@class Ped : Entity
local Ped = extends(_cn.Ped, _cn.Entity)

--- Attributs ---


--- Methods ---

function Ped.new(model,coords,heading)
	---@type Ped
	local self = initMetatable(Ped);
	self.model = model or "a_m_m_skater_01";
	self.coords = coords or vector3(0,0,0);
	self.heading = heading or 0;

	-- Signals
	self.characterDied = Signal.new();
	self.weaponEquipped = Signal.new();
	self.weaponUnEquipped = Signal.new();
	self.healthChanged = Signal.new();
	self.armorChanged = Signal.new();

	return self;
end

function Ped:spawn()
	self.id = CreatePed(self.model,self.coords);
end

_c.Ped = Ped
classloaded(_cn.Ped)