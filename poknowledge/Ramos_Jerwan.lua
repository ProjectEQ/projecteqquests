-- poknowledge\Ramos_Jerwan.lua NPCID 202303
-- items: 29173, 29171, 29175

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Good day, traveler. Many curious people about these recent days, all inquiring in their thirst for knowledge and personal advancement. Well, if you lead the humble life of a fisherman, or break from the squalls of battle for some peace and quiet at a river or sea shore, then you have come to the right man. All the supplies any fisherman needs may be purchased at my shop, though if for some reason I do not possess that which you are seeking, perhaps my comrade, Daeld, will.  Or have you come perhaps to help me with my studies?");
	elseif(e.message:findi("studies")) then
		e.self:Say("It's quite simple really. I'm interested in studying some aquatic specimens from around the planes... will you take up your pole and give me a hand?");
	elseif(e.message:findi("hand")) then
		e.self:Say("There are some particularly interesting cichlid swimming about in the Plane of Nightmare. I also hear the discus in the Plane of Valor are quite plentiful. I need you to bring me two sets of bones from each for study. You do know how to extract them, yes? If not, I believe the lovely Peras Glickon may have something that can instruct you. Best of luck lad.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 29173,item2 = 29173,item3 = 29171,item4 = 29171})) then -- Vallorian Discus Bones, Nightmare Cichlid Bones
		e.self:Say("Ah, you've done quite well. Take this, it's a special gift I recovered from a recent adventure, and I can think of no greater person to keep it than you. Remember if you're in need of fishing supplies, come see us any time.");
		e.other:SummonItem(29175); -- Fisherman's Companion
		e.other:Ding();
		e.other:AddEXP(500);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end