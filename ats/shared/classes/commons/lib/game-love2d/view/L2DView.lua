--[[
--- Created: 31/12/2023 01:34
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

_cn.L2DView = "L2DView"
loadClass(_cn.L2DView)

--- Imports ---

---@class L2DView : BaseObject
local L2DView = class(_cn.L2DView)

--- Attributs ---


--- Methods ---

function L2DView.new()
	---@type L2DView
	local self = initMetatable(L2DView);

	self.view = "rectangle"

	return self;
end

---@param scale Vector3
---@param rotation Vector3
---@param position Vector3
function L2DView:draw(scale, rotation, position)
	love.graphics.setColor(1,1,1,1)
	love.graphics.rectangle("fill", position.x, position.y, scale.x, scale.y)
end

_c.L2DView = L2DView
classloaded(_cn.L2DView)