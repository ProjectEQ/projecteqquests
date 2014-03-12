function event_spawn(e)
	eq.set_timer("depop",300000);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("So, I have been called upon to test you, and test you I shall. I will give you the option of choosing your test though enlightened one. Shall you take the test of Strength, Sight, or Speed?");
	elseif(e.message:findi("strength")) then --monk test of strength
		e.self:Say("So be it, the test of Strenth you shall have. Bring to me a Verdant Tessera, some Finely Woven Gold Mesh,  and some Silken Strands. The task will not be easy, but it should serve as an adequate test of Strengh, for one of your abilities.");
	elseif(e.message:findi("sight")) then --monk test of sight
		e.self:Say("The test of sight is both a test of body and mind. The mind will allow you to see beyond that which is usually, invisible. Bring me a Gold Disc, a Tiny Ruby, and a Cracked Leather Eyepatch and I will assist you in seeing what should not be seen.");
	elseif(e.message:findi("speed")) then --monk test of speed
		e.self:Say("The test of speed. Every Monk must be swift if he is to best his opponent. Speed in both mind and body is essential in many facets of life. Return to me an Adumbrate Globe, a Shimmering Opal, and some Dove Slippers and I shall aid your speed of mind.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 20793, item2 = 20794, item3 = 20932})) then 	--monk test of strength using finely woven gold mesh, silken strands, verdant tessera
		e.other:SummonItem(1282); --mystical back straps
		e.other:AddEXP(100000);
		e.self:Say("You have done well, " .. e.other:GetName() .. ".");
		eq.depop();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 20796, item2 = 20939, item3 = 20795})) then --monk test of sight using cracked leather eyepatch, gold disc, tiny ruby
		e.other:SummonItem(1281); --ton po's eyepatch
		e.other:AddEXP(100000);
		e.self:Say("You have done well, " .. e.other:GetName() .. ".");
		eq.depop();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 20946, item2 = 20798, item3 = 20797})) then --monk test of speed using adumbrate globe, dove slippers, shimmering opal
		e.other:SummonItem(1280); --sandals of alacrity
		e.other:AddEXP(100000);
		e.self:Say("You have done well, " .. e.other:GetName() .. ".");
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	eq.stop_timer("depop");
	eq.depop();
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
