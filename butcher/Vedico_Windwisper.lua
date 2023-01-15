-- items: 20530, 20378
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hello, " .. e.other:GetName() .. ". Have you seen the port master? I am here to complain about the shoddy service.");
	end
	if(e.message:findi("shoddy service")) then
		e.self:Say("I was sailing from Freeport on one of the boats when a giant cyclops attacked the boat! No one lifted a finger as he stole the horn I was playing and ran off. Someone here has to answer for the loss of my horn.");
	end
	if(e.message:findi("giant cyclops")) then
		e.self:Say("He was a huge cyclops! He came rushing up out of the water and stared at me with his big eye and said, 'Me like horn me take and play pretty music!' before he snatched my horn and disappeared back under the waves.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 20530})) then
		e.self:Say("Where did you find this? I thought the cyclops took it. I am in your debt, " .. e.other:GetName() .. ". This horn has always been special to me.");
		e.self:Emote("reaches into her pack and pulls out a note. 'Do you think you could deliver this to my gnome friend Forpar? I have not spoken to him in a while and unfortunatly I will be unable to make the trip to visit him. If you are looking to have an instrument made he is the man to ask.'");
		e.other:SummonItem(20378); -- Item: Note to Forpar Fizfla
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
