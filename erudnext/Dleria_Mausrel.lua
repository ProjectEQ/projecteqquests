function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hail! You appear to be a [new priest]. Ah, I so enjoy the presence of youth within Deepwater Temple. I am sure Prexus is smiling upon us as we speak.");
	elseif(e.message:findi("new priest")) then
		e.self:Say("As I suspected. I shall assist you with your training and you shall assist the temple with your service. A young priest can help out by asking to [convert fishermen in Qeynos] or maybe even something truly great such as requesting to [protect the depths].");
	elseif(e.message:findi("protect the depth")) then
		e.self:Say("We have heard of zombies inhabiting the depths of Erud's Crossing. Go and seek them out. Destroy them. This evil should not exist within the realm of the Ocean Lord. Take this bag. Fill it with their rotting flesh. combine it and return it to me. May Prexus guide you.");
		e.other:SummonItem(17939);
	elseif(e.message:findi("convert fishermen in qeynos")) then
		e.self:Say("So you wish to journey to Qeynos? So be it. Go to Qeynos and find me a willing convert. Ask them if they wish the blessing of Prexus. If so, they should snap their pole in two and you will return it to me. Do this and be rewarded.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13922})) then
		e.self:Say("Good work, young priest. Soon you shall carry the word of the Ocean Lord to distant lands. For now, continue your training. As for your reward, I have this which has been sitting in our vault. I hope it can be of use to a young priest such as yourself.");
		e.other:SummonItem(eq.ChooseRandom(2144,2146,2147,17005));
		e.other:Ding();
		e.other:Faction(79,10,0);
		e.other:Faction(145,10,0);
		e.other:Faction(143,-15,0);
		e.other:AddEXP(100);
		e.other:GiveCash(0,14,5,0);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13880})) then
		e.self:Say("Peeuww!! That most certainly is zombie flesh!! Here is your reward. You have done a fine service in the name of Prexus. Soon you shall advance and we may tell you of greater dangers lurking in the depths.");
		e.other:Ding();
		e.other:Faction(79,10,0);
		e.other:Faction(145,10,0);
		e.other:Faction(143,-15,0);
		e.other:AddEXP(100);
		e.other:GiveCash(0,12,4,0);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:erudnext  ID:24050 -- Dleria_Mausrel