--Shaman Skull Quest 7
-- items: 30984, 30985
function event_trade(e)
	local item_lib = require("items");
	
	--Turn in the a dusty iksar skull
	if(item_lib.check_turn_in(e.trade, {item1 = 30984})) then
		e.self:Emote("runs his scaled fingers slowly over the cracked, brittle skull. 'Granix did well to send you to me, I may yet be able to recover the spirit of this ancient and set it free. Come! I shall need your help with this ritual.'");
		e.self:Emote("dips the skull in the crystal waters. He lifts the skull over his head and stands completely still, allowing the water to drip down off the skull down over his body and finally on to the parched sand.'");
		e.self:Emote("begins to chant. Quietly at first but then louder and faster. He speaks a language you only vaguely recognize. It is the voice and language of the ancient oracles. His voice booms out over the water filling your mind with images of the ancient Sebilisian empire and the great Iksar rulers of old.");
		e.self:Emote("'s voice stops suddenly, leaving the air completely silent. Even the waves seem to have stopped for a moment. You begin to move toward him, but he raises a hand toward you motioning for you to stay still.");
		e.self:Say("Suddenly without warning the skull flies from Quilin's hands and flies into the murky waters. It stays submerged for a moment and then flies toward you, but this time an entire corpse is attached to it.");
		eq.spawn2(78215,0,0,e.self:GetX() + 5,e.self:GetY(),e.self:GetZ(),e.self:GetHeading());--spawn An Arisen Iksar
	--Turn in the Wet Skull Fragments
	elseif(item_lib.check_turn_in(e.trade, {item1 = 30985})) then
		e.self:Say("It seems this particular ancient does not wish to be put to rest. Return this note to Hierophant Granix and tell him what happened. He will surely wish this skull to be disposed of properly, but I do not have the power to do it myself.");
		e.other:QuestReward(e.self,0,0,0,0,30986); --note to Hierophant Granix
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
