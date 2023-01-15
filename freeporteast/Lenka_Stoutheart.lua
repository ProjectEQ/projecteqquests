-- items: 13818, 12146, 13814, 13922, 13923
function event_say(e)
	local fac = e.other:GetFaction(e.self);

	if(e.message:findi("hail") and (fac <= 5)) then
		e.self:Say("Hi, kid! You seem to be a stranger in these parts. Heed my words, this city is dangerous to new blood!");
		eq.signal(382254,1); -- NPC: Bronto_Thudfoot
	elseif(e.message:findi("hail") and (fac > 5)) then
		e.self:Say("Run while ye still can!!  The Wolves o' the North will not tolerate yer presence!");
	elseif(e.message:findi("toala sent me")) then
		e.self:Say("She does not even have the courtesy to come herself. Some old friend!! Listen, some rogue in this city broke into the [Beast] and stole a pouch containing a voucher ticket for a part I need to repair the Beast. I can't get the part back without the ticket. I did not see the rogue. I did not sleep on the Beast that night. Bronto was there. Ask him if he saw the rogue.");
	elseif(e.message:findi("what beast")) then
		e.self:Say("You're joking, right? You have never heard of the Blue Beast?!! She is the fastest ship in Norrath. She made the [Kunark run] in under three weeks. She was designed by [Bronto].");
	elseif(e.message:findi("kunark run")) then
		e.self:Say("The Kunark run is the most dangerous run between Freeport and [Firiona Vie], in Kunark. If the seas don't rip your hull to splinters and the pirates and sea wyrms don't kill you, you can make a quick run back and forth, avoiding any unwanted inspections.");
	elseif(e.message:findi("Firiona Vie")) then
		e.self:Say("Firiona Vie is an elven outpost on the continent of Kunark. Every so often I run supplies to and from there. Do not even think about asking me to take you there. It will be months before I can make improvements on the Blue Beast to make it impervious to aerial attacks.");
	elseif(e.message:findi("journal strongbox")) then
		e.self:Say("You must be from the Academy of Arcane Science.  Well, kid, bad news.  I was docked at the isle in the Ocean of Tears when I was boarded by the Freeport Militia.  To say the least, I panicked and dropped all my cargo.  It is still there.  Mostly illegal alcohol, but the strongbox is still out there, too.  Directly out from the dock.");
		eq.set_global("strongbox","1",7,"H1");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13818})) then -- Boat Beakon
		e.self:Say("Oh!! You must work for that Erudite named Palatos. I guess he won't have to spend anymore money drinking in Freeport. Here. Here is the portrait I kept until he could get me a new boat beacon.");
		e.other:SummonItem(12146); -- A'kanon's Portrait
		e.other:Ding();
		e.other:Faction(320,1,0); -- Faction: Wolves of the North
		e.other:Faction(327,1,0); -- Faction: Shamen of Justice
		e.other:Faction(265,1,0); -- Faction: Heretics
		e.other:Faction(267,1,0); -- Faction: High Guard of Erudin
		e.other:AddEXP(100);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13814})) then -- L.S. Pouch
		e.self:Say("You found my pouch! Thanks kid. Let me buy you A drink and this is for the good work. Hmmmm. It looks as though they took my voucher. Darn it! Hey... It looks like they were using my bag to hold items they were stealing. Here you go. You can have it. It looks like junk.");
		e.other:SummonItem(eq.ChooseRandom(13922,13923)); -- Snapped Pole or Moggok's Right Eye
		e.other:Ding();
		e.other:Faction(320,2,0); -- Faction: Wolves of the North
		e.other:Faction(327,2,0); -- Faction: Shamen of Justice
		e.other:Faction(328,2,0); -- Faction: Merchants of Halas
		e.other:Faction(311,2,0); -- Faction: Steel Warriors
		e.other:Faction(305,-2,0); -- Faction: Rogues of the White Rose
		e.other:AddEXP(200);
		e.other:GiveCash(0,2,0,0);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
