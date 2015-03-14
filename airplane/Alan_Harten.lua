function event_spawn(e)
	eq.set_timer("depop",300000);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings faithful. Your faith shall be tested this day.  Shall you take the test of courage, skill, or protection?");
	elseif(e.message:findi("courage")) then		--cleric test of courage
		e.self:Say("You have come seeking the knowledge and treasures that I posses. I will impart such things to you, if you do a service to your god. It matters not who that god may be, but the service and the faith you must exemplify. Bring to me an Ochre Tessera, a Sky Emerald, and a Silver Hoop.");
	elseif(e.message:findi("skill")) then		--cleric test of skill
		e.self:Say("The test of skill it will be. Bring to me, a Gold Disc, a Dark Wood, and a Small Shield. You shall be rewarded upon your return.");
	elseif(e.message:findi("protection")) then	--cleric test of protection
		e.self:Say("So, you must be a great protector to have ventured this far. Bring for me an Adumbrate Globe, a Glowing Diamond, and some Shiny Pauldrons for your reward.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 20933, item2 = 20807, item3 = 20806})) then		--cleric test of courage using ochre tessera, silver hoop, sky emerald
		e.other:SummonItem(14563); --truewind earring
		e.other:AddEXP(100000);
		e.self:Say("Wonderful! Take this as your reward!");
		eq.depop();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 20808, item2 = 20939, item3 = 20809})) then --cleric test of skill using dark wood, gold disc, small shield
		e.other:SummonItem(27716); --aegis of the wind
		e.other:AddEXP(100000);
		e.self:Say("Wonderful! Take this as your reward!");
		eq.depop();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 20946, item2 = 20829, item3 = 20811})) then	--cleric test of protection using adumbrate globe, glowing diamond, shiny pauldrons
		e.other:SummonItem(27717); --pauldrons of piety
		e.other:AddEXP(100000);
		e.self:Say("Wonderful! Take this as your reward!");
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
