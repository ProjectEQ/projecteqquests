--[[#Zone: Plane of Mischief
#Short Name: mischiefplane
#Zone ID: 126
#
#NPC Name: Vinny V. D'vicci

Additional dialog for fishing and skunk foot turn in noted at: http://everquest.allakhazam.com/db/npc.html?id=6756]]

function event_spawn(e)
	eq.set_timer("fishing",5 * 60 * 1000) -- 5 min timer on repeating text  
end

function event_say(e)
	if e.message:findi("pot of gold") then
		e.self:Say("Pot o` gold? Bwahahahaha! Only pot around is them ones I warsh my clothes in. Gotta be careful though, one time I dropped one of dem woids of wealth in and BADABING no clothes jus a stinkin coin that wouldn't buy me a fishin grub.");
	elseif e.message:findi("man") then  -- BASED ON TLP PROGRESSION SERVERS
		e.self:Say("Foist ya gotta help my brudda Bob. Getcherself one of em books 'es talkin about. Den... Ya's gotta find me dem woids of wealth. Well? Watcha standin here gawkin at me for? Get movin!");
	end
end

function event_timer(e)
	if e.timer == "fishing" then	  -- BASED ON TLP PROGRESSION SERVERS
		e.self:Say("I'm fishing fishing fishing. I fish the whole week through. Just fishing fishing fishing. It's what I always do");
	end
end

function event_trade(e)   -- BASED ON TLP PROGRESSION SERVERS
    local item_lib = require("items");

    if item_lib.check_turn_in(e.trade, {item1 = 6876}) then -- Item: lucky skunk's foot
        e.self:QuestSay(e.other,"Nice work kid. Now I'm feelin lucky. So's ya say ya wanna learn about cards right? Lemme tell ya. Them cards are nice but lets have some REAL fun. Yer resourceful, I like that. What say we take over this joint fer ourselves? Ol' Bristle's gettin soft, ya know? Wadda ya say? [" .. eq.say_link("Man") .. "] or mouse?");
		e.other:AddEXP(500);
	end

    item_lib.return_items(e.self, e.other, e.trade)
end
