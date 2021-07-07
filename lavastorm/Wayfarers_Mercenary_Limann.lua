-- Wayfarers_Mercenary_Limann (27079)
-- Dark Reign Token Turnin

--1023 norraths keepers
--1022 firiona vie
--1021 dark reign
--1020 Lanys T`Vyl

function event_say(e)
	if (e.message:findi("hail")) then
		e.self:Say("Me and me sister have got a great thing going here.  We easily can play both sides of the fence with these camps and earn a good amount of coin. As long as neither knows we are relations, we can continue this forever! I've been bringing tokens of the Dark Reign to them and they seem to enjoy getting them, and pay us fairly well.  So, if you give me one, I will be able to spin a tale that will put you in a favorable light.");
	end
end

function event_trade(e)
	local item_lib = require("items");
		if (item_lib.check_turn_in(e.trade, {item1 = 57209})) then --Dark Reign Token
			e.self:Say("You can be sure the Dark Reign will hear how you have run through an enemy and I might even spice it up and suggest you bested a Keeper. Oh, how they will like that!");
			e.other:Faction(1021, 20); --1021 dark reign
			e.other:Faction(1020, 20); --1020 Lanys T`Vyl
			e.other:Faction(1022, -20); --1022 firiona vie
			e.other:Faction(1023, -20); --1023 norraths keepers
		end
	item_lib.return_items(e.self, e.other, e.trade)
end
