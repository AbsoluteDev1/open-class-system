--[[
--- Created: 31/12/2023 01:29
--- Author: Absolute
--Made with ❤
-------
-------


-------
--]]

_cn.ViewNode = "ViewNode"
loadClass(_cn.ViewNode)

--- Imports ---

---@class ViewNode : BaseObject
local ViewNode = class(_cn.ViewNode)

--- Attributs ---


--- Methods ---

function ViewNode.new()
	---@type ViewNode
	local self = initMetatable(ViewNode);

	return self;
end

function ViewNode:draw(scale, rotation, position)

end

_c.ViewNode = ViewNode
classloaded(_cn.ViewNode)