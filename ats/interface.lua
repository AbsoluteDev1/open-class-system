Debug = {
    network = false,
}
Interface = {
    coroutineManager = {},
    thread = function(func)
        Citizen.CreateThread(func)
    end,
    wait = function(seconds)
        Citizen.Wait(seconds)
    end,
    await = function(promise)
        return Citizen.Await(promise)
    end,
    netEvent = function(name,cb)
        BasicLog.debug("-- Registering net event: ^2"..name)
        RegisterNetEvent(name,function(...)
            if(Debug.network) then
                BasicLog.debug("Received net event: ^2"..name)
            end
            local src = source or 0
            cb(src,...)
        end)
    end,
    emitClient = TriggerClientEvent,
    emitServer = TriggerServerEvent,
    promise = promise,
    getGameTimer = GetGameTimer,
    setTimeout = function(delay,fn)
        Interface.thread(function()
            Interface.wait(delay)
            fn()
        end)
    end,
    startTime = GetGameTimer(),
    Vector3 = vector3,
    Vector2 = vector2,
    Vector4 = vector4,
    isServer = function()
        return true
    end,
    isClient = function() return not IsDuplicityVersion() end,
    isControlJustPressed = IsControlJustPressed,
    isControlJustReleased = IsControlJustReleased,
}

Ats.Interface = Interface;
Ats.thread = Interface.thread;
Ats.wait = Interface.wait;
Ats.await = Interface.await;
Ats.netEvent = Interface.netEvent;
Ats.emitClient = Interface.emitClient;
Ats.emitServer = Interface.emitServer;
Ats.promise = Interface.promise;
Ats.getGameTimer = Interface.getGameTimer;
Ats.setTimeout = Interface.setTimeout;
Ats.startTime = Interface.startTime;
Ats.Vector3 = Interface.Vector3;
Ats.Vector2 = Interface.Vector2;
Ats.Vector4 = Interface.Vector4;
Ats.isServer = Interface.isServer;
Ats.isClient = Interface.isClient;
Ats.isControlJustPressed = Interface.isControlJustPressed;
Ats.isControlJustReleased = Interface.isControlJustReleased;
Ats.keyCode = Interface.keyCode;
Ats.natives = Interface.natives;