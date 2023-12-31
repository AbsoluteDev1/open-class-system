--[[
--- Created: 26/12/2023 08:22
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

_cn.UserAction = "UserAction"
loadClass(_cn.UserAction)

--- Imports ---


---@class UserAction : BaseObject
local UserAction = class(_cn.UserAction)

--- Attributs ---


--- Methods ---

function UserAction.new()
    ---@type UserAction
    local self = initMetatable(UserAction);

    return self;
end

function UserAction:onActionBegin()

end

function UserAction:onActionEnd()

end


_c.UserAction = UserAction
classloaded(_cn.UserAction)