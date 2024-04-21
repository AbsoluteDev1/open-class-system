--[[
--- Created: 24/12/2023 14:49
--- Author: Absolute
--Made with ❤
-------
-------


-------
--]]

_cn.${NAME} = "${NAME}"
loadClass(_cn.${NAME})

import(_cn.Test)

---@class ${NAME} : BaseObject
---@field testBench TestBench
local ${NAME} = class(${NAME})
_a.Test(${NAME})
--- Attributs ---

--- Methods ---

function ${NAME}.new()
---@type MyFirstTest
local self = initMetatable(MyFirstTest);

return self;
end

function ${NAME}:test()
self.testBench:newUnitTest():describe("${NAME}")
:it("should be true", function()
assert(true)
end)
:it("should be false", function()
assert(false, "This is false")
end)
end

_c.${NAME} = ${NAME}
classloaded(_cn.${NAME})