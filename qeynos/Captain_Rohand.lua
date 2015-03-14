function event_say(e)

	local tax = eq.get_qglobals(e.other);
	
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, friend, and welcome to the Mermaid's Lure. Here, we sell fishing supplies and some imported goods from far-off lands. And, if you've got a few minutes, I could even tell you a [story] or two.");
	elseif(e.message:findi("story")) then
		e.self:Say("Stories? Stories? I saw more adventure before I was ten years tall than you'll see in your whole miserable existence. I've been everywhere, [Odus], [Faydwer], [Kunark]. . . You name it, and I can tell ya a little something 'bout it. . . If you buy me a sip of brandy, of course!");
	elseif(e.message:findi("odus")) then
		e.self:Say("You haven't lived until you've seen Odus. Erud was the first human to cross the sea, and he founded the great city of Erudin. The trade routes from here to Odus are busy and prosperous, but can also be very dangerous.");
	elseif(e.message:findi("faydwer")) then
		e.self:Say("I call Faydwer the home of the little people. They say the continent was named by the high elves when they landed on its shores long ago. I've even heard tales of an ancient elven vampire who lives there. . . Just another Felwithe legend, I'll bet!");
	elseif(e.message:findi("kunark")) then
		e.self:Say("Even I can't tell you much about that continent. Kunark is a tough place, populated by even tougher creatures. I hear the high elves of Faydwer have been trying for years to establish a small port on Kunark's hostile shores.");
	elseif(e.message:findi("tax collection") and tax.tax_collection ~= nil) then
		e.self:Say("Argh! You curvy sea goblin! Taxes, you say?! Peh! I got your taxes right here! I sure don't get the services those taxes are supposed to provide! You can tell them ol' Captain Rohand said so!");
		e.other:SummonItem(13177);
		e.other:Faction(217,-10,0);
	end
	
end

function event_trade(e)

  local item_lib = require("items");
  
  if(item_lib.check_turn_in(e.trade, {item1 = 13034})) then
    e.self:Say("Yeah, this is just what I've been craving!");
	e.other:SendSound();
    e.other:Faction(135,10,0);
    e.other:Faction(9,10,0);
    e.other:Faction(369,10,0);
    e.other:Faction(33,-20,0);
    e.other:Faction(217,10,0);
	e.other:AddEXP(8000);
  end
  
  item_lib.return_items(e.self, e.other, e.trade, e.text)
  
end
