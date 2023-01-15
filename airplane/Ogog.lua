-- items: 20983, 20963, 20981, 20982, 11675, 20980, 20979, 20956, 11674, 20976, 20977, 20978, 11673
function event_spawn(e)
	eq.set_timer("depop",300000);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Ogog not smart, but Ogog smarter than you.  You ready for Ogog or no?");
	elseif(e.message:findi("ready")) then
		e.self:Say("Ok, " .. e.other:GetName() .. ".  Ogog got some hard things for you.  You do bash, smash, or think test?");
	elseif(e.message:findi("think")) then 
		e.self:Say("think");
	elseif(e.message:findi("smash")) then
		e.self:Say("Ogog smash good. . . Ogog no think you can smash good.  But Ogog let you try.  You get Ogog Djinni War Blade, some virulent wasp poison, and a mottled spiroc feather.  Ogog say you good warrior if you do this!");
	elseif(e.message:findi("bash")) then
		e.self:Say("This one hard, Ogog like it.  Ogog need efreeti battle axe, some honey nectar, bottled djinni, and ethereal emerald. Then Ogog make you best basher.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 20983, item2 = 20963, item3 = 20981,item4 = 20982})) then -- warrior test of bash using efreeti battle axe, honeyed nectar, bottled djinni, ethereal emerald
		e.other:SummonItem(11675); --fangol
		e.other:AddEXP(100000);
		e.self:Say("Yuz do good! Take dis!");
		eq.depop();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 20980,item2 = 20979, item3 = 20956})) then -- warrior test of smash using djinni war blade, virulent poison, mottled spiroc feather
		e.other:SummonItem(11674); -- dagas
		e.other:AddEXP(100000);
		e.self:Say("Yuz do good! Take dis!");
		eq.depop();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 20976, item2 = 20977, item3 = 20978})) then -- warrior test of think using efreeti belt, pegasus statuette, spiroc wind totem, wind tablet
		e.other:SummonItem(11673); -- belt of the four winds
		e.other:AddEXP(100000);
		e.self:Say("Yuz do good! Take dis!");
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