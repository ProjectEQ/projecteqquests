--Epic Pre-quest (Paladin) ##Drogerin 208059
-- items: 69901, 69912, 69913


function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(e.message:findi("hail")) then
		e.self:QuestSay(e.other, "Sorry, I am a bit tired. Been working all night.");
	end
	if e.other:Class() == "Paladin" then
		if(e.message:findi("hail")) then
			e.self:QuestSay(e.other, "Hello, " .. e.other:GetName() .. ", I do believe we've spoken before and I told you I was very [" .. eq.say_link("tired") .. "]. ")
		elseif(e.message:findi("tired")) then
			e.self:QuestSay(e.other, "Yes, I've been very tired lately. I've been busy creating weaponry for the [" .. eq.say_link("Soldiers of Marr") .. "] and many [" .. eq.say_link("other followers") .. "] of Marr.");
		elseif(e.message:findi("Soldiers of Marr")) then	
			e.self:QuestSay(e.other, "The various soldiers of the Plane, as well as the soldiers of the Halls of Honor, come to me for weaponry. Previous to my ascension here, I was gifted by our Lord Mithaniel with the power to craft exceptional swords. These swords that I create are imbued with courage.");
		elseif(e.message:findi("other followers")) then
			e.self:QuestSay(e.other, "Recently, I was tasked by Sir Rathalzor to assist the Guktans with their invasion of Grobb. I made many [" .. eq.say_link("exceptional swords") .. "] for that battle.");
		elseif(e.message:findi("exceptional swords")) then
			e.self:QuestSay(e.other, "One such sword I created was made for one of the most powerful knights I have ever met. His strength and courage were only surpassed by his swordsmanship. He [" .. eq.say_link("led") .. "] many battles against the trolls of Grobb.");
		elseif(e.message:findi("led")) then
			e.self:QuestSay(e.other, "Indeed, with the holy blade I created, this knight, Gilfal, helped lead the Guktans to victory. However, the victories did not come without [" .. eq.say_link("casualties") .. "].");
		elseif(e.message:findi("casualties")) then
			e.self:QuestSay(e.other, "Yes, many Guktans perished during this battle. [" .. eq.say_link("Couragebringer") .. "], the sword I created that was blessed by Sir Rathalzor himself, was shattered by a powerful troll shaman named Broog. The Battle did not come without casualties indeed.");
		elseif(e.message:findi("Couragebringer")) then
			e.self:QuestSay(e.other, "Perhaps you can assist Gilfal with recovering his sword. Take this solvent, which was blessed by the priests in the Halls of Honor, as it will bond with the sword and allow you to rebuild the great blade. Find Gilfal and give him the solvent and tell him you are [" .. eq.say_link("willing to help him rebuild Couragebringer") .. "]. Go now and find this knight.");
			e.other:SummonItem(69901); -- Baltron's Solvent	
			if qglobals["pre_pal"] == nil then
				eq.set_global("pre_pal","1",5,"F"); -- 
			end
		end
	end
end

function event_timer(e)
	if e.timer == "spawn" then
		eq.stop_timer("spawn");
		eq.spawn2(220017,0,0,189.58,624.05,193.88,388.2);
	end
end
	
function event_trade(e)
	local qglobals = eq.get_qglobals(e.other);
	local item_lib = require("items");
	
	if qglobals["pre_pal"] == "4" and item_lib.check_turn_in(e.trade, {item1 = 69912}) then -- blade from Gifal
		e.self:Say("Ah, I see you have returned to me with the blade Helmetthane. It is indeed fractured...perhaps Sir Rathalzor can guide us.");
		e.self:Emote("begins to chant in a foreign, yet beautiful language.");
		eq.set_timer("spawn",2000);
		eq.set_global("pre_pal","5",5,"F");
		e.other:SummonItem(69913);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end
