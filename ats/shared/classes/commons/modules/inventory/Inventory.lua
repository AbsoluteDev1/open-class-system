--[[
--- Created: 24/12/2023 12:01
--- Author: Absolute
--Made with ❤
-------
-------


-------
--]]

_cn.Inventory = "Inventory"
loadClass(_cn.Inventory)

---@type ObservableList
local ObservableList = import("ObservableList");

---@class Inventory
local Inventory = class("Inventory")

--- Attributs ---


--- Methods ---

function Inventory.new()
    ---@type Inventory
    local self = initMetatable(Inventory);

    self.items = ObservableList.new();

    return self;
end

---@param item ItemStack
function Inventory:addItem(item)
    self.items:add(item)
end

---@param item ItemStack
function Inventory:removeItem(item)
    self.items:remove(item)
end

_c.Inventory = Inventory
classloaded(_cn.Inventory)