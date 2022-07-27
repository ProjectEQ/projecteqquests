-- Help Kayin Escape

function event_trade(e)
	local item_lib = require("items");
		if (item_lib.check_turn_in(e.trade, {item1 = 64015})) then -- Head of Ra'Tuk Hrux Vexkit V2
			e.self:Say("Kayin has escaped? That's wonderful news! I feared he had already been killed in the games. Please, take this ring as a token of my thanks. It was given to me by my father and Proteri Amari tells me there is some magic within the stone.");
			e.other:QuestReward(e.self,0,0,0,0,64016,25000); --Item:Crude Stone Ring
      e.other:Faction(1761, 5); -- Faction: Nihil
		end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("glances around to make sure no one else is listening in. You look like someone with the strength to help a good [friend] of mine.");
  elseif(e.message:findi("friend")) then
    e.self:Say("Kayin Wanjala has been a friend of mine for as long as I can remember and has been a bit hot-headed even longer. A few days ago, one of the guards lashed him for working too slow and Kayin hit the guard! I figured Kayin was done for, but the guard just laughed, hefted Kayin up over his shoulder, and dragged him off. I got word this morning that Kayin is still alive, but not for much longer. I know where he is [being kept].");
  elseif(e.message:findi("being kept")) then
    e.self:Say("The guards took him to coliseum where he is being held as fodder for the games. Please, help my friend! I know he got himself into this bind, but he's really a good person and doesn't deserve to be fed to the hynids.");
	end
end
