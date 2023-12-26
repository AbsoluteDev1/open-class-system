--[[
--- Created: 24/12/2023 14:38
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

loadClass("UnitTest")

---@class UnitTest : BaseObject
local UnitTest = class("UnitTest")

--- Attributs ---


--- Methods ---

function UnitTest.new()
    ---@type UnitTest
    local self = initMetatable(UnitTest);
    self.name = "Test";
    self.its = {};
    return self;
end

function UnitTest:describe(name)
    self.name = name;
    return self;
end

function UnitTest:it(name, callback)
    self.name = name;
    self.its[name] = callback;
    return self;
end

function UnitTest:run()
    print("Running test: " .. self.name);
    local time = Interface.getGameTimer();
    for name, callback in pairs(self.its) do
        local s, e = pcall(function()
            callback();
        end)
        if not s then
            print("Test " .. self.name .. " failed: ^5" .. name .. " with error: " .. e.."^7");
        else
            print("Test " .. self.name .. " passed: ^2" .. name.."^7");
        end
    end
    print("Test " .. self.name .. " finished in " .. Interface.getGameTimer() - time .. "ms")
end

_c.UnitTest = UnitTest
_cn.UnitTest = "UnitTest"
classloaded("UnitTest")