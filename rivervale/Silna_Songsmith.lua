--#############
--#Quest Name: Bard Mail Quest
--#Author: RealityIncarnate
--#Converted to Lua: robregen
--#NPCs Involved: Tralyn Marsinger, Eve Marsinger, Lislia Goldtune, Felisity Starbright, Jakum Webdancer, Ton Twostring, Idia, Sivina Lutewhisper, Ticar Lorestring, Marton Stringsinger, Drizda Tunesinger, Travis Two Tone, Silna Songsmith, Siltria Marwind, Tacar Tissleplay, Kilam Oresinger, Lyra Lyrestringer 
--#Items Involved: Bardic letters: 18150-18167
--#################

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, " .. e.other:GetName() .. " - Are you [" .. eq.say_link("interested",false,"interested") .. "] in helping the League of Antonican Bards by delivering some [" .. eq.say_link("mail",false,"mail") .. "]?");
	elseif(e.message:findi("mail")) then
		e.self:Say("The League of Antonican Bards has a courier system made up of travelers and adventurers. We pay good gold to anyone who will take messages from bards such as myself to one of our more central offices. Are you [" .. eq.say_link("interested",false,"interested") .. "]?");
	elseif(e.message:findi("interested")) then
		e.self:Say("I have messages that need to go to - well, right now I have one that needs to go to Freeport. Will you [" .. eq.say_link("deliver",false,"deliver") .. "] mail to [" .. eq.say_link("Freeport",false,"Freeport") .. "] for me?");
	elseif(e.message:findi("deliver") or e.message:findi("freeport")) then
		e.self:Say("Take this pouch of mail to Ton Twostring. You can find him at the bard guild hall. I'm sure he will compensate you for your trouble.");
		e.other:SummonItem(18164); -- Pouch of Mail (Freeport)
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:rivervale NPC:Silna_Songsmith