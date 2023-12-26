local classes = {}
local classesLoaded = {}
local classesReflection = {}
local singletons = {}
local proxies = {}
local stopAllTryingInstantiation = false;
_a = {}
_c = {}

function allClassesLoaded()
	for k,v in pairs(classesLoaded) do
		if not v then
			return false;
		end
	end
	return true;
end

function extends(classname,extendclass,cannotBeExtended)
	assert(type(classname) == "string", "Classloader.loadClass expects 'classname' as a 'string'")
	assert(type(extendclass) == "string", "Classloader.loadClass expects 'extendclass' as a 'string'")
	---@type BaseObject
	local clazz = import(extendclass)
	return class(classname,clazz,cannotBeExtended);
end

---@param name string
---@param timeoutTimer number | nil
function import(name,timeoutTimer)
	if classes[name] then
		return classes[name]
	else
		local promize = Interface.promise.new();
		Interface.thread(function()
			local timeout = timeoutTimer or 10000;
			local timer = GetGameTimer();
			repeat
				Interface.wait(0)
			until (classes[name] and classesLoaded[name]) or Interface.getGameTimer() - timer > timeout
			if classes[name] then
				promize:resolve(classes[name])
			else
				promize:reject("Classloader.loadClass / Can't get Class '"..name.."' cause it's not loaded")
			end
		end)
		return await(promize)
	end
end

---@param name string
---@param parentClass BaseObject
function class(name,parentClass,cannotBeExtended)

	---@type BaseObject
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

	clazz.__canBeExtended__ = not cannotBeExtended;
	clazz.__annotations__ = {};

	function clazz:toString()
		return name;
	end

	function clazz:super()
		return self.__parent__;
	end
	return classes[name];
end

function initMetatable(Object,cb)
	local d = setmetatable({}, { __index = Object })
	local _d = d;
	local signal

	if Object.__parent__ then
		--- need to call the new of parent but apply to the current d instance
		local p = Object.__parent__.new();
		if p then
			for k,v in pairs(p) do
				if type(v) ~= "function" and not (string.sub(tostring(k),1,2) == "__") then
					d[k] = p[k];
				end
			end
		end
	end

	local internalData = {}

	local monitorMetatable = {
		__index = function(table, key)
			return _d[key]
		end,
		__newindex = function(table, key, value)
			analyseClass(Object.__class__,internalData,key,value);
			if signal then
				signal:fire(key, value)
			end
			if cb then
				cb(table,key,value)
			end
			_d[key] = value
		end
	}
	local instance = setmetatable(internalData, monitorMetatable);
	if Object.__class__ ~= "Signal" and Object.__class__ ~= "Connection" then
		import("Signal")
		signal = _c.Signal.new();
		instance.changed = signal;
	end
	for k,v in pairs(Object.__annotations__) do
		for _,a in pairs(v) do
			if a.onInstantiate then
				a:onInstantiate(instance,k)
			end
		end
	end
	return instance  -- On applique la métatable à internalData
end

---Register a class as a singleton, the class can't be instancied twice
---@param name string
function singleton(name)
	Interface.thread(function()
		Interface.wait(0)
		tryInstantiate(name)
	end)
end

function tryInstantiate(name)
	if not allClassesLoaded() and not stopAllTryingInstantiation then
		Interface.wait(0);
		BasicLog.trace("Waiting for all classes to be loaded before instantiating '"..name.."'")
		tryInstantiate(name)
	else
		singletons[name] = classes[name].new();
		BasicLog.debug("^5Singleton '"..name.."' ^2created")
		classes[name].new = function()
			error("Singleton '"..name.."' can't be instancied twice")
		end
	end
end

---@generic T
---@param clazz T
---@return T
function getSingleton(clazz)
	if type(clazz) == "string" then
		error("getSingleton expects 'clazz' as a 'class' not a 'string'")
	end
	local p = Interface.promise.new()
	local name = clazz.__class__;
	Interface.thread(function()
		repeat
			Interface.wait(0)
		until singletons[name]
		p:resolve(singletons[name])
	end)

	return Interface.await(p);
end

---@param cb fun():void
function thread(cb)
	Interface.thread(cb);
end

function await(promise)
	return Interface.await(promise)
end

function annotation(name)
	if not classes[name] then
		error("Annotation '"..name.."' can't be applied to a class that doesn't exist")
	end

	local clazz = classes[name];

	return function(class,attr,params)
		local classRef = classes[class.__class__];
		local annot = clazz.new(classRef,attr,params);
		if not classRef.__annotations__ then
			classRef.__annotations__ = {}
		end

		if attr == nil and not classRef.__annotations__["__global__"] then
			classRef.__annotations__["__global__"] = {};
		end

		if attr == nil then
			table.insert(classRef.__annotations__["__global__"],annot);
			return;
		else
			if not classRef.__annotations__[attr] then
				classRef.__annotations__[attr] = {}
			end
			table.insert(classRef.__annotations__[attr],annot);
		end
	end
end

function afterClassLoad(class,cb)

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
		if annot.__class__ then
			annot:onValueChange(object,k,v);
		end
	end
end

function instanceof(object,clazz)
	return object.__class__ == clazz.__class__;
end

function getClasses()
	return classes;
end
---@return BaseObject
function getClassByName(name)
	return classes[name];
end

function loadClass(className)
	classesLoaded[className] = false;
	BasicLog.debug("^3Loading class '"..className.."'^7")
	local p = Interface.promise.new();
	Interface.thread(function()
		p:resolve();
	end)
	return Interface.await(p)
end

function classloaded(className)
	classesLoaded[className] = true;
	local clazz = classes[className];
	if clazz then
		for _,attr in pairs(clazz.__annotations__) do
			if clazz.__annotations__[ _] then
				for k,annotation in pairs(attr) do
					if annotation.onLoaded then
						annotation:onLoaded(_);
					end
				end
			end
		end
	end

	BasicLog.debug("^2Class '"..className.."' loaded^7")
	Interface.thread(function()
		---@type Class
		local Class = import("Class");
		classesReflection[className] = Class:new();
	end)
end

classes["BaseObject"] = BaseObject;

BasicLog.info("^4Preloading classes...")
Interface.thread(function()
	BasicLog.info("^2Preloading ended")
	BasicLog.info("^4Start meta programming...")
	Interface.setTimeout(10000,function()
		stopAllTryingInstantiation = true;
		if not allClassesLoaded() then
			BasicLog.error("Some classes are not loaded, please check your code")
			BasicLog.error("---- Classes not loaded : ----")
			for k,v in pairs(classesLoaded) do
				if not v then
					BasicLog.error("- Class '"..k.."' is not loaded")
				end
			end
			BasicLog.error("---- End of classes not loaded ----")
		end
	end)
end)