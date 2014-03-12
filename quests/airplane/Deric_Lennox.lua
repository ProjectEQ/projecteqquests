function event_spawn(e)
	eq.set_timer("depop",300000);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings there lad. Come seekin glory then have ya? Alrighty then, glorious ye shall be. Take me tests here, and I will show ya the light there. Take ye the Test of Resolution, of Theurgy, or the Weak?");
	elseif(e.message:findi("resolution")) then 	--cleric test of resolution
		e.self:Say("The test of resolution be an easy one. Trust me there! Just needin bring me a Spiroc Stattuete, a Spiroc Healing Totem, and a Silvered Spiroc Necklace. Ne'r liked those birdies anyway.");
	elseif(e.message:findi("theurgy")) then 	--cleric test of theurgy
		e.self:Say("The test of Theurgy. Ne'r understood it meself. It calls fer you ta bring me an Efreeti Mace, a Saffron Spiroc Feather, a Glowing Sapphire, and a Djinni Aura.");
	elseif(e.message:findi("weak")) then 		--cleric test of the weak
		e.self:Say("Aye, the weak. I laugh at 'em. Right after I put 'em in their places. Aye. Bring me there lad, a Efreeti Standard, a Manna Nectar, and a Shimmering Topaz. Yup, that'll do it.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 20813, item2 = 20812, item3 = 20954})) then 					--cleric test of resolution using silvered spiroc necklace, spiroc healing totem, spiroc statuette
		e.other:SummonItem(14562); --necklace of resolution
		e.other:AddEXP(100000);
		e.self:Say("Good on ya!");
		eq.depop();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 20815, item2 = 20816, item3 = 20814, item4 = 20961})) then 	--cleric test of theurgy using djinni aura, efreeti mace, glowing sapphire, saffon spiroc feather
		e.other:SummonItem(27718); --theurgist's star
		e.other:AddEXP(100000);
		e.self:Say("Good on ya!");
		eq.depop();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 20817, item2 = 20968, item3 = 20819, item4 = 20818})) then 	--cleric test of the weak using efreeti standard, manna nectar, mithril bands, shimmering topaz
		e.other:SummonItem(11691); --truwian baton
		e.other:AddEXP(100000);
		e.self:Say("Good on ya!");
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
