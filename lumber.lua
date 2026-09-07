local Defaults = require("defaults")
local RCS = require(Defaults.Path.RCS)
local Tablify = require(Defaults.Path.Tablify)
local Lumber = {}
Lumber.CoordinatesFormat = "^%-?%d+ %-?%d+ %-?%d+$"
Lumber.Personal = {}
Lumber.Personal.Trees = {}
Lumber.Settings = {}
Lumber.Settings.File = "LumberConfig"

function Lumber.Init()
  io.write(Defaults.AllDebuggingProtocols["INFO"], "Initializing Lumber.lua code\n")
  io.write(Defaults.AllDebuggingProtocols["PRESSENTER"], "\n")
  io.read()
  -- Delimiter
  io.write(Defaults.AllDebuggingProtocols["SETUP"], "Where is the personal chest located\n")
  io.write(Defaults.AllDebuggingProtocols["SETUP"], "relative to the lumber turtle's location?\n")
  io.write(Defaults.AllDebuggingProtocols["FORMAT"], "+X = Forward. +Y = Up. +Z = Right.\n")
  io.write(Defaults.AllDebuggingProtocols["FORMAT"], "-X = Backwards. -Y = Down. -Z = Left.\n")
  io.write(Defaults.AllDebuggingProtocols["FORMAT"], "X -> Space -> Y -> Space -> Z\n")
  io.write(Defaults.AllDebuggingProtocols["FORMAT"], "Number -> Space -> Number -> Space -> Number\n")
  local Choice
  repeat
	io.write(Defaults.AllDebuggingProtocols["ANSWER"])
	Choice = io.read()
	local Success = Choice:find(Lumber.CoordinatesFormat)
	if not Success then 
	  io.write(Defaults.AllDebuggingProtocols["FAILED"], "Invalid format\n")
	  io.write(Defaults.AllDebuggingProtocols["FORMAT"], "Number -> Space -> Number -> Space -> Number\n")
	end
  until Success
  Lumber.Personal.Chest = Tablify.Execute("NORMAL", Choice, " ")
  io.write(Defaults.AllDebuggingProtocols["INFO"], "Please input every single tree's location.\n")
  io.write(Defaults.AllDebuggingProtocols["INFO"], "Type 'done' when all coordinates have been written\n")
  repeat
	io.write(Defaults.AllDebuggingProtocols["ANSWER"])
	Choice = io.read():upper()
	local Success = Choice:find(Lumber.CoordinatesFormat)
	if not Success and Choice ~= "EXIT" then
	  io.write(Defaults.AllDebuggingProtocols["FAILED"], "Invalid format\n")
	  io.write(Defaults.AllDebuggingProtocols["FORMAT"], "Number -> Space -> Number -> Space -> Number\n")
	elseif Success then
	  Lumber.Personal.Trees[#Lumber.Personal.Trees+1] = Tablify.Execute("NORMAL", Choice, " ")
	end
  until Choice == "EXIT"
end

Lumber.Init()
return Lumber