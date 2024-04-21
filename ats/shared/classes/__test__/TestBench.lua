--[[
--- Created: 23/12/2023 14:25
--- Author: Absolute
--Made with ❤
-------
-------


-------
--]]
loadClass("TestBench")

import("ApplicationScope")
---@type UnitTest
local UnitTest = import("UnitTest");

---@class TestBench : BaseObject
---@field unitTests UnitTest[]
local TestBench = class("TestBench")
_a.ApplicationScope(TestBench)

function TestBench.new()
    ---@type TestBench
    local self = initMetatable(TestBench);

    self.unitTests = {};
    self.nbTest = 0;
    self.waitForTest = true;

    --RegisterCommand("run_test",function()
    --    self:run()
    --end)

    return self;
end

---@return UnitTest
function TestBench:newUnitTest()
    local unitTest = UnitTest.new();
    table.insert(self.unitTests, unitTest);
    return unitTest;
end

function TestBench:run()
    for _, unitTest in pairs(self.unitTests) do
        unitTest:run();
    end
end

_c.TestBench = TestBench
_cn.TestBench = "TestBench"
classloaded("TestBench")