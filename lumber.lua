local Defaults = require("defaults")
local RCS = require(Defaults.Path.RCS)
local Tablify = require(Defaults.Path.Tablify)
local Lumber = {}
Lumber.Personal = {}
Lumber.Personal.Chest
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
  repeat
	io.write(Defaults.AllDebuggingProtocols["ANSWER"])
	local Choice = io.read()
	local Success = Choice:find("^%d+%s+%d+%s+%d+$")
	if not Success then 
	  io.write(Defaults.AllDebuggingProtocols["FAILED"], "Invalid format\n")
	  io.write(Defaults.AllDebuggingProtocols["FORMAT"], "Number -> Space -> Number -> Space -> Number\n")
	end
  until Success
  Lumber.Personal.Chest = Tablify.Execute("NORMAL", Choice, " ")
end

Lumber.Init()
return Lumber