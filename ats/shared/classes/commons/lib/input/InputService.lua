--[[
--- Created: 26/12/2023 08:18
--- Author: Absolute
--Made with ❤
-------
-------


-------
--]]

_cn.InputService = "InputService"
loadClass(_cn.InputService)

--- Imports ---

import(_cn.ApplicationScope)
import(_cn.Ped)

---@class InputService : BaseObject
local InputService = class(_cn.InputService)
_a.ApplicationScope(InputService)
--- Attributs ---


--- Methods ---

function InputService.new()
    ---@type InputService
    local self = initMetatable(InputService);
    ---@type UserAction[]
    self.actions = {};

    return self;
end

function InputService:addAction()

end

function InputService:isKeyDown(keycode)
    return Interface.isControlJustPressed(keycode, 0)
end

function InputService:isKeyUp(keycode)
    return Interface.isControlJustReleased(keycode, 0)
end

function InputService:onUpdate()
    Interface.thread(function()
        while true do
            for _, action in pairs(self.actions) do

            end
            Interface.wait(0)
        end

    end)
end

_c.InputService = InputService
classloaded(_cn.InputService)