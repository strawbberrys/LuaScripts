--[[
  USAGE
  1. Put your script in the Script variable below
  2. Use the script printed out to the console
]]

local Script = [[print("Hello, world!")]]
local Obfuscated = ""
  
for Letter in Script:gmatch(".") do
    Obfuscated = Obfuscated .. '\\' .. Letter:byte()
end

print("loadstring('" .. Obfuscated .. "')()")
