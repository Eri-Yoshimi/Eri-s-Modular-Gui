local library = loadstring(game:HttpGet('https://raw.githubusercontent.com/Eri-Yoshimi/Eri-s-Modular-Gui/refs/heads/main/v1.lua'))()

local window = library:Initialize()

local testModule = window:createNewModule("test")
testModule:AddButton("test").Activated:Connect(function()
	print("test worked!!")
end)
