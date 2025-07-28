local aoc_raid = {
    expedition = { name="Sleepers Tomb", min_players=1, max_players=72},
    instance   = { zone="sleeper", version=1, duration=eq.seconds("7d") }, -- zone last 7d
    safereturn = { zone="eastwastes", x=130.77, y=-7448.90, z=163.28, h=227.0 }, --outside portal
    zonein     = { x=0, y=0, z=5.62, h=260 },
	key = 27265
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
			dz:AddReplayLockout(eq.seconds("1d")) -- 9 hour lockout
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