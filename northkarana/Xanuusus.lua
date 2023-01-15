-- earthcaller - ranger epic
-- naturewalker's scimitar - druid epic
-- items: 62603, 20483, 20484, 20488, 20699, 20697, 20698, 20440, 20490, 13411, 13977, 84004, 13083, 62632, 62604

function event_say(e)
  local qglobals = eq.get_qglobals(e.other);
	if(e.message:findi("hail")) then
    if ( e.other:HasItem(62604) ) then
      e.self:Say("I see you have purified that stone. Can I look at it?");
    elseif ( qglobals["ranger_epic15_pre"] == "7" and e.other:HasItem(62603) == false ) then
      e.other:SummonItem(62603); -- Item: Polished Blasted Stone
    elseif ( qglobals["ranger_epic15_pre"] == "6" ) then 
      e.self:Say("You make my limbs ache. There is something unnatural about you. What is it?");
    else
      e.self:Say("Greetings, small one! I am Xanuusus of the Stormreapers. You are welcome to rest beneath my mighty branches.");
    end
  elseif ( qglobals["ranger_epic15_pre"] == "7" and e.message:findi("help") ) then
    e.self:Say("Well, I suppose I can help you a little, small one. There are three principles expressed in my lovely poem.");

    e.self:Say("First one must defeat a worthy enemy of the Storm Lord, as you obviously understood from the second stanza. Seek a weapon born by one that would shackle the world if he could. He takes his name from his home, as if to claim it as his own.");

    e.self:Say("Secondly one must aid a friend of the Storm Lord. There is one that considers himself small and worthless. Heal his heart so that his bare feet may roam again.");

    e.self:Say("Finally one must perform and act of faith in the Storm Lord. When you have accomplished the other tasks, return to me and we shall again speak of this act of faith.");

  elseif ( qglobals["ranger_epic15_pre"] == "8" and e.message:findi("ready") ) then
    eq.debug("name: " .. e.other:GetName());
    -- 62631 Taskmaster's Cutlass in your offhand 
    -- 62633 Tear-stained Poem of the Storms in your primary 
    -- 62603 Polished Blasted Stone on your face 
    if ( e.other:HasItem(62631) and e.other:HasItem(62633) and e.other:HasItem(62603) ) then
      eq.debug(e.other:GetName() .. " has the required items.");
      local client = e.other;
      if ( client:GetItemIDAt(Slot.Face) == 62603 and client:GetItemIDAt(Slot.Primary) == 62633 and client:GetItemIDAt(Slot.Secondary) == 62631 ) then
        eq.debug(e.other:GetName() .. " has the required items equiped.");
        e.self:Say("Stay close or this won't work. It is better that you do this, for trees are not very well structured to withstand lightning.");
        e.self:Emote("The treant releases a sound from his hollows that sounds much like thunder.");

        -- At this point he'll walk a short ways, and he'll cast a spell on you called Bolt of Faith. It's an unresistable stun, 50% snare, and gives -50 to dexterity. It lasts one minute. Once it lands you'll see text. 

        e.self:CastSpell(5687, e.other:GetID()); -- Spell: Bolt of Faith
        client:Message(14, "As the lightning courses through your body, you feel the stone dissolving. That material flows from your mouth in an unnatural fashion and you see it fade as it rushes away from you across the planes toward something moving in the distance.");

        client:DeleteItemInInventory(Slot.Secondary, 1, true);
        client:DeleteItemInInventory(Slot.Face, 1, true);

        -- During all this, A Tainted Beast spawns who /cons blue at level 75. He hits for around 200, and dies quickly. However, you MUST aggro him within a minute or he despawns and you lose the Taskmaster's Cutlass and the Polished Blasted Stone. If you fail, you can hail Xanuusus for another stone, but the Taskmaster's Cutlass must be acquired again. A Tainted Beast is a griffon who beelines for Xanuusus from the southeast. Once it's dead, loot the Stone of Winde. Now go talk to Xanusuus again. 
        eq.set_timer("spawn_beast", 45 * 1000);

      end 
    end
	end
end

function event_timer(e)
  eq.debug("timer: " .. e.timer);
  if ( e.timer == "spawn_beast" ) then
    eq.unique_spawn( 13131, 0, 0, 345.57, 1290, 22.87, 104); -- NPC: A_Tainted_Beast
    eq.stop_timer(e.timer);
  end
end

