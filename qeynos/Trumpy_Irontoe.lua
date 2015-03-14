function event_say(e)
	local fac = e.other:GetFaction(e.self);
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Heh? What's yer name? %s? Never heard of ya. Now quit breathin' on me and buy us some [drinks]!",e.other:GetName()));
	elseif(e.message:findi("drinks")) then
		e.self:Say("<BURP!> Yeah. Gimme a.. <BURP!> er.. honey mead.");
	elseif(e.message:findi("kaladim")) then
		e.self:Say(string.format("Heh? Kaladim, you say? It's a long way from here, I tell you.. Home to us dwarves it is. I miss it sometimes though.. Its tough being a swashbuckling dwarf with my rugged good looks when all the other dwarves are so envious. Cripes, %s... You got me all misty-eyed now.. <BURP> Peh! Buy me a honey mead, will ya?",e.other:GetName()));
	elseif(fac < 4) then
		if(e.message:findi("skippy")) then
			e.self:Say("Skippy? You mean that fish farmer? Heh heh heh. What a moron. And his brother [Beren] has the nerve to actually threaten ME!?.. Burp.. Bah. Remind me to tell [Kane] about that steaming pile of gnoll dung.");
		elseif(e.message:findi("beren")) then
			e.self:Say("Don't even mention that weakling's name. He.. burp.. Keeps threatening me. ME! Trumpy IRONTOE!!! Peh! That useless son of a goblin had better wise up and realize that in this burg if you ain't with [Kane], you are against him. And if you are against him.. burp.. you ain't nothing but a corpse.");		
		elseif(e.message:findi("kane")) then
			e.self:Say("Ah.. burp.. that piece of cr.. eh? Oh its you.. Kane runs this burg.. or at least he will.. if [Sragg] can get his act together.");		
		elseif(e.message:findi("sragg")) then
			e.self:Say("Where did you hear that name?!? Not from me! I didn't say nothing about Sragg or those Bloodsabers or their dang temple in the sewers! Get away from me ya hobgoblins! I don't wants no trouble!");
		end
	else
		e.self:Say("You had better just be.. <BURP!>.. minding your own business if you know what is good for you. Gnollbreath. We Irontoes are proud and strong bunch of dwarves from [Kaladim]. We crush weaklings like you. <BURP>");
	end
end

function event_trade(e)
	local drinks = 0;
	local moredrinks = 0;
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 13033, item2 = 13033, item3 = 13033, item4 = 13033})) then
		moredrinks = 4;
		drinks = 3;
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13033, item2 = 13033, item3 = 13033})) then
		drinks = 3;
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13033, item2 = 13033})) then
		drinks = 2;
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13033})) then
		drinks = 1;
	end
	if(drinks > 0) then
		repeat
			e.self:Say("Beh! Thanks, Skippy. Why don't ya buy yourself one? And.. <gulp>.. <burp>.. get me another!");
			drinks = drinks - 1;
		until drinks == 0
	end
	if(moredrinks == 4) then
		e.self:Say("BWAH hah hah! I knew you wasn't the loser you.. <gulp>.. <gulp>.. appear to be! I will have to tell [Kane].. <burp>.. all about you. Maybe get you in the gang!");
		e.other:Ding();
		e.other:Faction(33,2,0);
		e.other:Faction(217,-2,0);
		e.other:Faction(53,2,0);
		e.other:Faction(135,-2,0);
		e.other:Faction(164,2,0);
		e.other:AddEXP(200);	
	end
	drinks = 0;
	moredrinks = 0;
	item_lib.return_items(e.self, e.other, e.trade)
end
