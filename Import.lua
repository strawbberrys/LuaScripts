--[[
    USAGE
    1. loadstring(game:HttpGet('https://raw.githubusercontent.com/strawbberrys/LuaScripts/main/Import.lua', true))()
    2. import 'ReplicatedStorage' from 'GetService'

    You only have to run the loadstring once, then you can remove it from your script
]]

getgenv().importValue = ""

getgenv().import = function(name)
    importValue = name
end

getgenv().from = function(name)
    getfenv(2)[importValue] = game[name](game, importValue)
    setfenv(2, getfenv(2))
end
