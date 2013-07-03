function event_say(e)
  if(e.message:findi("hail")) then
    e.self:Emote("raises one eyebrow and looks at you with suspicion before returning his watchful eye to the many people going about their business in the city.");
  elseif(e.message:findi("first suspect")) then
    e.self:Say("The first suspect was last seen near the shop called Fireprides.");
  elseif(e.message:findi("follow me")) then
    e.self:Say("Right, let's get going.");
    eq.follow(e.other:GetID());
  elseif(e.message:findi("confession")) then
    e.self:Say("Here you are.");
	e.other:SummonItem(2344);
  elseif(e.message:findi("second suspect")) then
    e.self:Say("The second suspect was sighted below the Grounds of Fate.");
    eq.spawn2(1201,0,0,-414,-3,-25,0);
  elseif(e.message:findi("third suspect")) then
    e.self:Say("The last suspect has been known to hang around that low life known as Raz the Rat.");
    eq.spawn2(1197,0,0,46,-311,-16,0);
  end
end

function event_trade(e)
  local item_lib = require("item_turnin");
  if(item_lib.check_turn_in(e.trade, {item1 = 18289})) then
    e.self:Say("Very well, let's get to work. I assume you have read the briefing and committed it to memory. This is how you will be tested. I shall play the part of student and you shall play the master who directs me. I promise I won't make it easy on you either, we want only the best. We'll see how you do and then I'll decide if you are worthy to wear the badge or not.");
    eq.follow(e.other:GetID());
  elseif(item_lib.check_turn_in(e.trade,{item1 = 2369,item2 = 2394,item3 = 2279})) then
    eq.stop_follow();
    e.self:Say("You have done our city a great service and helped to bring several criminals to justice this day! Wear this Investigator's Badge with pride! Speak again with Vegalys Keldrane, he may have information about [advancing further] in rank.");
	e.other:SendSound();
    e.other:SummonItem(2386);
    e.other:Faction(135,10,0);
    e.other:Faction(9,10,0);
    e.other:Faction(273,-10,0);
    e.other:Faction(164,-10,0);
    e.other:Faction(217,10,0);
  end
  item_lib.return_items(e.self, e.other, e.trade)
end
