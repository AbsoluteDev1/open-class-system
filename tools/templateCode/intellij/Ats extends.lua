--[[
--- Created: ${DATE} ${TIME}
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

_cn.${NAME} = "${NAME}"
loadClass(_cn.${NAME})

--- Imports ---

---@class ${NAME} : ${PARENT}
local ${NAME} = extends(_cn.${NAME},_cn.${PARENT})

--- Attributs ---


--- Methods ---

function ${NAME}.new()
---@type ${NAME}
local self = initMetatable(${NAME});

return self;
end

_c.${NAME} = ${NAME}
classloaded(_cn.${NAME})