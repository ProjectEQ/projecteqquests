local aoc_raid = {
    expedition = { name="Vex Thal", min_players=1, max_players=72},
    instance   = { zone="vexthal", version=1, duration=eq.seconds("7d") }, -- zone lasts 7 days
    safereturn = { zone="umbral", x=-596, y=-1341, z=39.7, h=227.0 }, --outside portal
    zonein     = { x=-1655, y=257, z=-35, h=260 },
	key = 22198
}

function event_say(e)
	local dz = e.other:GetExpedition()
	if(e.message:findi("hail")) then
		if dz.valid and dz:GetZoneName() == aoc_raid.instance.zone then
			e.self:Say("Tell me when you're [" .. eq.say_link("ready") .. "] to enter")
		else
			e.self:Say("Would you like to [" .. eq.say_link("request") .. "] the expedition?")
		end
	elseif(e.message:findi("request")) then
		if e.other:KeyRingCheck(aoc_raid.key) then
			local dz = e.other:CreateExpedition(aoc_raid)
			dz:AddReplayLockout(eq.seconds("9h")) -- 9 hour lockout
			e.self:Say("Tell me when you're [" .. eq.say_link("ready") .. "] to enter")
		else
			e.self:Say("You do not have the key")
		end
	elseif(dz:GetZoneName() == aoc_raid.instance.zone and e.message:findi("ready")) then
		if e.other:KeyRingCheck(aoc_raid.key) then
			e.other:MovePCDynamicZone(aoc_raid.instance.zone)
		else
			e.self:Say("You do not have the key")
		end
	end
end