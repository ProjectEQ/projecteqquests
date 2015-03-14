-- Converted to .lua by Speedz
-- added saylink by robregen

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("You [" .. eq.say_link("friend of Gardunk",false,"friend of Gardunk") .. "]? Meez friend of Gardunk.");
	elseif(e.message:findi("friend of Gardunk")) then
		e.self:Say("Dat good. He tell meez you was comin'. Meez learn you to fight like alligator. Dominate through fear. Dat is what we do. Strike fear into heart of enemies. You [" .. eq.say_link("ready to start",false,"ready to start") .. "]?");
	elseif(e.message:findi("ready to start")) then
		e.self:Say("Good. We start easy. You go and kill snakes. Skin da snake and bring me da Snake Scales and a Fang. Dat your first task.");
	elseif (e.message:findi("learn about da animals")) then
		e.self:Say("We start with da wolf. You go to da forest and kill wolfies. Bring back to me four of da Ruined Wolf Pelts to prove what yooz done.");
	elseif (e.message:findi("fight like da alligator")) then
		e.self:Say("Best way to do dat is to fight alligators. But dere no alligators around, so we improvise. Hunt down da spiders in the forest and tear dere little legs off. Bring back two of those to Gargh");
	elseif (e.message:findi("next part of your training")) then
		e.self:Say("For da next part of your training you go and strike terror into da snakes again. Only not the little ones. You go and you skin the scales from a garter snake. You bring meez back one large snake skin. Meez be waiting for you here if you make it back alive.");
	elseif (e.message:findi("one more task")) then
		e.self:Say("You is getting stronger. It time for you to spread fear to da little halflings. Scour the forest until you find dem. You go and spread fear to them. Fight them. You peel off dere hides. Bring me four Matted Halfling Hides.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if (item_lib.check_turn_in(e.trade, {item1 = 13070, item2 = 13067})) then
		e.self:Say("You done good. You begin to know fear by causing fear. Next you learn about da animals. You learn about da animals by fighting dem and tearing them apart. You ready to [" .. eq.say_link("learn about da animals",false,"learn about da animals") .. "]?");
		e.other:SummonItem(7380);
		e.other:Ding();
		e.other:Faction(70,10,0);
		e.other:Faction(292,10,0);
		e.other:Faction(106,-10,0);
	elseif (item_lib.check_turn_in(e.trade, {item1 = 13782, item2 = 13782, item3 = 13782, item4 = 13782})) then
		e.self:Say("So you know all about da wolf now. Dat is good. Next step is important. You need to learn to [" .. eq.say_link("fight like da alligator",false,"fight like da alligator") .. "].");
		e.other:SummonItem(7381);
		e.other:Ding();
		e.other:Faction(70,10,0);
		e.other:Faction(292,10,0);
		e.other:Faction(106,-10,0);
	elseif (item_lib.check_turn_in(e.trade, {item1 = 13417, item2 = 13417})) then
		e.self:Say("Ok meez believe you. Here your reward. Meez think you just about ready for [" .. eq.say_link("next part of your training",false,"next part of your training") .. "].");
		e.other:SummonItem(7382);
		e.other:Ding();
		e.other:Faction(70,10,0);
		e.other:Faction(292,10,0);
		e.other:Faction(106,-10,0);
	elseif (item_lib.check_turn_in(e.trade, {item1 = 13060})) then
		e.self:Say("You did it! You cause lots of fear for them. Dat good. Even da spirits are starting to tremble. Soon you will be able to make dem do what you want. But there is [" .. eq.say_link("one more task",false,"one more task") .. "] meez want you to do.");
		e.other:SummonItem(7383);
		e.other:Ding();
		e.other:Faction(70,10,0);
		e.other:Faction(292,10,0);
		e.other:Faction(106,-10,0);
	elseif (item_lib.check_turn_in(e.trade, {item1 = 22572, item2 = 22572, item3 = 22572, item4 = 22572})) then
		e.self:Say("You did it! You cause lots of fear for them. Dat good. Even da spirits are starting to tremble. Soon you will be able to make dem do what you want. You have passed your final test.");
		e.other:SummonItem(7384);
		e.other:Ding();
		e.other:Faction(70,10,0);
		e.other:Faction(292,10,0);
		e.other:Faction(106,-10,0);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
