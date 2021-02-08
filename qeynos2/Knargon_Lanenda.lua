-- items: 13903, 18722
function event_waypoint_arrive(e)
	if(e.wp == 2) then
		e.self:Say("Hey Pelshia, how's business?");
		eq.signal(2073,1); -- NPC: Pelshia_Thuxpire Weapons
	elseif(e.wp == 7) then
		e.self:Say("And what about you, gorgeous? Looking as delightful as ever, I must say.");
	elseif(e.wp == 18) then
		e.self:Say("So, yeah, that Pelshia, she's all over me. And Renux, too. She was giving me the look, man. I'm telling ya. Zan, all the ladies want a piece of the Knargman.");
		eq.signal(2085,1); -- NPC: Zannsin_Resdinet Rogue Guildmaster
	end
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("How about you and I go take a stroll under the docks tonight?");
		eq.signal(2073,2); -- NPC: Pelshia_Thuxpire Weapons
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hey..  What's up? My name's Knargon Lanenda. I just came over here from [Freeport] a couple of months ago. I used to run a big business importing goods from [Faydwer]. If you've been to [Freeport]. I'm sure you've heard of me.");
	elseif(e.message:findi("freeport")) then
		e.self:Say("It's a long way from here. . .which is a good thing for me.");
	elseif(e.message:findi("faydwer")) then
		e.self:Say("It's a long way from here. . .which is a good thing for me.");
	elseif(e.message:findi("jracol")) then
		e.self:Say("I don't know why [Carson] likes that guy ... he's certainly been nothing but trouble for me.");
	elseif(e.message:findi("carson")) then
		e.self:Say("Carson McCabe? He runs that sham of a fortress called [Highpass Hold]. We've been dealing with him for a few years, now. But, lately he seems to be losing control of his business. [Hanns] will whip him into shape pretty soon though, I bet.");
	elseif(e.message:findi("shipment")) then
		e.self:Say("We have a small shipment of goods coming in later tonight. The [courier] will be waiting outside the city gates. Casually tell the courier [Lovely night for a stroll], and give him this old card as proof that you work for us. Make certain that you are not followed, and return the shipment to me.");
		e.other:SummonItem(13903); -- Bent Playing Card
	elseif(e.message:findi("courier")) then
		e.self:Say("The courier that usually runs [McCabe]'s shipment, is that good for nothing J'Racol. I don't trust his kind.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18722})) then -- Sealed Note For Knargon
		e.self:Say("Hmm. Carson better deal with his little 'problem' soon, it's costing us a lot of money. Hanns is gonna skin us all when he hears this. Go tell Hanns that [Carson has a mole in the Highpass] guards, and see what he wants us to do.");
		e.other:Ding();
		e.other:Faction(223,5,0); -- Circle of Unseen Hands
		e.other:Faction(230,5,0); -- Corrupt Qeynos Guards
		e.other:Faction(273,5,0); -- Kane Bayle
		e.other:Faction(291,-10,0); -- Merchants of Qeynos
		e.other:Faction(262,-10,0); -- Guards of Qeynos
		e.other:AddEXP(500);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

--END of FILE Zone:qeynos2  ID:2063 -- Knargon_Lanenda
