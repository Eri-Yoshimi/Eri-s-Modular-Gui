-- Settings -----------------------------------------------------------------------------------------------------
local toggleKey = Enum.KeyCode.RightBracket
local shutdownKey = nil
local minESPsize = 2
local lazerWidth = 0.05
-----------------------------------------------------------------------------------------------------------------

--[[-------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
         .:':'`:·          ,:´'`;' ‘               ,.-:^*:*:^:~,'       
       /:::::::/`·,      /::::/;‘            ,:´:::::::::::::::/_‚     
      /:·*'`·:/:::::' , /·´'`;/::';'          /::;:-·^*'*'^~-;:/::/`;   '
    ,'         `:;::::'`i    ';:::';         /:´    ,. –.,_,.'´::/:::';' '
    ;            '`;:::'i    'i::::i      ,/    ,:´';         ;'´¯`,:::'i' 
    i               `;:';    'i:::i'   ' ,'     ';:::`,       ,:     ';::i‘ 
    i      ,          \|     '|:::i°   ;      ';:::/:`::^*:´;      i::';'‘
    |     ,'`,                i:;'' ‚   i       `;/::::::::,·´      ';:/'‘ 
    'i    'i:::i',             ';/'      ';         '` *^*'´         .'/‘   
    'i     ;::/ \           ;/'         '\                         /     
     \    'i/    '`·,      ,''             `·,                ,-·´ '      
      '`~´         '`·–·'´'                 '`*~·––·~^'´  '          
                        ‘                        '                      
      -~·-.'´::`;-:~.~·–.,   °          ',:'/¯/`:,                    __'             
  /:::::/::::/::::::::::::::'`,            /:/_/::::/';'           ,.·:'´::::::::`'·-.      
 /-~·-'·´¯`·-~·––  ::;:::::'i'         /:'     '`:/::;‘        '/::::::::::::::::::';     
 '`·,                       '`;::';        ;         ';:';‘       /;:· '´ ¯¯  `' ·-:::/'     
    '`i       'i*^~;          'i / °      |         'i::i      /.'´      _         ';/' ‘    
     ';       ; / ,·          .'/',        ';        ;'::i    ,:     ,:'´::;'`·.,_.·'´.,    ‘ 
     ';      ;' ;´         ~´;:::'i°      'i        'i::i'   /     /':::::/;::::_::::::::;‘  
   /´:;     ;–·:`:,          '`;:/°       ;       'i::;' ,'     ;':::::'/·´¯     ¯'`·;:::¦‘ 
,/::;:'\,  '/::::::;'           'i/' °       ';       i:/'  'i     ';::::::'\             ';:';‘ 
'.     '` '´·–·~*´           ,'  '          ';     ;/ °   ;      '`·:;:::::`'*;:'´      |/'  
  ` ·-.,                 ,-·´   '            ';   / °      \          '`*^*'´         /'  ‘ 
         '`*^~·- ·^*'´     '                 `'´       °    `·.,               ,.-·´      
                   '                           ‘                  '`*^~·~^*'´            
   ,._., ._                                      ,.-:~:'*:~-.°               ,.-:~:-.                    ___               
  /::::::::::'/:/:~-.,                        .·´:::::::::::::::;             /':::::::::'`,              .:´/::::;'`;     ‘       
 /:-·:;:-·~·';/:::::::::`·-.                /::;:-·~^*^~-:;:/ °          /;:-·~·-:;':::',            /::/::::/:::/'i           
 ';           '`~-:;:::::::::'`,         ,.-/:´     .,       ;/            ,'´          '`:;::`,         /·´¯¯¯'`;/::'i'       ‚   
  ',.                 '`·-:;:::::'i'‘     /::';      ,'::`:~.-:´;           /                `;::\       i          'i::'¦            
    `'i      ,_            '`;:::'¦‘    /;:- ´        `'·–·;:'/' _       ,'                   '`,::;     ';          ¦::;            
     'i      ;::/`:,          i'::/   /     ;:'`:.., __,.·'::/:::';     i'       ,';´'`;         '\:::', ‘  ;         ;::;  °         
    _;     ;:/;;;;:';        ¦'/    ;'      ';:::::::::::::::/;;::/   ,'        ;' /´:`';         ';:::'i‘  ';        ;:,'_ ,.-·~^; °
   /::';   ,':/::::::;'       ,´     ¦         '`·-·:;::·-·'´   ';:/‘   ;        ;/:;::;:';         ',:::;   ';      ';:/:::::::::/::i' 
,/-:;_i  ,'/::::;·´        ,'´      '\                         /'    'i        '´        `'         'i::'/   ,:      '/::;:-·~^';::'/' 
'`·.     `'¯¯     '   , ·'´           `·,                  ,·'  '    ¦       '/`' *^~-·'´\         ';'/'‚  i´        ¯          'i/ ' 
    `' ~·- .,. -·~ ´                    '`~·- . , . -·'´          '`., .·´              `·.,_,.·´  ‚  '`·,_          _ , ·'´‘   
           '                                                                                                 ¯ `'*'´ ¯     '      
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------]]--

