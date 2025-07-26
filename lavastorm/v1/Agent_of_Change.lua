local soldungb_raid = {
    expedition = { name="Lair of Lord Nagafen", min_players=1, max_players=72},
    instance   = { zone="soldungb", version=0, duration=eq.seconds("7d") }, -- zone lasts 8 hours
    safereturn = { zone="lavastorm", x=561.44, y=408, z=-45.1, h=439.25 },
    zonein     = { x=-263.68, y=-424.21, z=-108.34, h=128 },
}

function event_say(e)
	local dz = e.other:GetExpedition()
	if(e.message:findi("hail")) then
		if dz.valid and dz:GetZoneName() == "soldungb" then
			e.self:Say("Tell me when you're [" .. eq.say_link("ready") .. "] to enter")
		else
			e.self:Say("Would you like to [" .. eq.say_link("request") .. "] the expedition?")
		end
	elseif(e.message:findi("request")) then
		local dz = e.other:CreateExpedition(soldungb_raid)
		dz:AddReplayLockout(eq.seconds("9h")) -- 9 hour lockout
		e.self:Say("Tell me when you're [" .. eq.say_link("ready") .. "] to enter")
	elseif(dz:GetZoneName() == "soldungb" and e.message:findi("ready")) then
		e.other:MovePCDynamicZone("soldungb")
	end
end