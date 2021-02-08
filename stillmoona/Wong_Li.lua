-- items: 36212, 36213
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("'Congratulations for finding me adventurer.  I simply could not resist meeting the one who had found the perfect Cherry Blossom.  I know your side wishes to unlock the secrets that lay within these temple walls but you must earn my trust before I will part with its treasures.  Lately a sickness of the spirit has infected some of my brethren.  Those few of us able to resist this illness are too weak to seek the cause of this malady and thus we need you to help us in this endeavor.  We think that the new goblin tending to the bath house, Nethran may have something to do with this.  Find him and see if he has any clues on his person.  Alas, I cannot tell you exactly how to bring him out of hiding except to say that he is easily angered.  Perhaps you can use this to lure him out...'");
		eq.unique_spawn(338404, 0, 0, 681, 650, 20, 258); -- NPC: Nethran
		eq.spawn2(338405, 0, 0, 669, 621, 20, 68); -- NPC: goblin_laborer
		eq.spawn2(338405, 0, 0, 692, 617, 20, 466); -- NPC: goblin_laborer
	end
end

function event_trade(e)
	local item_lib = require("items");
	if (item_lib.check_turn_in(e.trade, {item1 = 36212})) then	-- Ancient Note
		e.self:Say("'Nethran had this on him, you say?  This is very dire news indeed.  This note speaks of an ancient and powerful curse that long ago descended upon this temple and its inhabitants.  I cannot translate all of the glyphs though but perhaps if you spoke with the temple librarian we might be able to uncover more about this plague.  I will send word ahead so he will be expecting you.'");
		eq.unique_spawn(338411, 0, 0, -232, 1006, 43, 229); -- NPC: a_stillmoon_librarian
	elseif (item_lib.check_turn_in(e.trade, {item1 = 36213})) then	-- Fables of Winged Harmony
		e.self:Say("'Very good, adventurer. Very good indeed!  You have played your part in my plan most brilliantly but now I am forced to slay you, outsider.  You see, I cannot risk you upsetting my plans.'");
		e.self:SetSpecialAbility(24, 0);
		e.self:SetSpecialAbility(35, 0);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