-- Actuall code down here!!! ------------------------------------------------------------------------------------

-- Global Variables ---------------------------------------------------------------------------------------------
local plr = game.Players.LocalPlayer
local camera = workspace.CurrentCamera
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("StarterGui")
-----------------------------------------------------------------------------------------------------------------

local library
if RunService:IsStudio() then
	library = require(script:WaitForChild("ErisModularGuiV2"))
else
	library = loadstring(game:HttpGet('https://raw.githubusercontent.com/Eri-Yoshimi/Eri-s-Modular-Gui/refs/heads/main/v2.lua'))()
end

local Style = {
	name = "No Big Deal script by Eri",
	size = UDim2.new(0, 600, 0, 400),
	primaryColor = Color3.new(0.615686, 0.47451, 0.305882),
	secondaryColor = Color3.new(0.670588, 0.584314, 0.388235),
	backgroundColor = Color3.new(0, 0, 0),
	draggable = true,
	centered = false,
	freemouse = true,
	maxPages = 3,
	barY = 20,
	startMinimized = false,
	toggleBind = toggleKey,
}

local window = library:Initialize(Style)

if shutdownKey ~= nil then
	game:GetService("UserInputService").InputBegan:Connect(function(key)
		if key.KeyCode == shutdownKey then
			window:Destroy()
		end
	end)
end

-- Functions ----------------------------------------------------------------------------------------------------
local ESPCache = {}

local function CreateESP(basepart, color)
	local newEspGui = Instance.new("BillboardGui", plr.PlayerGui)
	newEspGui.Adornee = basepart
	newEspGui.AlwaysOnTop = true
	newEspGui.ResetOnSpawn = false
	task.delay(5, function()
		newEspGui.ResetOnSpawn = true
	end)
	local espSize = basepart.Size.X > basepart.Size.Z and basepart.Size.X or basepart.Size.Z
	newEspGui.Size = UDim2.new(espSize, minESPsize, espSize, minESPsize)
	local espFrame = Instance.new("Frame", newEspGui)
	espFrame.Size = UDim2.new(1, 0, 1, 0)
	espFrame.BackgroundTransparency = 1
	local newStroke = Instance.new("UIStroke", espFrame)
	if color then
		newStroke.Color = color
	else
		newStroke.Color = basepart.Color
	end
	newStroke.Thickness = 1
	table.insert(ESPCache, newEspGui)
	
	return newEspGui
end

local function lookAtBoard(board)
	local connection
	local goin = true

	task.delay(5, function()
		goin = false
		if connection then
			connection:Disconnect()
		end
	end)

	connection = RunService.RenderStepped:Connect(function()
		if goin then
			camera.CFrame = CFrame.new(board.CFrame.Position + board.CFrame.LookVector * 10, board.CFrame.Position)
		end
	end)
end

