-- BeginFile: southkarana\player.lua
-- Quest file for South Karana: Paladin message during Necromancer Epic 1.5 (Soulwhisper)

function event_loot(e)
	if(e.item:GetID() == 22892 and e.self:HasItem(26896) == true and e.self:HasItem(14344) == true and e.self:HasItem(11430) == true) then -- All 4 Paladin Heads
		e.self:Message(15, "With his last breath, the paladin says, 'You are too late. The last paladin has fled to Natimbi with the staff and is on his way to destroy it!'");
	end
end

-- EndFile: southkarana\player.lua