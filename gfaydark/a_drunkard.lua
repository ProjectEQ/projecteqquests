function event_say(e)
  if (e.message:findi("hail")) then
    e.self:Say("Can you -hic- . . . spare some copper or -hic- . . . silver? I just . . . -Hic- . . . need some change to buy something to drin . . Er . . Eat . -Hic-");
  elseif (e.message:findi("tandan nybright")) then
    e.self:Say("How did you know my name? You must be from Felwithe. Hic.. Excuse my condition. I am not the man I was. I have had a [" .. eq.say_link("shocking experience") .. "].");
  elseif (e.message:findi("shocking")) then
    e.self:Say("My daughters have become blood thirsty bandits. They went off to visit Antonica and when they returned they became bandits. They now attack every poor traveler who happens upon them. They have disgraced the name of Nybright. Will you [" .. eq.say_link("hunt the Nybright Sisters") .. "] or is this not to your liking?");
  elseif (e.message:findi("hunt")) then
    e.self:Say("I am most thankful. Many adventurers would not help me with this matter. Go and seek out the Nybright sisters. I gave all four of them a Personalized Necklace. Return them all to me when the deed is done. May the Tribunal watch over you.");
  end
end

function event_trade(e)
  local item_lib = require("items");
  
  if (item_lib.check_turn_in(e.trade, {item1 = 13035})) then
    e.self:Say("Thank you kind sir <hic>, I am most grateful for your generosity.");
    e.other:AddEXP(150);
  elseif (item_lib.check_turn_in(e.trade, {item1 = 13347,item2 = 13348,item3 = 13349,item4 = 13350})) then
    e.self:Say("This is a sad day, but it was the just thing to do. The Nybright name will no longer be tarnished. Here you are my friend. This is a bit uncared for, but it is yours. My warrior days are over. Now go. I must be alone.");
    e.other:SummonItem(eq.ChooseRandom(2314, 2007, 2005, 23359)); -- Item(s): Bearskin Gloves (2314), Leather Belt (2007), Leather Shoulderpads (2005), Targ Shield (23359)
    e.other:Faction(5001, 20);  -- Faction: Anti-mage
    e.other:Faction(226, 20);   -- Faction: Clerics of Tunare
    e.other:Faction(279, 20);   -- Faction: King Tearis Thex
    e.other:AddEXP(300);
  end

	-- Return unused items
    item_lib.return_items(e.self, e.other, e.trade)
end

function event_waypoint_arrive(e) 
  if((e.wp == 3) or (e.wp == 9) or (e.wp == 15) or (e.wp == 24) or (e.wp == 26) or (e.wp == 33)) then
    e.self:Say("Please.. Can anyone spare some coppers? <Hic>.. Anyone?");
  end
end

-- END of FILE Zone:gfaydark  ID:54059 -- a_drunkard