local function addLaser(part)
	if not part or not part:IsA("Attachment") then
		return
	end

	local laserPart = Instance.new("Part")
	laserPart.Parent = workspace
	laserPart.Anchored = true
	laserPart.CanCollide = false
	laserPart.CastShadow = false
	laserPart.Material = Enum.Material.Neon
	laserPart.Color = Color3.fromRGB(255, 0, 0)
	laserPart.Size = Vector3.new(lazerWidth, lazerWidth, 1)

	local function updateLaser()
		if not part or not part.Parent then
			laserPart:Destroy()
			return
		end

		local startPos = part.WorldCFrame.Position
		local direction = part.WorldCFrame.LookVector * 5000
		local rayOrigin = startPos
		local rayDirection = direction

		local raycastParams = RaycastParams.new()
		raycastParams.FilterDescendantsInstances = {part.Parent.Parent, workspace:WaitForChild(plr.Name), laserPart}
		raycastParams.FilterType = Enum.RaycastFilterType.Exclude
		raycastParams.IgnoreWater = true

		local raycastResult = workspace:Raycast(rayOrigin, rayDirection, raycastParams)

		if raycastResult then
			local hitPoint = raycastResult.Position
			local laserLength = (hitPoint - startPos).Magnitude

			laserPart.Size = Vector3.new(lazerWidth, lazerWidth, laserLength)
			laserPart.CFrame = CFrame.new(startPos, hitPoint) * CFrame.new(0, 0, -laserLength / 2)
		else
			local maxEnd = startPos + direction
			local laserLength = (maxEnd - startPos).Magnitude

			laserPart.Size = Vector3.new(lazerWidth, lazerWidth, laserLength)
			laserPart.CFrame = CFrame.new(startPos, maxEnd) * CFrame.new(0, 0, -laserLength / 2)
		end
	end

	game:GetService("RunService").Heartbeat:Connect(updateLaser)
end

-- Buttons ------------------------------------------------------------------------------------------------------
local espModule = window:createNewModule("ESP")

local function createESPButton(ButtonText, lookfor, bodyPart, color)
	local createdESPs = {}
	
	local newESPButton, newESPtoggled = espModule:AddToggle(ButtonText)
	newESPButton.Activated:Connect(function()
		if newESPtoggled:GetState() == false then
			for _, ce in createdESPs do
				ce:Destroy()
			end
			return
		end
		for i, d in workspace:GetDescendants() do
			if string.lower(d.Name) == lookfor and d:IsA("Model") then
				local part = d:FindFirstChild(bodyPart)
				if part:IsA("BasePart") then
					local newESP = CreateESP(part, color)
					table.insert(createdESPs, newESP)
				end
			end
		end
	end)
	workspace.DescendantAdded:Connect(function(d)
		if string.lower(d.Name) == lookfor and d:IsA("Model") then
			if newESPtoggled:GetState() == false then return end
			local part = d:FindFirstChild(bodyPart)
			if part:IsA("BasePart") then
				local newESP = CreateESP(part, color)
				table.insert(createdESPs, newESP)
			end
		end
	end)
end

createESPButton("Cash ESP", "cash", "Root", Color3.new(0, 1, 0))
createESPButton("Fake Cash ESP", "fakecash", "Root", Color3.new(1, 0.666667, 0))
createESPButton("Disk ESP", "disk", "Color", Color3.new(0, 0, 0))
createESPButton("Grenade ESP", "grenade", "Root", Color3.new(1, 0, 0))
createESPButton("Seltzer Bottle ESP", "bottle", "Fluid", Color3.new(0.666667, 0, 0.498039))

local PlayerESP, playerESPtoggled = espModule:AddToggle("Player ESP")
local createdPlayerESPs = {}
PlayerESP.Activated:Connect(function()
	if playerESPtoggled:GetState() == false then
		for _, ce in createdPlayerESPs do
			ce:Destroy()
		end
		return
	end
	for i, p in game.Players:GetPlayers() do
		local playerChar = workspace:FindFirstChild(p.Name)
		if playerChar then
			if playerChar:FindFirstChild("Head") then
				local createdESP = CreateESP(playerChar:FindFirstChild("Head"), Color3.new(1, 1, 1))
				table.insert(createdPlayerESPs, createdESP)
			end
			if playerChar:FindFirstChild("Torso") then
				local createdESP = CreateESP(playerChar:FindFirstChild("Torso"), Color3.new(1, 1, 1))
				table.insert(createdPlayerESPs, createdESP)
			end
		end
	end
end)
workspace.ChildAdded:Connect(function(c)
	if playerESPtoggled:GetState() == false then return end
	task.wait(1)
	if game.Players:FindFirstChild(c.Name) and c:IsA("Model") then
		if c:FindFirstChild("Head") then
			local createdESP = CreateESP(c:FindFirstChild("Head"), Color3.new(1, 1, 1))
			table.insert(createdPlayerESPs, createdESP)
		end
		if c:FindFirstChild("Torso") then
			local createdESP = CreateESP(c:FindFirstChild("Torso"), Color3.new(1, 1, 1))
			table.insert(createdPlayerESPs, createdESP)
		end
	end
end)

