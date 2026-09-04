local Defaults = require("defaults")
local RCS = require(Defaults.Path.RCS)
local Tablify = require(Defaults.Path.Tablify)
local Lumber = {}

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
  local PersonalChest = Tablify.Execute("NORMAL", Choice, " ")
end

Lumber.Init()
return Lumber