--[[
--- Created: 25/12/2023 00:00
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

_cn.ConsoleMenu = "ConsoleMenu"
loadClass(_cn.ConsoleMenu)

--- Imports ---


---@class ConsoleMenu : BaseObject
local ConsoleMenu = class("ConsoleMenu")

--- Attributs ---


--- Methods ---

function ConsoleMenu.new()
    ---@type ConsoleMenu
    local self = initMetatable(ConsoleMenu);
    self.title = ""
    self.choices = {}
    return self;
end

function ConsoleMenu:title(title)
    self.title = title
    return self
end

---@param question string
---@param choices table<string>
function ConsoleMenu:choice(question,choices)
    table.insert(self.choices, { question = question , choices = choices })
    return self
end

function ConsoleMenu:display()
    print("| ---- " .. self.title .. " ---- |")
    for _,choice in pairs(self.choices) do
        print(choice.question)
        for i,choice in pairs(choice.choices) do
            print(i .. " - " .. choice)
        end
    end
    print("| ---------------- |")
end

_c.ConsoleMenu = ConsoleMenu
classloaded(_cn.ConsoleMenu)