--[[

Tutorial revamp rewrite by Drogerin

##Color Reference Chart##
<c \"#F07F00\"> Dark Orange
<c \"#00c8f0\"> Light Blue
<c \"#1b6e14\"> Dark Green

Frizznik Hailstorm  NPCID -- 189017


Things to DO:
Add as an (Opt) Optional task under Basic Training.


--]]



function event_say(e)	
	if (e.message:findi("hail")) then
		e.self:QuestSay(e.other, "Well hello there. The name's Frizznik and I'm in charge of finding food for the revolt. I've found more than enough rat meat to make steaks, so if you want to cook yourself some food, be my guest. Would you like to learn to cook [" .. eq.say_link("rat steaks") .. "]?");
		eq.popup("Tradeskills", "<br> The world of Norrath has many different types of tradeskills that allow players to create useful items and equipment Tradeskills are a fun pasttime and can also help your character to earn money by selling the items to other players. In this tutorial, Frizznik will teach you how to use the baking tradeskill.<br><br><c \"#F07F00\"> Ask Frizznik about 'rat steaks' to continue.</c>", 5,0,0);
	elseif (e.message:findi("rat steaks")) then
		e.self:QuestSay(e.other, "It's not the greatest dish, but it'll have to do for now. Here's a nice rat sirloin for you and a jug of sauces.");
		e.other:SummonItem(59946) -- Gloomingdeep Rat Meat
		e.other:SummonItem(59947) -- Kobold Cooking Sauce
		eq.popup("Tradeskills", "<br> To cook the rat steaks that Frizznik has requested, use the oven next to him. Place the rat meat and the kobold cooking sauce into your inventory and then <c \"#00c8f0\"> left click </c> the oven to open the <c \"#1b6e14\"> Tradeskill Window</c>. Then <c \"#00c8f0\"> left click </c> the 'Search Recipes' button near the top of the window to display a list of recipes in the box below. Scroll down until you see 'Rat Steaks' on the list and <c \"#00c8f0\"> left click </c> on it. Then click the <c \"#00c8f0\"> Combine </c>button to cook the rat steak. <br><br><c \"#F07F00\"> Click 'OK' to learn of a different way to cook a rat steak",1,0,0);
	end
end


function event_trade(e)
	item_lib.return_items(e.self, e.other, e.trade);
end
