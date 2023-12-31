--print("TESTT ?")
--local val = io.read()
--
--print("Vall: " .. val)

--print(os.time())
--
local atsCore = require("ats-core")
local interface = require("interface")
----Interface.thread(function()
----	print("Testttt")
----	Interface.wait(0)
----	print("Testttt2")
----end)
--Interface.thread(function()
--	print("Testttt3")
--	local promise = Interface.promise.new();
--	print("Testttt4")
--	Interface.thread(function()
--		print("Testttt5")
--		--Interface.wait(0)
--		print("Testttt6")
--		promise:resolve("Testttt7")
--	end)
--	print("Testttt8")
--end)


local p  = Interface.promise.new();

Ats.thread(function()
	for i = 1, 5 do
		print("Tâche 1, itération", i)
		Ats.wait(1)  -- Attendre 1 seconde
	end
	print("Tâche 1 terminée")
	p:resolve()
end)

Ats.thread(function()
	for i = 1, 5 do
		print("Tâche 2, itération", i)
		Ats.wait(0.5)  -- Attendre 0.5 seconde
	end
end)

Ats.thread(function()
	Ats.await(p);
	print("dzadzadzadzadzadzadzadza")
end)

Ats.coroutineManager:run()



