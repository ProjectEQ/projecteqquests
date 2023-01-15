-- items: 1673
function event_trade(e)
	local item_lib = require("items");
	if e.other:GetFactionLevel(e.other:CharacterID(), e.self:GetID(), e.other:GetRace(), e.other:GetClass(), e.other:GetDeity(), 404, e.self) == 1 then
		if(item_lib.check_turn_in(e.trade, {item1 = 1673})) then
			e.self:Emote("looks down at the tear in his hand and says 'A minion of my god came to me one night. I knew it was of Cazic-Thule as I was frozen in terror. My mind screamed for me to flee but my body would not respond. The being took my daughter and vanished to only he knew where. When I regained control of my body and thoughts, I felt nothing but betrayal. I don't care anymore about anything. If you want repentance then slay me, " .. e.other:GetName() ..".");
			eq.depop()
			e.other:Ding();
			e.other:Faction(404,100); -- true spirit
			eq.spawn2(90183,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: #Lord_Rak`Ashiir_
		end
	else
		e.self:Say("Go away! We don't have time for the likes of you.");
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
