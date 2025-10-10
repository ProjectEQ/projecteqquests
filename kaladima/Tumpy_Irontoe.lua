function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to Irontoe's! The finest watering hole this side of Oggok! If you're looking for anything special and it ain't behind the bar, just ask. Maybe I can make it.");
	elseif(e.message:findi("tumpy tonic")) then
		e.self:Say("So you want a Tumpy Tonic? I can make you one. All I need is a flask of water and a kiola nut. The kiola nut can be bought in the Ocean of Tears island chain.");
	elseif(e.message:findi("trumpy")) then
		e.self:Say("Trumpy...  I have not seen him in ages!  We were both members of the Irontoe Brigade.  Last I heard, he was drinking his life away in the great city of Qeynos.");
	elseif(e.message:findi("drumpy") or e.message:findi("crumpy")) then
		e.self:Say("Sounds like you ran into one of my old pals from the Irontoe Brigade. I hope he is doing okay. Ah, those were the days...");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "Okay. Where are the other ingredients?";
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13340, item2 = 13006},1,text)) then --Kiola Nut, Water Flask
		e.self:Say("Here you go. One Tumpy Tonic. Don't drink that too fast now.");
		e.other:QuestReward(e.self,0,0,0,0,12114,1000); --Tumpy Tonic
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
