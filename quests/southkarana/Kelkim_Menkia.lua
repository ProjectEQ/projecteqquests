-- BEGIN FILE: southkarana\Kelkim_Menika.lua

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("sighs as she looks over her lute. 'My lute was mangled by those damnable gnolls. I have no idea how I'm going to get a new set of strings for it. They were so rare.'");
	elseif(e.message:findi("rare")) then
		e.self:Say("I only use the finest lute strings on my lute. My uncle got them for me from across the world. His name was Zendrik the Wurmslayer. As his name implies, he killed many wurms and drakes. The strings for my lute were all made from the guts of the wurms and drakes he slew.");
	elseif(e.message:findi("wurms and drakes")) then
		e.self:Say("The strings were from a chromodrac, a red wurm and a huge onyx drake. It always sounded so wonderful.' Kelkim sighs, looking off to the horizon. As she shakes her lute angrily, she says, 'I'll kill all of you dirty gnolls!");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 20527,item2 = 20528,item3 = 20529})) then -- Chromodrac Gut, Red Wurm Gut, Onyx Drake Gut
		e.self:Emote(string.format("snatches the gut strings from your hand and immediately begins to string her lute. 'This is wonderful, I will be able to play my lute again soon! Take this old sheet of music I found - I don't think I will have much use for it. My new desire is to bash gnoll heads in with my lute. Safe travels to you, %s.",e.other:GetName()));
		e.other:SummonItem(20377); -- Maestro's Symphony Page 25
		e.other:Ding();
		e.other:AddEXP(5000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:southkarana  ID:14082 -- Kelkim_Menika