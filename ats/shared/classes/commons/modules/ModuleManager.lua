--[[
--- Created: 24/12/2023 15:26
--- Author: Absolute
--Made with ❤
-------
-------


-------
--]]

_cn.ModuleManager = "ModuleManager"
loadClass(_cn.ModuleManager)
--- imports ---
import("ApplicationScope")

---@class ModuleManager : BaseObject
local ModuleManager = class("ModuleManager")
_a.ApplicationScope(ModuleManager)
--- Attributs ---


--- Methods ---

function ModuleManager.new()
    ---@type ModuleManager
    local self = initMetatable(ModuleManager);

    self.modules = {};
    self.modulesLoading = {};

    return self;
end

---@param module Module
function ModuleManager:preparingModule(module)
    self.modulesLoading[module.__class__] = false;
    BasicLog.debug("Module " .. module.__class__ .. " preparing to load");
end


---@param module Module
function ModuleManager:registerModule(module)
    table.insert(self.modules, module);
    self.modulesLoading[module.__class__] = nil;
    BasicLog.debug("Module " .. module.__class__ .. " ready to load");
end

function ModuleManager:loadModules()
    for _, module in pairs(self.modules) do
        module:load();
    end
end

function ModuleManager:allModulesLoaded()
    for _, isLoaded in pairs(self.modulesLoading) do
        if not isLoaded then
            return false;
        end
    end
    return true;
end

_c.ModuleManager = ModuleManager
classloaded(_cn.ModuleManager)