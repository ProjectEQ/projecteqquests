function event_say(e)
local qglobals = eq.get_qglobals(e.self,e.other);

	if(e.message:findi("hail")) then
		e.self:Emote("feints an attack. She swings her dagger with incredible speed, bringing the tip of the blade to a stop less than an inch short of your neck. 'Another step closer, cur, and I'll end your miserable life. This ain't no place for no Dark Elf, and you'll be doing yourself a favor by leaving the premises. Quick as ye blink.' With a flick of her wrist, she flings her dagger at the table and it sinks deep into the wood with a satisfying thwack. Just as quickly, she withdraws another pair of previously concealed blades from her bodice and brandishes them menacingly. So, are you going to step off, or do you have the guts to take care of a [" .. eq.say_link("small job") .. "] for me? You should know that this ain't no boondoggle and I don't tolerate [" .. eq.say_link("stupid questions") .. "].");
	elseif(e.message:findi("small job")) then
		e.self:Say("How's your sewing, " .. e.other:GetName() .. "?' Elyn smirks at the absurdity of her query. Don't worry, this ain't no woman's work. I've got my eye on a certain market - for those in need of tasteful tailoring that conceals cold steel. You'd be surprised how much interest there is in such a product. The catch is, I need high quality materials and I need this taken care of discreetly. My contact wants to see a sample of the product soon. Everything you need to know you'll find on this list. Bring the items back to me in this here satchel, and don't let anyone catch you at work.");
		e.other:SummonItem(8775);
		e.other:SummonItem(52330);
	elseif(e.message:findi("stupid questions")) then
		e.self:AddToHateList(e.other);
	end
end

function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.self,e.other);
	
	if(qglobals["Fatestealer"] == "1" and item_lib.check_turn_in(e.trade, {item1 = 9807})) then
		e.self:Emote("reaches into the satchel and strokes the animal fur with the back of her hand. 'Mighty fine quality and craftsmanship if I do say so," .. e.other:GetName() .. ". My contact will surely appreciate this. You've done right to bring this back so quickly. I was starting to think you had forgotten about our bargain.' She releases her grip on her dagger so that you can get a view of the handle. 'Take a close look. You see the grooves in the handle, the soft leather? This beauty was made specially to fit my hands. A fine blade ain't no good unless you can wield it well. It's tantamount important that your weapon is comfortable. It should be a part of you, an extension of your arm. How else can you expect to wield it well? This is the knowledge I pass on to you.");
		e.other:Message(15,"You have coerced Elyn into revealing her secret");
		eq.set_global("Fatestealer_hl","1",5,"F");
	elseif(qglobals["Fatestealer"] == "1" and qglobals["Fatestealer_gem"] == nil and e.other:Race()=="Barbarian" and item_lib.check_turn_in(e.trade, {item1 = 52353})) then 
		e.self:Emote("reaches into the satchel and strokes the animal fur with the back of her hand. 'Mighty fine quality and craftsmanship if I do say so," .. e.other:GetName() .. ". My contact will surely appreciate this. You've done right to bring this back so quickly. I was starting to think you had forgotten about our bargain.' She releases her grip on her dagger so that you can get a view of the handle. 'Take a close look. You see the grooves in the handle, the soft leather? This beauty was made specially to fit my hands. A fine blade ain't no good unless you can wield it well. It's tantamount important that your weapon is comfortable. It should be a part of you, an extension of your arm. How else can you expect to wield it well? This is the knowledge I pass on to you.");
		e.other:Message(15,"You have coerced Elyn into revealing her secret");
		eq.set_global("Fatestealer_hl","1",5,"F");
		eq.set_global("Fatestealer_gem","1",5,"F");
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
