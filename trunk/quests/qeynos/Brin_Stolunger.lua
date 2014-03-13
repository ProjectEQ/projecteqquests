function event_say(e)
	local fac = e.other:GetFaction(e.self);
	
	if(e.message:findi("Hail")) then
		e.self:Say("What?  What?!!  Are we a [young steel warrior]..  Or another [spectator] for the Arena?");
	elseif(e.message:findi("i am a spectator")) then
		e.self:Say("As I thought!!  You shall be better off upon the ramparts of the arena.  It would be dreadful to see a fine citizen injured in the arena."); }
	elseif(e.message:findi("young steel warrior")) then
		--  confirmed live, says this even with apprehensive, might be class based
		if(fac > 4) then
			e.self:Say("Your head shall look grand mounted on the wall of the Steel Warriors Arena!!");
		else
			e.self:Say("I say!! Good show!! I see the look of the warrior in you. Some day you may be as great as Brin Stolunger. Ha!! Still, you are surely wet behind the ears. You will need to polish your skills. Take this sack. Return it to me when you have filled it with 5 bat wings and 5 snake scales. Be sure you combine the contents of the bag before you give it back to me. Now, be off!!");
			e.other:SummonItem(17935); -- Empty Arena Sack
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local fac = e.other:GetFaction(e.self);
	
	if(fac < 5) then
		if(item_lib.check_turn_in(e.trade, {item1 = 13399})) then -- Full Arena Sack
			e.self:Say("Jolly good!! You are clearly on your way to being a fine addition to the Steel Warriors. Now you must take this message to the person noted. All shall be explained.");
			e.other:SummonItem(18893); -- A Sealed Letter - lore: Note to Axe Broadsmith
			e.other:Ding();
			e.other:Faction(311,5,0); -- Steel Warriors
			e.other:Faction(135,5,0); -- Guards of Qeynos
			e.other:Faction(53,-5,0); -- Corrupt Qeynos Guards
			e.other:Faction(105,-5,0); -- Freeport Militia
			e.other:Faction(184,5,0); -- Knights of Truth
			e.other:AddEXP(6000);
		elseif(item_lib.check_turn_in(e.trade, {item1 = 18895})) then -- Letter of Recommendation - lore: Letter of Recommendation from Axe
			e.self:Say("So I see you have performed the test of undead. Good show. Now it is time you truly tested your mettle. Take this note to Grahan Rothkar. He can be found beneath the arena in the pens. May you live to join our brotherhood.");
			e.other:SummonItem(18894); -- A Sealed Letter - lore: Letter to Grahan Rothkar
			e.other:Ding();
			e.other:Faction(311,5,0); -- Steel Warriors
			e.other:Faction(135,5,0); -- Guards of Qeynos
			e.other:Faction(53,-5,0); -- Corrupt Qeynos Guards
			e.other:Faction(105,-5,0); -- Freeport Militia
			e.other:Faction(184,5,0); -- Knights of Truth
			e.other:AddEXP(6000);
			e.other:GiveCash(7,0,0,0);
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- end -- quests/qeynos/Brin_Stolunger