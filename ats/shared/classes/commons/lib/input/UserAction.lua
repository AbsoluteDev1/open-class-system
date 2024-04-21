--[[
--- Created: 26/12/2023 08:22
--- Author: Absolute
--Made with ❤
-------
-------


-------
--]]

_cn.UserAction = "UserAction"
loadClass(_cn.UserAction)

--- Imports ---


---@class UserAction : BaseObject
local UserAction = class(_cn.UserAction)

--- Attributs ---


--- Methods ---

function UserAction.new(actionName, keycode, actionType)
    ---@type UserAction
    local self = initMetatable(UserAction);

    self.actionName = actionName;
    self.keycode = keycode;
    self.actionType = actionType;

    return self;
end

function UserAction:onActionBegin()

end

function UserAction:onActionEnd()

end


_c.UserAction = UserAction
classloaded(_cn.UserAction)