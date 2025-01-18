local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()


local Window = Library.CreateLib("developer: headtager", "RJTheme3")

local Tab = Window:NewTab("Home")

local Section = Tab:NewSection("Functions")

Section:NewToggle("Invisibility", "ToggleInfo", function(state)
    if state then
        char = game.Players.LocalPlayer.Character
hum = char:FindFirstChildWhichIsA("Humanoid")
 
function scan(p)
    for i,v in pairs(p:GetChildren()) do
        if v:IsA("BasePart") then
            v.Transparency = 1
        end
        if v:IsA("Decal") then
            v.Transparency = 1
        end
    scan(v)
    end
end
 
while true do
  if hum.Health <= 0 then break end
    scan(char)
    wait()
end
    else
        char = game.Players.LocalPlayer.Character
hum = char:FindFirstChildWhichIsA("Humanoid")
 
function scan(p)
    for i,v in pairs(p:GetChildren()) do
        if v:IsA("BasePart") then
            v.Transparency = 0
        end
        if v:IsA("Decal") then
            v.Transparency = 0
        end
    scan(v)
    end
end
 
while true do
  if hum.Health <= 0 then break end
    scan(char)
    wait()
end
    end
end)

Section:NewButton("Infinity jumps", "ButtonInfo", function()
    local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local canJump = true
local jumpCooldown = 0.1 -- Cooldown time in seconds

local function onJumpRequest()
  if canJump then
    humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    canJump = false
    task.wait(jumpCooldown)
    canJump = true
  end
end

game:GetService("UserInputService").JumpRequest:Connect(onJumpRequest) 
end)

Section:NewButton("Noclip", "ButtonInfo", function()
    local Noclip = nil
local Clip = nil

function noclip()
  Clip = false
  local function Nocl()
    if Clip == false and game.Players.LocalPlayer.Character ~= nil then
      for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
        if v:IsA('BasePart') and v.CanCollide and v.Name ~= floatName then
          v.CanCollide = false
        end
      end
    end
    wait(0.21)
  end
  Noclip = game:GetService('RunService').Stepped:Connect(Nocl)
end

function clip()
  if Noclip then Noclip:Disconnect() end
  Clip = true
end

noclip() -- to toggle noclip() and clip()
end)

Section:NewButton("Wallhack", "ButtonInfo", function()
    while wait(0.5) do
    for i, childrik in ipairs(workspace:GetDescendants()) do
        if childrik:FindFirstChild("Humanoid") then
            if not childrik:FindFirstChild("EspBox") then
                if childrik ~= game.Players.LocalPlayer.Character then
                    local esp = Instance.new("BoxHandleAdornment",childrik)
                    esp.Adornee = childrik
                    esp.ZIndex = 0
                    esp.Size = Vector3.new(4, 5, 2)
                    esp.Transparency = 0.65
                    esp.Color3 = Color3.fromRGB(138,43,226)
                    esp.AlwaysOnTop = true
                    esp.Name = "EspBox"
                end
            end
        end
    end
end
end)

Section:NewSlider("Walk speed", "SliderInfo", 500, 0, function(s)
    game:GetService("RunService").RenderStepped:wait() 
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

Section:NewSlider("Jump power", "SliderInfo", 500, 0, function(s)
    game:GetService("RunService").RenderStepped:wait() 
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)
