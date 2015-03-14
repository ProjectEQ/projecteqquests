function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings. friend!!  I am Lozani. Scribe Supreme of the Eldritch Collective.  I have been sent forth from the great Library of Mechanimagica in the city of Ak'Anon. to study the arcane knowledge of man and beast alike.  I have studied many languages and spells. from Crushbone to Kerra Ridge.  I have found most languages hard to decipher.  As of this date. I have learned to read only the script of the [orc oracles].  Oh well. I am on a five decade mission.  Better luck next language.");
	elseif(e.message:findi("orc oracles")) then
		e.self:Say("Oh!! Heard of the orc oracles have you? A ghastly bunch they are!! Argh! The numerous days I spent interrogating those beasts with their foul breath. It was as if rats had gone and died in their mouths. I wished I could read minds after those days. TWENTY WEEKS of that rat-carcass breath and all I have learned is the ability to decipher [oracle scrolls] and [apprentice cantrips]. What a mess that was! I'm beginning to think I should have become a Gemchopper.");
	elseif(e.message:findi("oracle scroll")) then
		e.self:Say("Orc oracle scrolls? Mere shaman spells are they. I know how to decipher those illegible scrolls. I can do so, but it will cost you. Nothing is for free in this world, y'know? You give me one of those illegible scrolls and four gold coins.");
	elseif(e.message:findi("apprentice cantrips")) then
		e.self:Say("Orc apprentice cantrips. Child's play they are. Very difficult to decipher, mostly due to the orc sweat smearing the writing. I fill in the blanks with a second orc cantrip and my universe of knowledge, so you never know what spell is going to be scribed! Could be magic, could be wizardry, could be necromancy, golly!! Sometimes I even end up with a recipe!! If you want me to try to decipher one just hand me two illegible cantrips. No coinage necessary!! They are mostly apprentice spells. Nothing much.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local scroll = 0;

	if(item_lib.check_turn_in(e.trade, {item1 = 13225,gold = 4})) then -- Illegible Scroll and 4 gold#
		e.self:Say("I managed to decipher this one.");
		scroll = 1;
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13845,item2 = 13845})) then -- Illegible Cantrip
		e.self:Say("I managed to decipher these.");
		scroll = 1;
	end
	if(scroll == 1) then
		e.other:SummonItem(eq.ChooseRandom(15200, 15042, 15226, 13360, 15246, 15276));
		e.other:Ding();
		e.other:Faction(115,5,0); -- Gem Choppers
		e.other:Faction(176,5,0); -- King AkAnon
		e.other:Faction(210,5,0); -- Merchants of AkAnon
		e.other:Faction(71,-5,0); -- Dark Reflection
		e.other:Faction(322,-5,0); -- The Dead
		e.other:AddEXP(100);
		scroll = 0;
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
