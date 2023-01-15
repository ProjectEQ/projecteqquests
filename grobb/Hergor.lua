-- items: 12210, 2161, 2162, 2163, 2164, 2165, 2167, 2168, 2169, 2170, 2171, 2172
function event_say(e)
	local pfaction = e.other:GetFaction(e.self);

	if(e.message:findi("hail")) then
		e.self:Say("Whats you wants!!  Me great master of da bashers.  Me tinks yooz must be lookin' fer trainin'.  Yooz looks like a weaklin'.  Me train yooz and yooz helps me get fatter.  Well!!  Are yooz gonna [helps Hergor get fatter]?!!");
	elseif(pfaction > 5) then
		e.self:Say("Me smell death coming your way!  Da bashers no like you. Hey!  Me am basher!");
	elseif(pfaction > 4) then
		e.self:Say("More service to da bashers, den me listen.");
	elseif(e.message:findi("get fatter")) then
		e.self:Say("Yooz makes da good choice.  Me nevers get enuff ta eats.  Eats more and gets more stronger. me always say.  Yooz gos and speaks wit carver Cagrek.  Yooz tell him [Hergor wants his fungus dung pie].  Yooz duz dis and me gives you sum rawhide armer or tatters armer.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local pfaction = e.other:GetFaction(e.self);

	if (pfaction < 5 and item_lib.check_turn_in(e.trade, {item1 = 12210})) then
		e.self:Say("Mmmmm... Mm... Mmm! Dat smells gud! Me gets more fat and gets more strength. You dus gud job weekling. Me gives you dis armer. It keeps you from getting bashed gud. Now gos away. Me no share pie wit weekling.");	
		e.other:Faction(235,5,0); -- Da Bashers
		e.other:Faction(222,-1,0); -- Broken Skull Clan
		e.other:Ding();
		e.other:AddEXP(145); -- seen at level 1
		e.other:SummonItem(eq.ChooseRandom(2161, 2162, 2163, 2164, 2165, 2167, 2168, 2169, 2170, 2171, 2172)); -- Item(s): Large Raw-hide Skullcap (2161)
	end

	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:grobb  ID:2548 -- Hergor
