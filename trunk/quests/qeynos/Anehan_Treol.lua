function event_say(e)
  if(e.message:findi("hail")) then
    e.self:Say(string.format("Ah.. Hello there..  %s, was it?  Yes, right, %s.  Anyhow, my name's Anehan Treol, member of the League of Antonican Bards.  Feel free to visit our humble guild house here in South Qeynos.  It's called the Wind Spirit's Song and we often put on free shows there.  I think you'd enjoy it.  Anyway, nice chatting with you, and I hope to see you again soon.",e.other:GetName(),e.other:GetName()));
  end
end

function event_trade(e)
  local item_lib =require("item_turnin");
  if(item_lib.check_turn_in(e.trade, {item1 = 18021})) then
    e.self:QuestSay(e.other, "Oh, report time already again? Yeah, here ya go, $name. Be careful around here at night, I've been seeing some rough looking characters lurking about.");
    e.other:SendSound();
	e.other:SummonItem(18022);
    e.other:Faction(192,2,0);
    e.other:Faction(184,2,0);
    e.other:Faction(135,2,0);
    e.other:Faction(273,-2,0);
    e.other:Faction(207,-2,0);
    e.other:AddEXP(200);
  end
  if(item_lib.return_items(e.self, e.other, e.trade)) then
   	e.self:Say(string.format("I have no need for this %s, you can have it back.",e.other:GetName()));
  end
end
