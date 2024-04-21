--[[
--- Created: 31/12/2023 09:04
--- Author: Absolute
--Made with ❤
-------
-------


-------
--]]

_cn.AssetLoader = "AssetLoader"
loadClass(_cn.AssetLoader)

--- Imports ---

---@class AssetLoader : BaseObject
local AssetLoader = class(_cn.AssetLoader)

--- Attributs ---


--- Methods ---

function AssetLoader.new()
	---@type AssetLoader
	local self = initMetatable(AssetLoader);

	return self;
end

function AssetLoader:loadAsset(asset)

end

_c.AssetLoader = AssetLoader
classloaded(_cn.AssetLoader)