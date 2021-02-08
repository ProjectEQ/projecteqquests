-- items: 18021, 18022
function event_say(e)
  if(e.message:findi("hail")) then
    e.self:Say(string.format("Ah.. Hello there..  %s, was it?  Yes, right, %s.  Anyhow, my name's Anehan Treol, member of the League of Antonican Bards.  Feel free to visit our humble guild house here in South Qeynos.  It's called the Wind Spirit's Song and we often put on free shows there.  I think you'd enjoy it.  Anyway, nice chatting with you, and I hope to see you again soon.",e.other:GetName(),e.other:GetName()));
  end
end

function event_trade(e)
  local item_lib =require("items");
  if(item_lib.check_turn_in(e.trade, {item1 = 18021})) then
    e.self:QuestSay(e.other, "Oh, report time already again? Yeah, here ya go, "..e.other:GetName()..". Be careful around here at night, I've been seeing some rough looking characters lurking about.");
    e.other:SendSound();
    e.other:SummonItem(18022); -- Item: Anehan's Report
    e.other:Faction(284,2,0); -- Faction: League of Antonican Bards
    e.other:Faction(281,2,0); -- Faction: Knights of Truth
    e.other:Faction(262,2,0); -- Faction: Guards of Qeynos
    e.other:Faction(304,-2,0); -- Faction: Ring of Scale
    e.other:Faction(285,-2,0); -- Faction: Mayong Mistmoore
    e.other:AddEXP(200);
  end
  item_lib.return_items(e.self, e.other, e.trade)
end