local lazerModule = window:createNewModule("Lazers")

local pistolLazers = lazerModule:AddButton("Pistol Lazers")
pistolLazers.Activated:Connect(function()
	for i, g in workspace:GetChildren() do
		if g.Name == "Pistol" or g.Name == "Snub" and g:FindFirstChild("Root") and g:FindFirstChild("Root"):FindFirstChild("Muzzle") then
			addLaser(g:FindFirstChild("Root"):FindFirstChild("Muzzle"))
		end
	end
end)

local kickLazers = lazerModule:AddButton("Kick-10 Lazers")
kickLazers.Activated:Connect(function()
	for i, g in workspace:GetChildren() do
		if g.Name == "ToolboxMAC10" and g:FindFirstChild("Root") and g:FindFirstChild("Root"):FindFirstChild("Muzzle") then
			addLaser(g:FindFirstChild("Root"):FindFirstChild("Muzzle"))
		end
	end
end)

local carcosaLazers = lazerModule:AddButton("Carcosa Rifle Lazers")
carcosaLazers.Activated:Connect(function()
	for i, g in workspace:GetChildren() do
		if g.Name == "Sniper" and g:FindFirstChild("Root") and g:FindFirstChild("Root"):FindFirstChild("Muzzle") then
			addLaser(g:FindFirstChild("Root"):FindFirstChild("Muzzle"))
		end
	end
end)

local aceLazers = lazerModule:AddButton("Ace Lazers")
aceLazers.Activated:Connect(function()
	for i, g in workspace:GetChildren() do
		if g.Name == "AceCarbine" and g:FindFirstChild("Root") and g:FindFirstChild("Root"):FindFirstChild("Muzzle") then
			addLaser(g:FindFirstChild("Root"):FindFirstChild("Muzzle"))
		end
	end
end)

local magnumLazers = lazerModule:AddButton("Magnum Lazers")
magnumLazers.Activated:Connect(function()
	for i, g in workspace:GetChildren() do
		if g.Name == "MAGNUM" and g:FindFirstChild("Root") and g:FindFirstChild("Root"):FindFirstChild("Muzzle") then
			addLaser(g:FindFirstChild("Root"):FindFirstChild("Muzzle"))
		end
	end
end)

local allLazers = lazerModule:AddButton("All Lazers")
allLazers.Activated:Connect(function()
	for i, g in workspace:GetChildren() do
		if (g.Name == "Snub" or g.Name == "Pistol" or g.Name == "DB" or g.Name == "AK47" or g.Name == "ToolboxMAC10" or g.Name == "MP5" or g.Name == "Sniper" or g.Name == "AceCarbine" or g.Name == "MAGNUM") and g:FindFirstChild("Root") and g:FindFirstChild("Root"):FindFirstChild("Muzzle") then
			addLaser(g:FindFirstChild("Root"):FindFirstChild("Muzzle"))
		end
	end
end)

local miscModule = window:createNewModule("Miscellaneous")

local lookAtMissionBoardList = miscModule:AddList("Look at board")
lookAtMissionBoardList:AddListItem("Alamont", "1")
lookAtMissionBoardList:AddListItem("Bergman", "3")
lookAtMissionBoardList:AddListItem("Halfwell", "2")
lookAtMissionBoardList.OnItemChanged:Connect(function(boardID)
	local board = workspace:WaitForChild("CurrentMap"):WaitForChild("Round"):WaitForChild("Core"):WaitForChild("Bases"):WaitForChild(boardID):WaitForChild("MissionBoard")
	lookAtBoard(board)
end)

