---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Absolute.
--- DateTime: 21/12/2023 01:18
---

_cn.Client = "Client";
loadClass(_cn.Client)

--- Imports ---
local Signal = import(_cn.Signal);

---@class Client : BaseObject
local Client = class("Client");
_a.ApplicationScope(Client)

function Client.new()
	DoScreenFadeOut(500);
	local self = initMetatable(Client);
	self.serverReady = false;
	self.onClientConnected = Signal.new();
	self:checkIfClientIsReady();
	return self;
end

_a.NetEvent(Client,"isServerReady")
function Client:isServerReady()
	self.serverReady = true;
	self.onClientConnected:fire();
	self:PrepareToPlay()
	ShutdownLoadingScreen()
	ShutdownLoadingScreenNui();
	DoScreenFadeIn(500);
	SetEntityCoords(PlayerPedId(),-587.85162353516, -1192.9143066406, 17.542951583862);
	PlaceObjectOnGroundProperly(PlayerPedId());
	BasicLog.info("Client ready to play");
end

function Client:PrepareToPlay()
	--- Disable police
	SetPoliceIgnorePlayer(PlayerPedId(), true);
	--- Disable wanted level
	ClearPlayerWantedLevel(PlayerPedId());
	--- Disable police
	SetMaxWantedLevel(0);
	--- Disable police
	SetWantedLevelMultiplier(0.0);
	--- Disable police
	SetDispatchCopsForPlayer(PlayerPedId(), false);
	--- Resurrect player
	ResurrectPed(PlayerPedId());
end


function Client:checkIfClientIsReady()
	Citizen.CreateThread(function()
		while not self.serverReady do
			if(self.serverReady) then
				break;
			end
			Wait(1000);
			if not self.serverReady then
				TriggerServerEvent("Server:isServerReady");
			end
		end
	end)
end


_c.Client = Client;
classloaded(_cn.Client)