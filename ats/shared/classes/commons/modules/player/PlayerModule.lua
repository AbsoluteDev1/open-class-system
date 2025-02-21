---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Absolute.
--- DateTime: 21/12/2023 11:05
---
_cn.PlayerModule = "PlayerModule"
loadClass(_cn.PlayerModule)

--- Imports ---

---@type ApplicationScope
local ApplicationScope = import("ApplicationScope");

---@type ObservableList
local ObservableList = import("ObservableList");

---@type ModuleManager
local ModuleManager = import("ModuleManager");

import("CMNotNull")

---@type Player
local Player = import("Player");

--- End of imports ---

---@class PlayerModule : Module
---@field players ObservableList
local PlayerModule = extends("PlayerModule", "Module");
_a.ApplicationScope(PlayerModule)
_a.AModule(PlayerModule)
--- Attributs ---

_a.MaxLength(PlayerModule,"name",{max = 10})
PlayerModule.name = "PlayerModule"
PlayerModule.players = nil;
--- Methods ---
function PlayerModule.new()
	---@type PlayerModule
	local self = initMetatable(PlayerModule);
	return self;
end

function PlayerModule:load()
	self.players = ObservableList.new();
	BasicLog.debug("PlayerModule loading")
end

_a.Permission(PlayerModule,"restricted",{ role = "admin"})
function PlayerModule:restricted()
	print("Restricted method called")
	return true;
end

_a.CMNotNull(PlayerModule,"test")
function PlayerModule:test(test)
	print("Test method called")
	return test;
end

_a.NetEvent(PlayerModule,"onPlayerConnecting")
---@param sessionId number
function PlayerModule:onPlayerConnecting(sessionId)
	local player = Player.new(sessionId);
	self.players:add(player);
end

_c.PlayerModule = PlayerModule
classloaded("PlayerModule")