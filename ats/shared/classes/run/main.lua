---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by jokir.
--- DateTime: 23/12/2023 09:14
---

-----@type List
--local List = import("List")
--
-----@type Instance
--local Instance = import("Instance");
--print("dzadzdzadzadzadzadza")
--local test = Instance.new();
--test.changed:connect(function(p)
--    print("Instance changed: " .. p)
--end)
--test.className = "Hello World"
--test.name = "Hello World 2"
--
-----@type Player
--local Player = import("Player");
--
--local player = Player.new();
--player.changed:connect(function(p)
--    print("Player1 changed: " .. p)
--end)
--player.name = "Hello World"
--
--local player2 = Player.new();
--player2.changed:connect(function(p)
--    print("Player2 changed: " .. p)
--end)
--player2.name = "Hello World 2"
--
-----@type InventoryModule
--local InventoryModule = import("InventoryModule");
--
--local l = List.new(_c.List)
--
--l:push(List,"Hello World")
--l:each(_c.Player,function(value)
--
--end)
--
--local p = getSingleton(InventoryModule)
--Interface.setTimeout(1000,function()
--    p.PlayerModule:restricted()
--    p.PlayerModule:test(nil);
--end)

import(_cn.GameObject)
import(_cn.L2DView)


local gameObject = GameObject.new()
gameObject.position = Vector3.new(0,0,0)
gameObject:setViewNode(_cn.L2DView.new())

