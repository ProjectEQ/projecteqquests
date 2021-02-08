-- items: 2694
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("coughs and struggles to move. 'There were... too many... too strong.'");
	elseif(e.message:findi("too late")) then
		e.self:Emote("gasps clutching a wound and says, 'Their magic was too powerful. Necromancers. Undead. Cursed knights of an unholy god. They left when they thought I was dead. But even now their curses sap the last of my life. I made it as far as I could. If Helminth lives, tell him [I am dead]. Please complete the mission. Bring this Azibelle to justice. Avenge me.'");
		eq.depop_with_timer();
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 2694}, 0)) then
		e.self:Say("Vegalys sent you. I'm done for. Guard Helminth found a false wall. We stepped through it. We were ambushed. I didn't see where Helminth went. He disappeared. I knew we were overwhelmed. I ran and feigned death but I knew [it was too late].");
		eq.unique_spawn(45131,0,0,-49,378,-39,128); --Guard_Helminth (45131)
		e.other:QuestReward(e.self,0,0,0,0,2694);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
