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
  io.write(Defaults.AllDebuggingProtocols["SETUP"], "Where is the personal chest located?\n")
  io.write(Defaults.AllDebuggingProtocols["FORMAT"], "Number Number Number")
  repeat
	io.write(Defaults.AllDebuggingProtocols["ANSWER"])
	local Choice = io.read()
  until Choice:find("^%d+%s+%d+%s+%d+$")
  Lumber.Personal.Chest = Tablify.Execute("NORMAL", Choice, " ")
end

Lumber.Init()
return Lumber