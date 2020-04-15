function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("'You have found the four scrolls of strength and wish to begin the Trial of Strength?  So be it.  Long ago, a council of five warriors protected this temple from those that would harm it.  However, one day they were bested in battle and were destroyed.  This monument behind me is all that remains to remind the temple inhabitants of their deeds.  However, the spirits of the fallen warriors long to do battle again.  If you believe you are [worthy], I will raise them from the dead so that you may begin the Trial of Strength.'");
	elseif(e.message:findi("worthy")) then
			e.self:Say(" 'Rise, warriors of the past!  Experience the glory of combat once more!'");
			eq.spawn2(338167,0,0,144,689,43.70,384); -- NPC: An_Ancient_Protector
			eq.spawn2(338167,0,0,164,700,43.70,384); -- NPC: An_Ancient_Protector
			eq.spawn2(338167,0,0,166,716,43.70,384); -- NPC: An_Ancient_Protector
			eq.spawn2(338167,0,0,153,732,43.70,384); -- NPC: An_Ancient_Protector
			eq.spawn2(338167,0,0,144,711,43.70,384); -- NPC: An_Ancient_Protector
			eq.depop();
	end
end
