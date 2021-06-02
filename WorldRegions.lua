local module = {}

--// Variables

local r = workspace.regions

local region1Part = r.region1
local region1Part2 = r.region1_2

local region2Part = r.region2
local region2Part2 = r.region2_2

local region3Part = r.region3
local region3Part2 = r.region3_2

local region1 = Region3.new(region1Part.Position, region1Part2.Position)
local region2 = Region3.new(region2Part.Position, region2Part2.Position)
local region3 = Region3.new(region3Part.Position, region3Part2.Position)

local ignore = {}

--// Tables

module.playersInWorld1 = {}

module.playersInWorld2 = {}

module.playersInWorld3 = {}

--// Functions

module.PlayersEnterOne = function()
	local inRegion = workspace:FindPartsInRegion3WithIgnoreList(region1, ignore, math.huge)

	for _,v in ipairs(inRegion) do
		
		local player = game.Players:GetPlayerFromCharacter(v.Parent)
		
		if not player then continue end

		if table.find(module.playersInWorld1, player) then continue end

		if player.Character.Humanoid.Health > 0 then
			table.insert(module.playersInWorld1, player)
			local multiplier = player['Multiplier']
			multiplier.Value+=.1
			print"joined world one"
		end
	end
end

module.PlayersExitOne = function()
	local partsInRegion = workspace:FindPartsInRegion3WithIgnoreList(region1, ignore, math.huge)

	for playerIndex,player in ipairs(module.playersInWorld1) do
		for partIndex,part in ipairs(partsInRegion) do
			
			if player == game.Players:GetPlayerFromCharacter(part.Parent) then
				
				if player.Character.Humanoid.Health > 0 then break
					
				else
					table.remove(module.playersInWorld1, playerIndex)
					local multiplier = player['Multiplier']
					print"left world one"
					multiplier.Value-=.1 break end
				
			elseif partIndex == #partsInRegion then
				table.remove(module.playersInWorld1, playerIndex)
				local multiplier = player['Multiplier']
				multiplier.Value-=.1
				print"left world one"
			end
		end
	end
end

module.PlayersEnterTwo = function()
	local inRegion = workspace:FindPartsInRegion3WithIgnoreList(region2, ignore, math.huge)
	
	for _,v in ipairs(inRegion) do
		local player = game.Players:GetPlayerFromCharacter(v.Parent)
		
		if not player then continue end

		if table.find(module.playersInWorld2, player) then continue end

		if player.Character.Humanoid.Health > 0 then
			table.insert(module.playersInWorld2, player)
			local multiplier = player['Multiplier']
			multiplier.Value+=.1
			print"joined world Two"
		end
	end
end

module.PlayersExitTwo = function()
	local partsInRegion = workspace:FindPartsInRegion3WithIgnoreList(region2, ignore, math.huge)
	
	for playerIndex,player in ipairs(module.playersInWorld2) do
		for partIndex,part in ipairs(partsInRegion) do
			
			if player == game.Players:GetPlayerFromCharacter(part.Parent) then
				
				if player.Character.Humanoid.Health > 0 then break
					
				else
					table.remove(module.playersInWorld2, playerIndex)
					local multiplier = player['Multiplier']
					print"left world two"
					multiplier.Value-=.1 break end
				
			elseif partIndex == #partsInRegion then
				table.remove(module.playersInWorld2, playerIndex)
				local multiplier = player['Multiplier']
				multiplier.Value-=.1
				print"left world two"
			end
		end
	end
end

module.PlayersEnterThree = function()
	local inRegion = workspace:FindPartsInRegion3WithIgnoreList(region3, ignore, math.huge)
	
	for _,v in ipairs(inRegion) do
		local player = game.Players:GetPlayerFromCharacter(v.Parent)
		
		if not player then continue end

		if table.find(module.playersInWorld3, player) then continue end

		if player.Character.Humanoid.Health > 0 then
			table.insert(module.playersInWorld3, player)
			local multiplier = player['Multiplier']
			multiplier.Value+=.1
			print"joined world three"
		end
	end
end

module.PlayersExitThree = function()
	local partsInRegion = workspace:FindPartsInRegion3WithIgnoreList(region3, ignore, math.huge)
	
	for playerIndex,player in ipairs(module.playersInWorld3) do
		for partIndex,part in ipairs(partsInRegion) do
			
			if player == game.Players:GetPlayerFromCharacter(part.Parent) then
				
				if player.Character.Humanoid.Health > 0 then break
					
				else
					table.remove(module.playersInWorld3, playerIndex)
					local multiplier = player['Multiplier']
					print"left world three"
					multiplier.Value-=.1 break end
				
			elseif partIndex == #partsInRegion then
				table.remove(module.playersInWorld3, playerIndex)
				local multiplier = player['Multiplier']
				print"left world three"
				multiplier.Value-=.1
			end
		end
	end
end

return module
