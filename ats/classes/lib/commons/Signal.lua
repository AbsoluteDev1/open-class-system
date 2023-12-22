---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Absolute.
--- DateTime: 21/12/2023 00:04
---

local Connection = import("Connection")

---@class Signal : BaseObject
---@field connections Connection[]
local Signal = class("Signal");

function Signal.new()
	local self = initMetatable(Signal);
	self.connections = {};
	return self;
end

---@param func fun():void
function Signal:connect(func)
	local connection = Connection.new(self, func);
	table.insert(self.connections, connection);
end

function Signal:fire(...)
	for _, connection in pairs(self.connections) do
		connection.func(...);
	end
end

function Signal:disconnect(connection)
	for i, conn in pairs(self.connections) do
		if conn == connection then
			table.remove(self.connections, i);
			break;
		end
	end
end

