--Artisan Bill Whistletop
--
--DoN Cultural Armor (Incomplete)
-- Edited April 20, 2010 by mrhodes
--To Do:
-- items: 12372, 12373, 13077, 14019, 38447

--Add 4 task assignments and completion text
--Create task: Beholder's Maze (30+)				Working on this - mrhodes
--Create task: The Hole (40+)
--Create task: Karnor's Castle (60+)
--Create task: Stillmoon Temple (70+)
--Give proper level books
--Give Seal of Darkhollow


function event_say(e)
local race = e.other:Race();
local level = e.other:GetLevel();

	if(race == "Halfling") then
		if(e.message:findi("hail")) then
			e.self:Say(string.format("Hi-oh there, %s. You startled me. I'm busy compiling notes for my compendium; it'll be a complete [history] of Rivervale for an entire century. Imagine that!", e.other:GetCleanName()));
		elseif(e.message:findi("history")) then
			e.self:Say("Well, it's not really a history book, not exactly. It's more like I just sit around and	write about whatever's [going on] in Rivervale at the moment. I've been doing this for thirty seven years now, so, um, hey, I'm almost half done!");
		elseif(e.message:findi("going on")) then
			e.self:Say("Yeah, I write down everything: fishing trips, crop yields, new card games I pick up. Hmm, I guess it's more of a journal then a history book. . . Oh well, it's still chalk full of historical [significance].");
		elseif(e.message:findi("significance")) then
			e.self:Say("Heck yes, I write down everything so some of it has got to be important. For example, I	copied down all those [armor patterns] and [cultural symbol patterns] that were displayed during that spring festival eleven years ago. You know the one where we had that competition to see who could make the best suit of armor! Boy, that was a great festival. The apple tarts were amazing.	I'm glad I wrote down the recipe for those too!");
		elseif(e.message:findi("armor patterns")) then
			e.self:Say("Oh, you're interested in the armor, huh? I guess you do look like the adventuring sort. Well, heck, I can make you an armor pattern book if you want? I have all the designs written down and recorded somewhere in one of my journals; all I'll need is the materials for the pattern book itself. Just bring me a cat skull cap for the cover, a fractured femur for the spine, a minotaur horn for the clasp, and a bunch of optic nerves to grind down and make a salve, which will protect and preserve the finished product. I hear these items can be found in the Runnyeye Goblin territory and the Beholder's Maze, but I'm not really sure? Anyway, once I have those, I can make you a pattern book. Hey, then we can go fishing!");
		elseif(e.message:findi("cultural symbol patterns")) then
			e.self:Say("You're interested in the cultural symbol patterns I see. I can give you a book of cultural symbol patterns but I will need you to run a few tasks for me before I can give them to you. What do	you say; would you like to run a few short [tasks] for me?");
		elseif(e.message:findi("tasks")) then
			e.self:Say("I have four tasks that need to be completed. The first is an adventure into [Beholder's	Maze] where you will clear a path for young Halflings so they can make a safe passage through the maze to East Karana. The next you will be tasked with venturing into the heart of [the Hole] where you hunt for some ingredients for my drip clock. The third task leads you into [Karnor's Castle] where you will collect bone specimen for my collection. The final task you will adventure into [Stillmoon temple] and	learn about the creatures that inhabit the area.");
		elseif(e.message:findi("beholder's maze")) then
			if(level >= 30) then
				eq.task_selector({500178});
			else
				e.self:Say("I'm sorry, I don't think you are ready for that task yet. Please come back once you've gotten a bit more experience.");
			end
			-- if(e.message:findi("beholder's maze")		
		elseif(e.message:findi("the hole")) then
			if(level >= 40) then
				eq.task_selector({500179});
			else
				e.self:Say("I'm sorry, I don't think you are ready for that task yet. Please come back once you've gotten a bit more experience.");
			end
			-- if(e.message:findi("the hole")		
		elseif(e.message:findi("Karnor's Castle")) then
			if(level >= 60) then
				eq.task_selector({500180});
			else
				e.self:Say("I'm sorry, I don't think you are ready for that task yet. Please come back once you've gotten a bit more experience.");
			end
			-- if(e.message:findi("Karnor's Castle")		
		elseif(e.message:findi("Stillmoon temple")) then
			if(level >= 70) then
				eq.task_selector({500181});
			else
				e.self:Say("I'm sorry, I don't think you are ready for that task yet. Please come back once you've gotten a bit more experience.");
			end
			-- if(e.message:findi("Stillmoon temple")
		end -- if($race eq "Halfling")
	else
		e.self:Say(string.format("Hello %s!  Another fine day here in Rivervale!", e.other:GetCleanName()));
	end
end
	

function event_trade(e)
local item_lib = require("items");
local race = e.other:Race();

	if(race == "Halfling") then
		if(item_lib.check_turn_in(e.trade, {item1 = 12372, item2 = 12373, item3 = 13077, item4 =  14019})) then --Cat Skull Cap, Fractured Femur, Minotaur Horn, Bunch of Optic Nerves
			e.self:Say(string.format("Oh, hey there, %s. I'm still working on my history book. In fact, I just wrote down the part	where we first met. Here let me read it for you!", e.other:GetCleanName()));
			e.self:Emote("clears his throat.");
			e.self:Say("Ahem, so I was writing my history book when Dryssa comes up to me and says 'Hail.' And so I reply...");
			e.self:Emote("continues to ramble on for many minutes. Finally, he gets to the end of his journal and looks up. He blinks as though	surprised that you are still here.");
			e.self:Say("Oh, yeah, the armor pattern book. Sorry, I forgot about that. Here you go!");
			e.other:SummonItem(38447); --Ancestral Halfling Armor
		else
			item_lib.return_items(e.self, e.other, e.trade);
		end
	else -- if($race eq "Halfling")
		item_lib.return_items(e.self, e.other, e.trade);
	end
end -- sub EVENT_ITEM