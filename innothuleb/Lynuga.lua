-- items: 10035, 10080, 10081, 10082
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hrrump?! Who you? " .. e.other:GetName() .. "? What you want with Lynuga? Me am out [" .. eq.say_link("collecting",false,"collecting") .. "]. Leave me be!");
	elseif(e.message:findi("collecting")) then
		e.self:Say("I collect all sort's of thing's. Gem's be my favorite. Me really like rubies. If you have ruby, give to me! Why you want to know? You want to steal my collection?!? I squish you if you do!!");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 10035})) then -- Handin: Ruby
		e.self:Say("Mmm. Ruby!! Me thank's you! Here take this, me got it off dead someone who try take my collection. Me think's this valuable thing..");
		e.other:SummonItem(eq.ChooseRandom(10080, 10081, 10082)); -- Random: Brutechopper, Midnight Mallet, Ivandyr's Hoop
		e.other:Ding();
		e.other:Faction(222,5,0); -- Faction: Broken Skull Clan
		e.other:Faction(308,-5,0); -- Faction: Shadowknights of Night Keep
		e.other:Faction(235,-5,0); -- Faction: DaBashers
		e.other:AddEXP(500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- EOF
