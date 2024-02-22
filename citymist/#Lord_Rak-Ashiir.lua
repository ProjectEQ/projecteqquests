function event_spawn(e)
	eq.set_timer("faction",5000);
end

function event_timer(e)
	if(e.timer == "faction") then
		eq.set_proximity(e.self:GetX() - 45, e.self:GetX() + 45, e.self:GetY() - 45, e.self:GetY() + 45, e.self:GetZ() -5, e.self:GetZ() +5);
	end
end

function event_enter(e)
	if(e.other:GetModCharacterFactionLevel(e.self:GetPrimaryFaction()) < 1800 and e.other:Admin() < 80) then
		e.self:AddToHateList(e.other,1);
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 1673})) then
		if(e.other:GetModCharacterFactionLevel(e.self:GetPrimaryFaction()) >= 1800) then
			e.self:Emote("looks down at the tear in his hand and says 'A minion of my god came to me one night. I knew it was of Cazic-Thule as I was frozen in terror. My mind screamed for me to flee but my body would not respond. The being took my daughter and vanished to only he knew where. When I regained control of my body and thoughts, I felt nothing but betrayal. I don't care anymore about anything. If you want repentance then slay me, " .. e.other:GetName() ..".");
			e.other:Faction(404,100); -- true spirit
			e.other:Ding();
			eq.spawn2(90183,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #Lord_Rak`Ashiir_
			eq.depop()
		else
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
			eq.attack(e.other:GetName());
			e.other:QuestReward(e.self,{itemid = 1673}) -- Item: Child's Tear
		end	
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
