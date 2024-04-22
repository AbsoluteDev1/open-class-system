_cn = {}

---@class BaseObject
---@field __isLoaded__ boolean
---@field __class__ string
---@field __annotations__ table<string, Annotation>
---@field __parent__ BaseObject
---@field _data table<string, any>
---@field changed Signal
BaseObject = {}

_cn.BaseObject = "BaseObject"

function BaseObject.new()
	local self = setmetatable({}, { __index = BaseObject});
	self.__isLoaded__ = false;
	self.__class__ = "BaseObject";
	self.__annotations__ = {};
	return self
end

function BaseObject:toString()
	return "BaseObject"
end

function BaseObject:serialize()
	local data = {}
	for k,v in pairs(self.__internal__) do
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

function BaseObject:instanceOf(clazz)
	return instanceof(self,clazz);
end

function BaseObject:getClass()
	return getClassByName(self.__class__);
end

function BaseObject:getClassObject()
	return self:getClass();
end