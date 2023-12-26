--[[
--- Created: 24/12/2023 12:01
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