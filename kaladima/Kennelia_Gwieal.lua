function event_say(e)
	local level = e.other:GetLevel();
	local global = eq.get_qglobals(e.other);
	
	if(level >= 15) then
		if(e.message:findi("hail")) then
			e.self:Say("Come to find out about the Wayfarers Brotherhood, hm? I think I saw you around here long ago. Because you are familiar to me, I will trust you with some [".. eq.say_link("information",false,"information") .. "].");
		elseif(e.message:findi("information")) then
			e.self:Say("The Wayfarers Brotherhood is pretty particular about who they do business with. You will need to prove yourself to them. You can start gaining their gratitude by helping them. The Wayfarers Brotherhood will ask you to answer some questions when you first meet with them. They tend to call all of their assignments 'adventures.' You'd do well to keep that in mind as they'll be more likely to give you some tasks. There is other information that makes them easier to [" .. eq.say_link("deal with",false,"deal with") .. "] too.");
		elseif(e.message:findi("deal with")) then
			e.self:Say("There are several camps of Wayfarers Brotherhood explorers around the world. In each camp you'll find a trusted Wayfarers Brotherhood member that has the task of recruiting adventurers that will take on interesting, and potentially lethal, [" .. eq.say_link("work",false,"work") .. "]. Some members will tell you stories, if they think you are worthy of learning such prized information. Others will share their treasures with you, but only if you do work for them.");
		elseif(e.message:findi("work")) then
			e.self:Say("The Wayfarers Brotherhood believes in giving something for something. For each adventure you take from them, they will add you to their Favor Journal. With the points of Favor that their record keepers have counted for you, you can trade your good Favor for wonderful treasures and goods. Also, the more adventures you do for the Wayfarers Brotherhood, the more your Favor increases. The harder jobs get you more Favor, by the way. As you gain more Favor, the Wayfarers Brotherhood treasure keepers will let you peek at some of their more unique and sought after items. So, it pays to get in good with them, you see! And there's [" .. eq.say_link("more",false,"more") .. "]!");
		elseif(e.message:findi("more")) then
			e.self:Say("You should also know that there are five magi in the Wayfarers Brotherhood that have found very unique magic stones in the world that they are able to use to transport adventurers to one another. They have placed a magus with one of these stones at each large camp. They call it Farstone Magic. And that's not the only [" .. eq.say_link("interesting ore",false,"interesting ore") .. "] we've seen lately.");
		elseif(e.message:findi("interesting ore")) then
			e.self:Say("We've found some strange items off the dead in the dungeons. At first we just thought they were simple things -- rocks, pebbles, gems, and the like -- and then we noticed they had very unusual auras about them. Well, one day, Morden Rasp was toying with one -- a shiny green shard -- and he went to scrape it with his dagger. Suddenly, the shard began to reform and fused with his dagger. While the dagger remained as fine as ever, Morden himself felt a surge of strength! So, you will want to watch out for these strange magic pieces in the world. Now, I suggest you go talk to Selephra Giztral, Barstre Songweaver, Vual Stoutest, Teria Grinntli, or Ruanya Windleaf. They handle all of those who are interested in working for the Wayfarers Brotherhood and getting rewards. Remember well what I've told you!");
			if(global.Wayfarer == nil) then
				e.other:Message(15,"You have completed a step toward becoming a great adventurer. Well done!");
				eq.set_global("Wayfarer","1",5,"F");
			end
		end
	else
		e.self:Say("You show a great deal of courage in coming here to speak with me at such a young age. I'm afraid you are not yet ready to pursue work with the Wayfarers Brotherhood.Come back when you have more experience and we will talk again.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
