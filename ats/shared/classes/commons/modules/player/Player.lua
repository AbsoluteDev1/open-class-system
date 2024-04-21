--[[
--- Created: 23/12/2023 09:24
--- Author: Absolute
--Made with ❤
-------
-------


-------
--]]

_cn.Player = "Player";
loadClass(_cn.Player)
---@class Player : Instance
local Player = extends("Player", "Instance")

--- Attributes ---

Player.name = "";

--- Methods ---


function Player.new(sessionId)
    ---@type Player
    local self = initMetatable(Player);

    self.sessionId = sessionId;

    return self;
end

function Player:getPosition()

end

function Player:setPosition()
    
end

_c.Player = Player;
classloaded(_cn.Player)