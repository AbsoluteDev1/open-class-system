---@class BaseObject
BaseObject = {}

function BaseObject.new()

	local self = setmetatable({}, {
		__index = BaseObject});
	self.__isLoaded__ = false;
	self.__class__ = "BaseObject";
	self.__annotations__ = {};
	self._data = {};
	return self
end

function BaseObject:get(key)
	return self._data[key]
end

function BaseObject:set(key, value)
	self._data[key] = value
end

function BaseObject:toString()
	return "BaseObject"
end

function BaseObject:serialize()
	local data = {}
	for k,v in pairs(self) do
		if type(v) ~= "function" then
			data[k] = v
		end
	end
	return data
end

function BaseObject:deserialize(data)
	for k,v in pairs(data) do
		self[k] = v
	end
end