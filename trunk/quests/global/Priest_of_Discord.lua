--------------------------------------------------
-- ZONE: Multiple
-- DATABASE: PEQ-Omens of War
-- LAST EDIT DATE: April 25, 2009
-- VERSION: 1.1
-- DEVELOPER: Congdar
--
-- *** NPC INFORMATION ***
--
-- NAME: Priest_of_Discord
-- ID: Multiple
-- TYPE: NPC
-- RACE: Human
-- LEVEL: 50
--
-- *** ITEMS GIVEN OR TAKEN ***
--
-- Tome of Order and Discord ID-18700
-- Discordant Crystal Shard ID-77765
-- Rolled Discordant Parchment ID-77766
-- Spell: Bloodfields Gate ID-77659
-- Spell: Bloodfields Portal ID-77661
-- Spell: Circle of Bloodfields ID-77662
-- Spell: Ring of Bloodfields ID-77663
-- Spell: Translocate: Bloodfields ID-77660
--
-- *** QUESTS INVOLVED IN ***
--
-- Become PvP
-- Bloodfields Port Spells
--
-- *** QUESTS AVAILABLE TO ***
--
-- Become PvP - Anyone
-- Bloodfields Port Spells - Wizards and Druids
--
--------------------------------------------------

function event_say(e)
      if(e.message:findi("hail")) then
         e.self:Say("Ah, another who admits that the path to glory and power lies in discord? Have we not always preached the truth? We are the only ones that can give you passage to the new world of purest Discord. Should you like to go there, tell me you [" .. eq.say_link("wish",false,"wish to go to Discord") .. "] and I will grant you passage. If you wish to [" .. eq.say_link("know more",false,"know more") .. "] about this travel, I will tell you. And, of course, if you have come to seek the way of Discord in your life, then ask me about your [" .. eq.say_link("tome",false,"Tome of Order and Discord") .. "].");
      elseif(e.message:findi("know more")) then
         e.self:Say("We have been given a unique magic to pass through realms and we believe it to be the influence of Discord itself granting this gift upon its faithful followers. Only we can send you back and forth to the realm touched by Discord, a world called Kuua. You will find priests on the other side that will send you directly back to me, where your travel originated. And, if you are of the right ilk, I may be able to grant you [" .. eq.say_link("information",false,"additional information") .. "].");
      elseif(e.message:findi("information")) then
         e.self:Say("There is a magic in Kuua that is blessed with the power of Discord itself. We have found we can use that magic to help those who help us. If you return three [" .. eq.say_link("shards",false,"discordant crystal shards") .. "] and a [" .. eq.say_link("parchment",false,"magic parchment") .. "], we will imbue it with our power so you may travel there alone. Obviously, you must be a master of teleportation yourself -- a wizard or druid, is what I mean.");
      elseif(e.message:findi("shards")) then
          e.self:Say("The crystal shards are very unique and bear a magic that brims with the power of Discord. We found we can use them to create spells on a specific type of discordant parchment that allows wizards and druids to pass through to the other realm.");
      elseif(e.message:findi("parchment")) then
         e.self:Say("We are not certain what the parchments were meant for, but they burn hot and cold and are imbued with a magic that protects it from destroying itself. We need one of these parchments to make a travel spell to Kuua in the Realm of Discord.");
      elseif(e.message:findi("tome")) then
         e.self:Say("The Tome of Order and Discord was penned by the seventh member of the Tribunal and has become the key to a life of Discord, in spite of the author's pitiful warnings. Do you not have one, child of Order? Would you [" .. eq.say_link("like to read",false,"like to read") .. "] it?");
      elseif(e.message:findi("read")) then
         e.self:Say("Very well. Here you go. Simply return it to me to be released from the chains of Order.");
         e.other:SummonItem(18700); --Tome of Order and Discord
      elseif(e.message:findi("wish")) then
         e.self:Say("I am sorry but Discord is closed to me right now.");
         --e.self:Say("Prepare yourself to cross into the depths of Discord!");
         --eq.set_global("OOW_PoD_Origin",tostring(eq.get_zone_id()),5,"F");
         --e.other:MovePC(302, -1485.52, -1263.29, 222.0,36);
      end
end

function event_trade(e)
   local item_lib = require("items");
   
   if (item_lib.check_turn_in(e.trade, {item1 = 18700})) then --Tome of Order and Discord
      e.self:Say("I see you wish to join us in Discord! Welcome! By turning your back on the protection of Order you are now open to many more opportunities for glory and power. Remember that you can now be harmed by those who have also heard the call of Discord.");
      e.other:SetPVP(true);
      e.other:Ding();
   elseif((e.other:Class() == "Wizard" or e.other:Class() == "Druid") and item_lib.check_turn_in(e.trade, {item1 = 77765, item2 = 77765, item3 = 77765, item4 = 77766})) then --Discordant Crystal Shards x 3, Rolled Discordant Parchment
      e.self:Emote("wraps the crystals in the parchment and closes his eyes, chanting in a language you've never heard. In moments, a burning parchment appears.");
      e.self:Say("You will now be able to teleport into the realm of discord, true power is at your fingertips!");

      if(e.other:Class() == "Wizard") then
         e.other:SummonItem(77659); --Spell: Bloodfields Gate
         e.other:SummonItem(77660); --Spell: Translocate: Bloodfields
         e.other:SummonItem(77661); --Spell: Bloodfields Portal
      elseif(e.other:Class() == "Druid") then
         e.other:SummonItem(77662); --Spell: Circle of Bloodfields
         e.other:SummonItem(77663); --Spell: Ring of Bloodfields
      end
      e.other:Ding();
   end
   item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:Multiple  ID:Multiple -- Priest_of_Discord