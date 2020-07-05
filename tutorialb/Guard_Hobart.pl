# zone: tutorialb
# NPC: Guard Hobart (Missions 4+)
# Quests:
# - Arachnophobia (Group) - taskid:33 - completes
# - The Battle of Gloomingdeep - taskid:27 - starts/completes
# - Freedom's Stand (Group) - taskid:30 - starts/completes
# items: 82930, 82937, 82944, 82951, 77780, 82929, 82936, 82943, 82950


sub EVENT_SAY {
   if($text=~/Hail/i) {
      quest::say("Greetings, $name. We're glad you found your way to our camp. We can use all the help we can get!");
      if (quest::istaskactivityactive(30,1)) {
         quest::updatetaskactivity(30,1);
         if ($class eq 'Warrior' || $class eq 'Cleric' || $class eq 'Bard' || $class eq 'Shadowknight' || $class eq 'Paladin') {
            quest::summonitem(82930); # Item: Gloomiron Breastplate
            #Gloomiron Breatplate
         }
         elsif ($class eq 'Rogue' || $class eq 'Ranger' || $class eq 'Shaman' || $class eq 'Berserker') {
            quest::summonitem(82937); # Item: Gloomchain Chestguard
            #Gloomchain Chestguard
         }
         elsif ($class eq 'Druid' || $class eq 'Beastlord' || $class eq 'Monk' ) {
            quest::summonitem(82944); # Item: Gloomleather Tunic
            #Gloomleather Tunic
         }
         elsif ($class eq 'Enchanter' || $class eq 'Magician' || $class eq 'Wizard' || $class eq 'Necromancer') {
            quest::summonitem(82951); # Item: Gloomsilk Robe
            #Gloomsilk Robe
         }
         quest::exp(75000);
         quest::givecash(0,0,0,5); # 5 plat
         quest::ding();
      }
      elsif (quest::istaskactivityactive(33,1)) {
         quest::say("Excellent work, my friend. Take this potion brewed from Queen Gloomfang's chitin. May it make you strong enough to avenge the many slaves the kobolds have fed her.");
         quest::updatetaskactivity(33,1);
         quest::summonitem(77780,4); # Item: Distillate of Celestial Healing II
         quest::exp(25000);
         quest::ding();
      }
      elsif (quest::istaskactivityactive(27,4)) {
         quest::updatetaskactivity(27,4);
         quest::say("Ha Ha!  When I first laid eyes on you, I thought a strong breeze would knock you over.  Now, look at you!  The hero of the Gloomingdeep slave revolt!");
         if ($class eq 'Warrior' || $class eq 'Cleric' || $class eq 'Bard' || $class eq 'Shadowknight' || $class eq 'Paladin') {
            quest::summonitem(82929); # Item: Gloomiron Greaves
            #Gloomiron Greaves
         }
         elsif ($class eq 'Rogue' || $class eq 'Ranger' || $class eq 'Shaman' || $class eq 'Berserker') {
            quest::summonitem(82936); # Item: Gloomchain Leggings
            #Gloomchain Leggings
         }
         elsif ($class eq 'Druid' || $class eq 'Beastlord' || $class eq 'Monk' ) {
            quest::summonitem(82943); # Item: Gloomleather Pants
            #Gloomleather Pants
         }
         elsif ($class eq 'Enchanter' || $class eq 'Magician' || $class eq 'Wizard' || $class eq 'Necromancer') {
            quest::summonitem(82950); # Item: Gloomsilk Pantaloons
            #Gloomsilk Pantaloons
         }
         quest::exp(25000);
         quest::ding();
      }
      else {
         quest::taskselector(27,30);
      }
   }
} 

      
sub EVENT_ITEM {
    plugin::return_items(\%itemcount); 
} 