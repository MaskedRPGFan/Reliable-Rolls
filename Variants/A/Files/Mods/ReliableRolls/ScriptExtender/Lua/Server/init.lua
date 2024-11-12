Ext.Require("Server/mcm.lua")

Ext.Events.GameStateChanged:Subscribe(function(event)
	if event.FromState ~= "Sync" or event.ToState ~= "Running" then
		return
	end

	SetExtraHitPoints()
	SetExtraDamage()
end)
