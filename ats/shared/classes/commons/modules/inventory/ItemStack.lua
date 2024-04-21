--[[
--- Created: 24/12/2023 12:01
--- Author: Absolute
--Made with ❤
-------
-------


-------
--]]

_cn.ItemStack = "ItemStack"
loadClass(_cn.ItemStack)

---@class ItemStack : Instance
local ItemStack = extends("ItemStack", "Instance")

--- Attributs ---


--- Methods ---

function ItemStack.new()
    local self = initMetatable(ItemStack);

    return self;
end

_c.ItemStack = ItemStack
classloaded(_cn.ItemStack)