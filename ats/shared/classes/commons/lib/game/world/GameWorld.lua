--[[
--- Created: 31/12/2023 01:46
--- Author: Absolute
--Made with ❤
-------
-------


-------
--]]

_cn.GameWorld = "GameWorld"
loadClass(_cn.GameWorld)

--- Imports ---

import(_cn.ApplicationScope)
local ObservableList = import(_cn.ObservableList)



---@class GameWorld : BaseObject
local GameWorld = class(_cn.GameWorld)

_a.ApplicationScope(GameWorld)
--- Attributs ---

import(_cn.Ped)
import(_cn.Vehicle)
import(_cn.Entity)
import(_cn.Signal)

--- Methods ---

function GameWorld.new()
	---@type GameWorld
	local self = initMetatable(GameWorld);

	self.gameobjects = _c.ObservableList.new()

	self.onEntityAdded = _c.Signal.new()
	self.onEntityRemoved = _c.Signal.new()
	AddEventHandler("entityCreated", function(handle)
		local entityType = GetEntityType(handle)
		local model = GetEntityModel(handle)
		local coords = GetEntityCoords(handle)
		local heading = GetEntityHeading(handle)
		local ent
		if entityType == 1 then
			local ped = _c.Ped.new(model,coords,heading)
			ped.id = handle
			self.gameobjects:add(ped)
			ent = ped
		elseif entityType == 2 then
			local vehicle = _c.Vehicle.new(model,coords,heading)
			vehicle.id = handle
			self.gameobjects:add(vehicle)
			ent = vehicle
		elseif entityType ==3 then
			local entity = _c.Entity.new(model,coords)
			entity.id = handle
			self.gameobjects:add(entity)
			ent = entity
		end

		if ent then
			self.onEntityAdded:fire(ent)
		end
	end)

	AddEventHandler("entityRemoved", function(handle)
		local entity = self.gameobjects:find(_c.Entity,function(entity)
			return entity.id == handle
		end)
		if entity then
			self.gameobjects:remove(entity)
			self.onEntityRemoved:fire(entity)
		end
	end)

	return self;
end

function GameWorld:addGameObject(entity)
	self.gameobjects:add(entity)
end

function GameWorld:removeGameObject(entity)
	self.gameobjects:remove(entity)
end

_c.GameWorld = GameWorld
classloaded(_cn.GameWorld)