function event_trade(e)
	local item_lib = require("items");
		if (item_lib.check_turn_in(e.trade, {item1 = 64007})) then --poisoned fruit
			e.self:Say("Proteri sent word that you would be coming. I have bad news. It seems Ixvet has gotten wind of a plot on his life and has grown paranoid. He has started changing his personal servants on a regular basis and I was replaced by Chiaka Lerato yesterday. I'm afraid that I'm not going to be able to help you anymore. Please, keep the fruit for now.");
			e.other:SummonItem(64010); --poisoned fruit
    elseif (item_lib.check_turn_in(e.trade, {item1 = 64009,item2 = 64010})) then --serving tray / poisoned fruit
      e.self:Say("Just in time! Ixvet is due for his next meal in a few minutes. With Chiaka out of the way, I'll be able to serve him. I hope this poison isn't noticeable. Here, I've managed to secret this away from the guards up until now and I hate to think about those beasts getting their hands on it. Please hold onto it for me. If this goes well, I won't need it anymore.");
          e.other:QuestReward(e.self,0,0,0,0,64018,50000); --Item: Abena's Collar of Liberation
          eq.start(57);
          e.other:Faction(1761, 50); -- Faction: Nihil
		end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_waypoint_arrive(e)
  if (e.wp == 9) then
    e.self:Say("Ikaav Ixvet Pox, I humbly present you with your meal.");
    eq.signal(283050,1,6000); --signal iip
  end
 end
      
function event_signal(e)
	if(e.signal == 1) then
        	e.self:SetAppearance(3);
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("stares at her feet and mutters, 'Please leave Britney Spears alone.");
	end
end
