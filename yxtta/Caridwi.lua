--  Best the Taskmistress,  Cragbeast Queen: Visage of the Brute
function event_spawn(e)
eq.zone_emote(15, "A haunting song echoes in the dank caverns.");
end

function event_say(e)
if(e.message:findi("hail")) then
e.self:Emote("is whistling an unusual tune. As she speaks, her song continues. The overlapping effect of the music and her melodious voice is haunting.");
e.self:Say("Greetings ".. e.other:Race() ..", it is not often that someone visits me here. In fact, I can't remember the last time I saw another person. Ever since that day in the Coliseum my life has been so strange. Time has all but lost its meaning, and I see the most unusual things. Have you come to hear my [" .. eq.say_link("story",false,"story") .. "], or would you like me to explain what the world looks like [" .. eq.say_link("through your eyes",false,"through your eyes") .. "]?");
elseif(e.message:findi("story")) then
e.self:Emote("smiles and nods emphatically.");
e.self:Say("It would be my pleasure to relate my story to you,".. e.other:GetCleanName() ..". My passion is beautiful music and my songs bring hope to people when they need it most. I shared this gift with my fellow nihil in Riwwi and anyone else who would listen, as I share it now with you. One day the Taskmistress arrived to check on her underlings in the Coliseum. She heard my voice and slowly trotted up to me. She seemed genuinely interested in the effect my music had on the other Nihil. I remember smiling politely and singing her one of my favorite ballads, but suddenly everything went black. As far as I can tell I've been in this place ever since. What happened that day, I wonder? What became of the Taskmistress? My thoughts always return to her for some reason, as if our fates are entwined.");
elseif(e.message:findi("through your eyes")) then
e.self:Say("It is difficult to describe. Things that used to be clear to me are now non-distinct, and . . . I see visions . . . that are inexplicably real but defy all common logic. For instance, I see you carry a trophy from an epic battle; a misshapen lump of flesh that you aquired from a tremendous foe. You do not understand. Please allow me to borrow it for a moment so I can show you.");
end
end

function event_trade(e)
	local item_lib = require("items");
		if (item_lib.check_turn_in(e.trade, {item1 = 52113})) then -- Misshapen Cragbeast Flesh
			e.self:Emote("places her hand over your eyes and forces you to examine the Cragbeast Queen's Flesh through her transparent fingers. The skin takes the shape of a hideous mask. Do you see now, ".. e.other:GetCleanName() .."? Do you understand?");
			 e.other:QuestReward(e.self,0,0,0,0,52120,50000); --Visage of the Brute
		elseif (item_lib.check_turn_in(e.trade, {item1 = 52119})) then -- taskmistress krisz's head
			e.self:TempName("Caridwi_the_Avenged");
			e.self:Emote("gasps. Her ghostly skin grows even more pale as she comes to grips with her fate. Oh my. She . . . killed me, didn't she? Krisz slew me in front of everyone I knew and loved. Her fate is entwined with mine no longer. I will sing one last song and then leave this world. Thank you for avenging me, ".. e.other:GetCleanName() ..". The leather choker around Krisz's neck may prove of some use to you.");
			e.other:QuestReward(e.self,0,0,0,0,52137,50000); --Choker of Centaur Slaying
    end
  item_lib.return_items(e.self, e.other, e.trade)
end
