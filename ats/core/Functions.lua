---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Absolute.
--- DateTime: 21/12/2023 01:16
---

function table.removeIf(table, predicate)
	for i = #table, 1, -1 do
		if predicate(table[i]) then
			table.remove(table, i)
		end
	end
end

function table.find(table, predicate)
	for i = 1, #table do
		if predicate(table[i]) then
			return table[i]
		end
	end
end

function table.filter(table, predicate)
	local result = {}
	for i = 1, #table do
		if predicate(table[i]) then
			table.insert(result, table[i])
		end
	end
	return result
end