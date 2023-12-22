---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Absolute.
--- DateTime: 21/12/2023 01:18
---

---@class StringUtils : BaseObject
local StringUtils = class("StringUtils");

singleton("StringUtils");

function StringUtils.new()
	local self = setmetatable({}, { __index = StringUtils });
	return self;
end

function StringUtils:split(str, sep)
	local result = {};
	local regex = ("([^%s]+)"):format(sep);
	for each in str:gmatch(regex) do
		table.insert(result, each);
	end
	return result;
end

