function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Greetings, %s! Join in the [celebration]! Have a few drinks. Alas, there are no [Tumpy Tonics].",e.other:GetName()));
	elseif(e.message:findi("ariska")) then
		e.self:Say("Ariska Zimel was my best friend. He and I learned our knowledge of metal from such places as Halas and Kaladim. When he disappeared, it seemed to involve foul play. He must be alive somewhere in the city. I pray this is not the work of [Pietro Zarn].");
	elseif(e.message:findi("pietro zarn")) then
		e.self:Say("While we were traveling through the Lavastorm Mountains, we happened upon a caravan. They wore emblems in honor of the evil god, Innoruuk. They did not see us, but we saw them. And most importantly of all, Ariska saw the apparent leader's sword. It was glowing with great energy. Suddenly, the evil knights were in a battle. The knights gave chase, leaving their camp unattended. The knight who owned the sword left it behind, opting to fight with another, leading me to believe it was not his to begin with. It was at this point that Ariska ran down and grabbed the sword. A few weeks later, we were to learn that the knight was a powerful man by the name of Pietro Zarn and that he was looking for a sword stolen from him. He called it .. Soulfire. I believe Zarn must have finally found Ariska.");
	elseif(e.message:findi("tumpy tonics")) then
		e.self:Say("Ah a tumpy tonic, good drink indeed. They are made. Lets see if I can rememeber how to make them.  Ahh yes, ye take a kiola nut and stir it with water, wait a while and ya got it.  If you plan to make some then please by all means bring me one to try as I sure do miss them.");
	end
end

function event_trade(e)
	local Tumpy_Tonic = 0;
	local item_lib =require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18818})) then
		e.self:Say("This used to be hanging in Zimel's Blades. It is the price list. It is badly faded though. There was a fire in Zimel's Blades and I was on the scene just afterward. I did not see this hanging. I wonder who took it . . . Hmmmm.. oh, yes.. the markings on the list! It is a code! Here. I will fill it in. Read it. You probably do not even know who Ariska is.");
		e.other:SummonItem(18818);
		e.other:Ding();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 12114,item2 = 12114,item3 = 12114,item4 = 12114})) then
		Tumpy_Tonic = 4;
	elseif(item_lib.check_turn_in(e.trade, {item1 = 12114,item2 = 12114,item3 = 12114})) then
		Tumpy_Tonic = 3;
	elseif(item_lib.check_turn_in(e.trade, {item1 = 12114,item2 = 12114})) then
		Tumpy_Tonic = 2;
	elseif(item_lib.check_turn_in(e.trade, {item1 = 12114})) then
		Tumpy_Tonic = 1;
	end
	
	if(Tumpy_Tonic > 0) then
		repeat
			e.self:Say("Mmmm. Weee thats a good drink you made there.");
			e.other:Ding();
			e.other:Faction(47,1,0);
			e.other:Faction(48,1,0);
			e.other:Faction(184,1,0);
			e.other:Faction(217,1,0);
			e.other:AddEXP(15);
			Tumpy_Tonic = Tumpy_Tonic - 1;
		until Tumpy_Tonic == 0
	end

	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:freportn -- Groflah_Steadirt