--Quest Germand's Problem

function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Hello. Not much time to talk. We have a big [problem] on our hands.");
    elseif e.message:findi("problem") then
		e.self:Say("Before the magical Buoys that produce the protective dome over the city were in place, a large sea creature damaged the bottom of the ship. The problem is we need some wood to repair it. There appears to be no wood on this new continent however. If you could perhaps [find some wood] and bring it to me I could find some sort of reward for you.");
	elseif e.message:findi("find some wood") then
		e.self:Say("Very good. Please travel to the Jaggedpine Forest and find Ervonis Leaflow. He supplied us with a lot of the wood during the construction of the Queen of Thorns. Once you find him give him this note.");
		e.other:SummonItem(55558);	-- Note to Ervonis
	end
end

function event_trade(e)
	local item_lib = require("items");
	if item_lib.check_turn_in(e.trade, {item1 = 55536}) then -- Bundle of Wood
		e.self:Say("You found some wood! This will really help us with fixing the ship. Take this for your trouble. An enchanter friend of mine makes these little trinkets. Their magic doesn't last long, but it might help you out. You have my thanks and the thanks of the entire Wayfarers Brotherhood.");
		e.other:QuestReward(e.self,0,0,0,0,55538,eq.ExpHelper(15)); -- Item: Wood Friend Bauble
	end
	item_lib.return_items(e.self, e.other, e.trade);
end