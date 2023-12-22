local classes = {}
local proxies = {}
_a = {}
function extends(classname,extendclass)
	assert(type(classname) == "string", "Classloader.loadClass expects 'classname' as a 'string'")
	assert(type(extendclass) == "string", "Classloader.loadClass expects 'extendclass' as a 'string'")
	---@type BaseObject
	local clazz = import(extendclass)
	return class(classname,clazz);
end

function import(name,timeoutTimer)
	if classes[name] then
		return classes[name]
	else
		local promize = promise.new();
		thread(function()
			local timeout = timeoutTimer or 10000;
			local timer = GetGameTimer();
			repeat
				Citizen.Wait(0)
			until classes[name] or GetGameTimer() - timer > timeout
			if classes[name] then
				promize:resolve(classes[name])
			else
				promize:reject("Classloader.loadClass / Can't get Class '"..name.."' cause it's not loaded")
			end
		end)
		return await(promize)
	end
end

function class(name,parentClass)
	local clazz = parentClass and parentClass.new() or BaseObject.new();

	clazz.__analyseStack = function(t,k,v)
		analyseClass(name,t,k,v);
		rawset(t,k,v);
	end

	clazz = setmetatable(clazz,{
		__index = parentClass and parentClass or BaseObject,
	    __newindex = function(t,k,v)
		    t.__analyseStack(t,k,v);
	    end
	});
	classes[name] = clazz;
	clazz.__parent__ = parentClass and parentClass or BaseObject;
	clazz.__class__ = name;

	function clazz:toString()
		return name;
	end

	function clazz:super()
		return self.__parent__;
	end
	BasicLog.debug("Class '"..name.."' registered")
	return classes[name];
end

function initMetatable(Object,cb)
	local d = setmetatable({}, { __index = Object })
	local _d = d;

	local internalData = {

	}

	-- Métatable pour surveiller les modifications
	local monitorMetatable = {
		__index = function(table, key)
			return _d[key]
		end,
		__newindex = function(table, key, value)
			analyseClass(Object.__class__,internalData,key,value);
			_d[key] = value
		end
	}

	return setmetatable(internalData, monitorMetatable)  -- On applique la métatable à internalData
end

---Register a class as a singleton, the class can't be instancied twice
---@param name string
function singleton(name)
	classes[name] = classes[name].new();

	classes[name].new = function()
		error("Singleton '"..name.."' can't be instancied twice")
	end

	BasicLog.debug("Singleton '"..name.."' registered")
end

---@param cb fun():void
function thread(cb)
	Citizen.CreateThread(cb);
end

function await(promise)
	return Citizen.Await(promise)
end

function annotation(name)
	if not classes[name] then
		error("Annotation '"..name.."' can't be applied to a class that doesn't exist")
	end

	local clazz = classes[name];

	return function(class,attr,params)
		local annot = clazz.new(class,attr,params);
		if not class.__annotations__[attr] then
			class.__annotations__[attr] = {}
		end
		table.insert(class.__annotations__[attr],annot);
	end
end

function analyseClass(className,object,k,v)
	local clazz = classes[className];
	if not clazz then
		error("Class '"..className.."' doesn't exist")
	end
	if not clazz.__annotations__[k] then
		return;
	end
	for _,annot in pairs(clazz.__annotations__[k]) do
		annot:onValueChange(object,k,v);
	end
end

classes["BaseObject"] = BaseObject;