function event_trade(e)
	local item_lib = require("items");
  local qglobals = eq.get_qglobals(e.other);

  if ( e.other:Class() == "Ranger" and qglobals["ranger_epic15_pre"] ~= nil) then
    eq.debug(e.other:GetName() .. " ranger_peic15_pre: " .. qglobals["ranger_epic15_pre"]);
  end

	if(item_lib.check_turn_in(e.trade, {item1 = 20483,item2 = 20484})) then
		e.self:Emote("waves his hands over the gem of corruption and a wave of warm energy passes through the area. With care for such a huge creature, he melds the gem into the sword and seems to glow all over as he channels energy into the weapon. 'Thus is the link of hate broken between Innoruuk and the spirit of earth. Through your will has balance returned. Your deeds, your work for the good of all, will be remembered by anyone who walks beneath the canopy of a forest or roams the plains. Continue your vigil over nature's balance.'");
		e.other:SummonItem(20488); -- earthcaller
		e.other:Ding();
		e.other:AddEXP(2500000);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 20699,item2 = 20697,item3 = 20698,item4 = 20440})) then
		e.self:Emote("pushes the spirits into the air, making them dance around the scimitar. With a wave of his hand they melt into the blade and hilt of the weapon. 'With this the spirits of the lands are now free from the corruption of the dark gods.  Through your strength and dedication was this possible, "..e.other:GetName()..".  May the foul poison that once poured into the earth itself never do so again. Take this weapon that you may continue to watch over the balance of nature. Go now, with the gods' blessings.'");
		e.other:SummonItem(20490); -- naturewalker's scimitar
		e.other:Ding();
		e.other:AddEXP(2500000);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13411})) then
		e.self:Say("Heh heh! Excellent, small one!  My roots have been longing for some fresh jumjum juice!  Thank you!  Take this for your trouble.  Be sure to thank the Tagglefoots for me.");
		e.other:SummonItem(eq.ChooseRandom(13977,84004,13083)); -- carrot, fishing pole, pine needles
		e.other:Ding();
		e.other:AddEXP(500);
		e.other:GiveCash(0,1,0,0);

  elseif ( qglobals["ranger_epic15_pre"] == "6" and item_lib.check_turn_in(e.trade, {item1 = 62603}) ) then
    e.self:Say("Hmmm... this is an unusual stone. I sense an ancient love in this stone, a love for the earth as well as for the crafting of stone. But I also sense blood, pain and confusion. I want to destroy it and yet I want to set it among my roots to nourish me. You found this on another plane? I think you have the strength and will to purify this stone, if you have faith. Let me recite a poem to you, small one. It will guide you on this path.");

    e.other:SummonItem(62603); -- Polished Blasted Stone

    e.self:Emote("Xanuusus sways in the breeze. It is impossible to tell if he is trying to remember the poem or if he has fallen asleep.");

    e.self:Say("The darkness seeps and crawls in the night");
    e.self:Say("It eats away at the roots while light sleeps");
    e.self:Say("There are ways to against the darkness fight");
    e.self:Say("The stormy waves revere the rocky shoal");
    e.self:Say("With polish and shine those stones it saves");
    e.self:Say("Respect of the worthy enemy is the goal");
    e.self:Say("It is friendship that are our best armor");
    e.self:Say("A true ally will help a friend when he slips");
    e.self:Say("When they ask for some, we give them more");
    e.self:Say("In the darkest midnight faith is the thing");
    e.self:Say("While one waits for the glory of light");
    e.self:Say("Your trust is the best thing you bring");

    e.self:Emote("That is the poem. I hope you like it. Now, you shall have to decide how this poem applies to you, or to others, without my help. Return to me when you have what you need and we shall see if we can cleanse that stone.' You had plenty of time to write down the poem as Xanuusus recited it.");

    e.other:SummonItem(62632); -- Poem of the Storms

    eq.set_global("ranger_epic15_pre","7",5,"F");
  elseif ( qglobals["ranger_epic15_pre"] == "8" and item_lib.check_turn_in(e.trade, {item1 = 62604}) ) then
    e.self:Say("It is free now. It is wonderful. It, hmmmm . . . makes the wind sound . . . windier. Much like that sword you rangers like so much. I bet someone could make a wind for that stone that would make it even more wonderful.");

    e.other:SummonItem(62604); -- Stone of Winde
    eq.set_global("ranger_epic15_pre","9",5,"F");
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- EOF zone: northkarana ID: 13061 NPC: Xanuusus 

