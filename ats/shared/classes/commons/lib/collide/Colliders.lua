local zoneList = {}

Zone = {}
Zone.Rectangle = {}
Zone.Rectangle.__index = Zone.Rectangle

---@param zone table
---@return Rectangle
function Zone.Rectangle:Create(name, zone, height, on)
	local self = setmetatable({}, Zone.Rectangle)

	self.id = #zoneList+1
	self.name = name or "zone_"..self.id
	self.polygon = zone
	self.height = height or 50.0
	self.on = on or nil
	self.rotation = {}

	for k,v in pairs(self.polygon) do
		self.rotation[k] = self:GetWallOrientationByIndex(k)
	end

	zoneList[#zoneList+1] = self
	Wait(50)
	Zone.Loop()

	return self
end

---@param entity number|vector3
---@return boolean
function Zone.Rectangle:In(entity)
	local entity = entity or PlayerPedId()
	local pos = type(entity) == "vector3" and entity or GetEntityCoords(entity)
	local inside = false
	local polygon = self.polygon
	local j = #polygon

	if pos.z < polygon[1].z or pos.z > polygon[1].z + self.height then
		return false
	end

	for i = 1, #polygon do
		local xi = polygon[i].x
		local yi = polygon[i].y
		local xj = polygon[j].x
		local yj = polygon[j].y

		local intersect = ((yi > pos.y) ~= (yj > pos.y)) and (pos.x < (xj - xi) * (pos.y - yi) / (yj - yi) + xi)

		if intersect then
			inside = not inside
		end

		j = i
	end

	return inside
end

-------------------------------
---@param color table
---@param line boolean
---@return Rectangle
function Zone.Rectangle:Draw(color, line)
	self.draw = true
	self.color = color or {r = 255, g = 0, b = 0, a = 60}
	self.line = line or false

	Zone.Loop()

	return self
end

function Zone.Rectangle:Delete()
	for i=1, #zoneList do
		if zoneList[i].id == self.id then
			table.remove(zoneList, i)
			self = nil
			break
		end
	end
end
-------------------------------
---@return vector3
function Zone.Rectangle:GetRandomCoordinate()
	local polygon = self.polygon
	local minX, minY, maxX, maxY = math.huge, math.huge, -math.huge, -math.huge

	for _, point in ipairs(polygon) do
		minX = math.min(minX, point.x)
		minY = math.min(minY, point.y)
		maxX = math.max(maxX, point.x)
		maxY = math.max(maxY, point.y)
	end

	local randomX = math.random() * (maxX - minX) + minX
	local randomY = math.random() * (maxY - minY) + minY
	local randomZ = polygon[1].z

	while not self:In(vector3(randomX, randomY, randomZ)) do
		randomX = math.random() * (maxX - minX) + minX
		randomY = math.random() * (maxY - minY) + minY
		Wait(10)
	end

	return vector3(randomX, randomY, randomZ)
end

---@param wallIndex number
function Zone.Rectangle:GetWallOrientationByIndex(wallIndex)
	local polygon = self.polygon

	if wallIndex >= 1 and wallIndex <= #polygon then
		local startPoint = polygon[wallIndex]
		local endPoint = polygon[wallIndex % #polygon + 1]

		return GetHeadingFromCoords(startPoint, endPoint)
	else
		return nil
	end
end

---@param wallIndex number
function Zone.Rectangle:GetMidpointByIndex(wallIndex)
	local polygon = self.polygon

	if wallIndex >= 1 and wallIndex <= #polygon then
		local startPoint = polygon[wallIndex]
		local endPoint = polygon[wallIndex % #polygon + 1]

		local midX = (startPoint.x + endPoint.x) / 2
		local midY = (startPoint.y + endPoint.y) / 2
		local midZ = (startPoint.z + endPoint.z) / 2

		return vector3(midX, midY, midZ)
	else
		return nil
	end
end

-------------------------------

local actif = false
function Zone.Loop()
	if actif then return end

	local inZone = {}
	local used = false
	actif = true

	CreateThread(function()
		while #zoneList > 0 do
			local timer = 1000

			for _,z in pairs(zoneList) do
				if z.on then
					timer = 250
					if z:In() and inZone[z.name] == false or inZone[z.name] == nil then
						inZone[z.name] = true
						if z.on.onJoin then
							z.on.onJoin(z)
						end
					end

					if z:In() == false and inZone[z.name] == true then
						inZone[z.name] = false
						if z.on.onLeave then
							z.on.onLeave(z)
						end
					end

					if z:In() and inZone[z.name] == true then
						if z.on.onInZone then
							timer = 0
							z.on.onInZone(z)
						end
					end
					used = true
				end
				if z.draw then
					for k,v in pairs(z.polygon) do
						DrawWall(v, z.polygon[k+1] or z.polygon[1], v.z, v.z+z.height, z.color.r, z.color.g, z.color.b, z.color.a)
						if z.line then
							DrawLine(v, z.polygon[k+1] or z.polygon[1], z.color.r, z.color.g, z.color.b, z.color.a)
							DrawLine(v, vector3(v.x, v.y, v.z+z.height), z.color.r, z.color.g, z.color.b, z.color.a)
							DrawLine(v+vector3(0.0, 0.0, z.height), (z.polygon[k+1] or z.polygon[1])+vector3(0.0, 0.0, z.height), z.color.r, z.color.g, z.color.b, z.color.a)
						end
					end
					timer = 0
					used = true
				end
			end

			if Config.DebugMode then
				Zone.LoopDebug()
			end

			if used == false then
				break
			end

			Wait(timer)
		end

		used = false
		actif = false
	end)
end

----------------------------------------


----------------------------------------
----------------------------------------
----------------------------------------

---@param p1 vector3
---@param p2 vector3
---@param minZ number
---@param maxZ number
---@param r number
---@param g number
---@param b number
---@param a number
function DrawWall(p1, p2, minZ, maxZ, r, g, b, a)
	local bottomLeft = vector3(p1.x, p1.y, minZ)
	local topLeft = vector3(p1.x, p1.y, maxZ)
	local bottomRight = vector3(p2.x, p2.y, minZ)
	local topRight = vector3(p2.x, p2.y, maxZ)

	DrawPoly(bottomLeft,topLeft,bottomRight,r,g,b,a)
	DrawPoly(topLeft,topRight,bottomRight,r,g,b,a)
	DrawPoly(bottomRight,topRight,topLeft,r,g,b,a)
	DrawPoly(bottomRight,topLeft,bottomLeft,r,g,b,a)
end


local active = false
function Zone.LoopDebug()
	if active then return end
	active = true
	CreateThread(function()
		while #zoneList > 0 and Config.DebugMode do
			for i=1, #zoneList do
				local zone = zoneList[i].polygon
				for k, v in pairs(zone) do
					DrawWall(v, zone[k+1] or zone[1], v.z, v.z+zoneList[i].height, 255, 0, 0, 60)
					DrawLine(v, zone[k+1] or zone[1], 255, 0, 0, 255)
					DrawLine(v, vector3(v.x, v.y, v.z+zoneList[i].height), 255, 0, 0, 255)
					DrawLine(v+vector3(0.0, 0.0, zoneList[i].height), (zone[k+1] or zone[1])+vector3(0.0, 0.0, zoneList[i].height), 255, 0, 0, 255)
					Draw3DText(v.x, v.y, v.z, "vector3("..v.x..", "..v.y..", "..v.z..")")
					midpoint = zoneList[i]:GetMidpointByIndex(k)
					Draw3DText(midpoint.x, midpoint.y, midpoint.z, zoneList[i].rotation[k].."°")
				end

				if zoneList[i]:In() then
					DrawTexts("In zone\nId : "..zoneList[i].id, 0.5, 0.5)
				end
			end

			Wait(0)
		end

		active = false
	end)
end

---@param coords vector3 | vector4
---@param radius number
---@return vector3
getRandomCoordsInRadius = function(coords, radius)
	radius = coords.w or radius

	local angle = math.random() * 2 * math.pi
	local distance = math.sqrt(math.random()) * radius
	local x = coords.x + distance * math.cos(angle)
	local y = coords.y + distance * math.sin(angle)

	return vector3(math.floor(x), math.floor(y), coords.z)
end

--@return table avec les coordonnées de la limite de la zone selon un nombre de points, mon personnage est le centre
getCoordsOfZoneRadius = function(coords, radius, points)
	local points = points or 8
	local angle = 360 / points
	local coords = {
		x = coords.x,
		y = coords.y,
		z = coords.z
	}
	local coordsList = {}
	for i=1, points do
		local x = coords.x + radius * math.cos(math.rad(angle * i))
		local y = coords.y + radius * math.sin(math.rad(angle * i))
		table.insert(coordsList, vector3(x, y, coords.z))
	end
	return coordsList
end

---@Test
-- Wait(5000)
-- local zone = GetEntityCoords(PlayerPedId())
-- local blipsZone = AddBlipForRadius(zone.x, zone.y, zone.z, 100.0)
-- SetBlipAlpha(blipsZone, 20)
-- CreateThread(function()
--     local blips = AddBlipForCoord(zone.x, zone.y, zone.z)
--     while true do
--         RemoveBlip(blips)

--         local coords = getRandomCoordsInRadius(vector4(zone.x, zone.y, zone.z, 100.0))
--         blips = AddBlipForCoord(coords.x, coords.y, coords.z)
--         SetBlipScale(blips, 0.60)
--         SetBlipColour(blips, 38)

--         Wait(400)
--     end
-- end)

---@Test getCoordsOfZoneRadius
-- CreateThread(function()
--     local coords = GetEntityCoords(PlayerPedId())
--     local coords = getCoordsOfZoneRadius(coords, 100.0, 10)
--     for k,v in pairs(coords) do
--         local blips = AddBlipForCoord(v.x, v.y, v.z)
--         SetBlipScale(blips, 0.60)
--         SetBlipColour(blips, 38)
--     end
-- end)