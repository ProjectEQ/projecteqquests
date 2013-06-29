function event_trade(e)
  local item_lib = require("item_turnin");
  if(item_lib.check_turn_in(e.trade, {item1 = 2344})) then
    e.self:Emote("crumples the document into a ball, throws it to the ground and spits in your face, yelling, 'You are a fool if you really believe I would sign such a thing. Prepare to die!'");
    eq.attack(e.other:GetName());
  end
  if(item_lib.return_items(e.self, e.other, e.trade)) then
   	e.self:Say(string.format("I have no need for this %s, you can have it back.",e.other:GetName()));
  end
end
