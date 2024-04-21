--[[
--- Created: 31/12/2023 09:00
--- Author: Absolute
--Made with ❤
-------
-------


-------
--]]

_cn.GameEngine = "GameEngine"
loadClass(_cn.GameEngine)

--- Imports ---

import(_cn.ApplicationScope)
import(_cn.GameWorld)
import(_cn.Inject)
---@class GameEngine : BaseObject
local GameEngine = class(_cn.GameEngine)
--- Attributs ---

_a.Inject(GameEngine,"gameWorld",_c.GameWorld)
GameEngine.gameWorld = nil

--- Methods ---

function GameEngine.new()
	---@type GameEngine
	local self = initMetatable(GameEngine);

	return self;
end

function GameEngine:load()
	BasicLog.info("GameEngine loading...")
end

function GameEngine:update(delta)
	BasicLog.trace("GameEngine updating...")
end

_c.GameEngine = GameEngine
classloaded(_cn.GameEngine)