local MonitorChat, monotoringChat = miscModule:AddToggle("Chat Monitor")
if game.ReplicatedStorage:FindFirstChild("Remotes") then
	local chatMonitor = false
	local chatEvent = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("ToClient"):WaitForChild("Chat")
	if chatEvent then
		chatEvent.OnClientEvent:Connect(function(plr, part, message)
			if monotoringChat:GetState() then
				print(plr.Name .. " sent: ".. message)
				CoreGui:SetCore("SendNotification", {
					Title = plr.Name;
					Text = message;
					Duration = 3;
				})
			end
		end)
	end
end

local showOwnHealth, showingOwnHealth = miscModule:AddToggle("Show own health")
showOwnHealth.Activated:Connect(function()
	local characterHealthFrame = plr.PlayerGui:WaitForChild("RootGui"):WaitForChild("CharacterFrame"):WaitForChild("PaperDoll")
	for i, v in characterHealthFrame:GetChildren() do
		if v:IsA("TextLabel") then
			v.TextTransparency = showingOwnHealth:GetState() and 0 or 1
		end
	end
end)

local hearAllPlayersOutput = Instance.new("AudioDeviceOutput", plr)
hearAllPlayersOutput.Name = "HearAllPlayers"
hearAllPlayersOutput.Player = plr
local hearAllPlayersVolumeControl = Instance.new("AudioFader", hearAllPlayersOutput)
local newVolumeWire = Instance.new("Wire", hearAllPlayersVolumeControl)
newVolumeWire.SourceInstance = hearAllPlayersVolumeControl
newVolumeWire.TargetInstance = hearAllPlayersOutput
for i, p in game.Players:GetPlayers() do
	if p == plr then continue end
	local mic = p:FindFirstChildOfClass("AudioDeviceInput")
	if mic then
		local newWire = Instance.new("Wire", hearAllPlayersOutput)
		newWire.SourceInstance = mic
		newWire.TargetInstance = hearAllPlayersVolumeControl
	end
end
game.Players.PlayerAdded:Connect(function(plr)
	task.wait(1)
	local mic = plr:FindFirstChildOfClass("AudioDeviceInput")
	if mic then
		local newWire = Instance.new("Wire", hearAllPlayersVolumeControl)
		newWire.SourceInstance = mic
		newWire.TargetInstance = hearAllPlayersVolumeControl
	end
end)
local volumeSlider = miscModule:AddSlider("Global voice chat volume", 0, 1)
volumeSlider.OnValueChanged:Connect(function(value)
	if hearAllPlayersOutput then
		hearAllPlayersVolumeControl.Volume = value
	end
end)
hearAllPlayersVolumeControl.Volume = volumeSlider:GetValue() or 0

--local teleportModule = window:createNewModule("Teleport")
--teleportModule:AddText("!!! WARNING: THIS IS VERY LIKELY TO GET YOU CAUGHT !!!")
--local function teleportTo(part)
--	local char = workspace:WaitForChild(game.Players.LocalPlayer.Name)
--	for i = 1, 10 do
--		char:PivotTo(part.CFrame)
--		wait()
--	end
--end
--local placeList = teleportModule:AddList("Teleport to")
--for i, v in workspace:WaitForChild("CurrentMap"):WaitForChild("Round"):WaitForChild("Tempmarkers"):GetChildren() do
--	placeList:AddListItem(v.Name, v)
--end
--placeList.OnItemChanged:Connect(function(place)
--	local placeInstance = workspace:WaitForChild("CurrentMap"):WaitForChild("Round"):WaitForChild("Tempmarkers"):FindFirstChild(place)
--	teleportTo(place)
--end)
-----------------------------------------------------------------------------------------------------------------

-- Credit Notification ------------------------------------------------------------------------------------------
CoreGui:SetCore("SendNotification", {
	Title = "No Big Deal Cheat Injected";
	Text = "Made by Eri";
	Duration = 5;
})
-----------------------------------------------------------------------------------------------------------------
