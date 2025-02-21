---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Absolute.
--- DateTime: 20/12/2023 23:39
---

_cn.Module = "Module"
loadClass(_cn.Module)

---@class Module : Instance
---@field name string
---@field isLoaded boolean
---@field isStarted boolean
local Module = extends("Module","Instance");

function Module.new(name)
	local self = initMetatable(Module);
	self.name = name;
	self.isLoaded = false;
	self.isStarted = false;
	return self;
end

function Module:load()
	if self.isLoaded then
		return;
	end
	self.isLoaded = true;
end

function Module:start()
	if self.isStarted then
		return;
	end
	self.isStarted = true;
end

function Module:stop()
	if not self.isStarted then
		return;
	end
	self.isStarted = false;
end

function Module:unload()
	if not self.isLoaded then
		return;
	end
	self:stop();
	self.isLoaded = false;
end

function Module:restart()
	self:stop();
	self:start();
end

function Module:registerAddon(addon)

end

_c.Module = Module
classloaded(_cn.Module)