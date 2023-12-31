---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Absolute.
--- DateTime: 21/12/2023 11:24
---

_cn.NetEvent = "NetEvent"
loadClass(_cn.NetEvent)

--- Imports ---

---@class NetEvent : Annotation
local NetEvent = extends(_cn.NetEvent, _cn.Annotation);

--- Attributs ---


--- Methods ---

function NetEvent.new(tableRef, attr, params)
	---@type NetEvent
	local self = initMetatable(NetEvent);
	self.innerTable = tableRef;
	self.innerAttr = attr;
	self.params = params;
	return self;
end

function NetEvent:onValueChange(object, attr, value)
	error("Not implemented method")
end

function NetEvent:onInstantiate(object, attr)
	Interface.netEvent(self.innerTable.__class__..":"..attr, function(...)
		object[attr](...)
	end)
end

_a.NetEvent = annotation(_cn.NetEvent, NetEvent)
_c.NetEvent = NetEvent
classloaded(_cn.NetEvent)