--[[
--- Created: 24/12/2023 14:49
--- Author: Absolute
--Made with ❤
-------
-------


-------
--]]

_cn.MyFirstTest = "MyFirstTest"
loadClass(_cn.MyFirstTest)

import("Test")

---@class MyFirstTest : BaseObject
---@field testBench TestBench
local MyFirstTest = class("MyFirstTest")
_a.Test(MyFirstTest)
--- Attributs ---

--- Methods ---

function MyFirstTest.new()
    ---@type MyFirstTest
    local self = initMetatable(MyFirstTest);

    return self;
end

function MyFirstTest:test()
    self.testBench:newUnitTest():describe("MyFirstTest")
    :it("should be true", function()
        assert(true)
    end)
    :it("should be false", function()
        assert(false, "This is false")
    end)
end

_c.MyFirstTest = MyFirstTest
classloaded(_cn.MyFirstTest)