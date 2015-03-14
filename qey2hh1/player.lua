-- BeginFile: qey2hh1\player.pl
-- Quest file for Adventurer's Stone
-- Quest file for West Karana: Paladin message during Necromancer Epic 1.5 (Soulwhisper)

function event_enter_zone(e)
	local level = e.self:GetLevel();
	local qglobals = eq.get_qglobals(e.self);

  	if(level >= 15 and qglobals.Wayfarer == nil) then
    		e.self:Message(15, "A mysterious voice whispers to you, 'Melaara Tenwinds has just joined the Wayfarers Brotherhood and has some information about them, and how you can start doing odd jobs for them. You looked like the heroic sort, so I wanted to contact you . . . discreetly.'");
  	end
end

function event_loot(e)
	if(e.item:GetID() == 26896 and e.self:HasItem(11430) == true and e.self:HasItem(14344) == true and e.self:HasItem(22892) == true) then
		e.self:Message(15, "With his last breath, the paladin says, 'You are too late. The last paladin has fled to Natimbi with the staff and is on his way to destroy it!'");
	end
end

-- EndFile: qey