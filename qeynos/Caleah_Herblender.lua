-- items: 13071, 13069, 10307
function event_say(e)
  local fac = e.other:GetFaction(e.self);
  if(e.message:findi("hail")) then
    e.self:Say("Greetings, and welcome to my humble little shop. I sell and trade various goods for my fellow wizards of the Order of Three. My assistants, Hanlore and Drawna, specialize in magicians' and enchanters' goods and would be glad to help you, too.");
  elseif(e.message:findi("bat fur") or e.message:findi("rat whiskers") or e.message:findi("beetle eye")) then
    if(fac < 5) then
      e.self:Say(string.format("I need someone to gather up the three ingredients for a new spell I'm working on. I need some [rat whiskers], a [fire beetle eye], and a patch of [bat fur]. Thanks for helping me, young %s.",e.other:GetName()));
    else
	  e.self:Say("The Order of Three has been monitoring your recent activities, and we are appalled by you and your actions! Now, begone!");
    end
  end
end

function event_trade(e)
  local item_lib = require("items");
  if(item_lib.check_turn_in(e.trade, {item1 = 13071, item2 = 13069, item3 = 10307})) then
    e.self:Say(string.format("Hmm. Good job, %s, let's give this a try. Flame and fire. Heat and spark. Touch of Ro, light this dark! Ahh. It stills needs a little work, I guess. Thanks for your help, here's a little something for your effort.",e.other:GetName()));
	e.other:SendSound();
    e.other:Faction(342,5,0); -- Faction: Order of Three
    e.other:Faction(262,5,0); -- Faction: Guards of Qeynos
    e.other:Faction(221,-10,0); -- Faction: Bloodsabers
    e.other:Faction(296,-10,0); -- Faction: Opal Darkbriar
    e.other:AddEXP(300);
	e.other:GiveCash(8, 0, 0, 0);
  end
  item_lib.return_items(e.self, e.other, e.trade)
end

function event_spawn(e)
  eq.set_timer("repeat",350000);
 end

function event_timer(e)
  e.self:Say("Drawna.. Are we all out of bat fur again?");
  eq.signal(1051,1); -- NPC: Drawna_Opimsor Alchemy Supplies
end

function event_signal(e)
  e.self:Say("Hmmm.. Let's see if we can find someone to help relenish our stock of [rat whiskers] and [bat fur]. I need these items for a new little experiment I'm working on.");
end

