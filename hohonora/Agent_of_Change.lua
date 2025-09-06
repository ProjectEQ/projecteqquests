local aoc_raid = {
    expedition = { name="Halls of Honor", min_players=1, max_players=72},
    instance   = { zone="hohonora", version=0, duration=eq.seconds("7d") }, -- zone lasts 8 hours
    safereturn = { zone="hohonora", x=-2764.51, y=109.17, z=5.34, h=190 }, --outside portal
    zonein     = {  x=-2764.51, y=109.17, z=5.34, h=190 },
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
        local dz = e.other:CreateExpedition(aoc_raid)
        dz:AddReplayLockout(eq.seconds("9h")) -- 9 hour lockout
        e.self:Say("Tell me when you're [" .. eq.say_link("ready") .. "] to enter")
    elseif(dz:GetZoneName() == aoc_raid.instance.zone and e.message:findi("ready")) then
        e.other:MovePCDynamicZone(aoc_raid.instance.zone)
    end
end