--Beginner Stealth Manual

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:DoAnim(70);
		if(e.other:HasItem(28745) and e.other:GetLevel() > 19) then
			e.self:Say("Good day, " .. e.other:GetCleanName() .. ". I see your curiosity of the planes is growing, as you have obtained a manual on planar travel. It is good to see young adventurers interested in planar exploration, but there is one aspect of discovery you must always be prepared for, the struggle for survival. There are very dangerous places to be seen and experienced out there, and it would behoove you to be ready to face what challenges may come. With my help, I can teach you the basics of planar stealth and reflexes if you are [willing to learn].");
		else
			e.self:Say("Good day, " .. e.other:GetCleanName() .. ". I trust you are enjoying your visist to New Tanaan? If you have not already been, be sure to visit the Myrist library. There is much to be learned there; things you may have never thought possible before. I myself am a teacher of sorts, but I am only available to those who have obtained the proper tools of learning. Perhaps you will be a student of mine someday?");
		end
	elseif(e.other:HasItem(28745) and e.other:GetLevel() > 19 and e.message:findi("willing to learn")) then
		e.self:DoAnim(48);
		e.self:Say("This is good. Through your trials of planar travel shall your knowledge of stealth techniques grow, and the more you learn, the more you shall produce. In order to prove your newfound knowledge, your first lesson will be to create a special [planar stein] of particular design. Once you have acquired this stein, you must give it to me along with your Planar Traveler's Manual. Once done, new lessons may be opened up to you.");
	elseif(e.other:HasItem(28745) and e.other:GetLevel() > 19 and e.message:findi("planar stein")) then
		e.self:DoAnim(64);
		e.self:Say("To fashion the stein I seek, you must acquire a Block of Tanaan Clay, a Ceramic Lining Sketch, Tainted Planar Essence, a Water Flask, and some Sculpting Tools. Use these items in a pottery wheel to create your base model to work from. Crush some Valor Crystals together with some Glaze Lacquer in a glaze mortar to make Crystalline Valor Glaze. You must then take a Lacquered Peridot, the Crystalline Valor Glaze, a High Quality Firing Sheet, and the base model stein and merge them in a kiln to put the finishing touches on your work. I hope to see you bring me a handsome-looking stein soon. Good luck!");
	elseif(e.message:findi("willing to learn") or e.message:findi("planar stein")) then
		e.self:DoAnim(57);
		e.self:Say("I am glad to see you are willing to learn, however I'm afraid you are not ready for my teachings. Come back when you have acquired the proper tools of learning.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(e.other:GetLevel() > 19 and item_lib.check_turn_in(e.trade, {item1 = 29168, item2 = 28745})) then--Planar Peridot Encrusted Stein, Planar Traveler's Manual
		e.self:Say("Marvelous! You certainly have shown to be a skilled craftsman, and I thank you for such a lovely beverage conveyance. Take this book and use it to learn from. When you are ready, speak with Leramas Feston for your next lesson. Do not lose this manual or else he will not be able to train you.");
		-- Confirmed Live Experience
		e.other:QuestReward(e.self,0,math.random(10),math.random(10),0,28792,500000); --Beginner Stealth Manual
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
