#James_the_Watchmaker.pl
#Start basic Say Script
# items: 80026, 80027, 80028, 80029
sub EVENT_SPAWN {
         quest::settimer(2,900);#15 minute timer
      }   
         my @task_list = ();
sub EVENT_SAY   {
      if($text=~/hail/i) {
         quest::say("Hello there $name! Do you happen to have the [time]?");
            if(plugin::check_hasitem($client, 80026)) {#Level 65 Reward-Dusty Golden Statue
               quest::say("Congratulations on completing the last quest! If you do not like the reward I have given you I will gladly exchange it for your services!");# Made up Text
            }
         }
      if($text=~/time/i) {
         quest::say("Yes, the time of day. You see I usually keep a number of watches with me at all times so I always know what time it is but I recently [lost], well, all of them.");
      }
      if($text=~/lost/i) {
         quest::say("I lost them when I was travelling last week. I wanted to visit some of the places in Norrath that were special to me but I seemed to run into trouble everywhere I visited! And wouldn't you know it but everytime I stopped for a bit I managed to lose one of my [watches]!");
      }
      if($text=~/watches/i) {
         quest::say("That's what I said, watches! Are you hard of hearing? I don't suppose you would like to [look] for my watches? I hate not knowing what time it is! I'm sure I could find something in my backpack to interest you if you found one of my watches!");
      }
# Opens task window with the proper task for the proper class.
      if($text=~/look/i) {
         if(($class eq "Necromancer") || ($class eq "Wizard") || ($class eq "Magician") || ($class eq "Enchanter")) {
            push (@task_list, 500260);#level 20 caster
            push (@task_list, 500261);#level 25 caster
            push (@task_list, 500262);#level 30 caster
            push (@task_list, 500263);#level 35 caster
            push (@task_list, 500264);#level 40 caster
            push (@task_list, 500265);#level 45 caster
            push (@task_list, 500266);#level 50 caster
            push (@task_list, 500267);#level 55 caster
            push (@task_list, 500268);#level 60 caster
      }
         if(($class eq "Warrior") || ($class eq "Monk") || ($class eq "Rogue") || ($class eq "Berserker")) {
            push (@task_list, 10654);#level 20 melee
            push (@task_list, 10655);#level 25 melee
            push (@task_list, 10656);#level 30 melee
            push (@task_list, 10657);#level 35 melee
            push (@task_list, 10658);#level 40 melee
            push (@task_list, 10659);#level 45 melee
            push (@task_list, 10660);#level 50 melee
            push (@task_list, 10661);#level 55 melee
            push (@task_list, 10662);#level 60 melee
      }
         if(($class eq "Cleric") || ($class eq "Druid") || ($class eq "Shaman")) {
            push (@task_list, 500241);#level 20 healer
            push (@task_list, 500242);#level 25 healer
            push (@task_list, 500243);#level 30 healer
            push (@task_list, 500244);#level 35 healer
            push (@task_list, 500245);#level 40 healer
            push (@task_list, 500246);#level 45 healer
            push (@task_list, 500247);#level 50 healer
            push (@task_list, 500248);#level 55 healer
            push (@task_list, 500249);#level 60 healer
      }
         if(($class eq "Paladin") || ($class eq "Ranger") || ($class eq "Shadowknight") || ($class eq "Bard") || ($class eq "Beastlord")) {
            push (@task_list, 500250);#level 20 hybrid
            push (@task_list, 500251);#level 25 hybrid
            push (@task_list, 500252);#level 30 hybrid
            push (@task_list, 500253);#level 35 hybrid
            push (@task_list, 500254);#level 40 hybrid
            push (@task_list, 500255);#level 45 hybrid
            push (@task_list, 500256);#level 50 hybrid
            push (@task_list, 500257);#level 55 hybrid
            push (@task_list, 500258);#level 60 hybrid
      }
         
            push (@task_list, 500259);#level 65 all
         quest::taskselector(@task_list);
         @task_list = ();
   }
}



sub EVENT_ITEM {
      if(plugin::check_handin(\%itemcount, 80026 => 1 )) {#Dusty Golden Statue
         quest::summonitem(80027); # Item: Broken Gearshard
      }
      if(plugin::check_handin(\%itemcount, 80027 => 1 )) {#Broken Gearshard
         quest::summonitem(80028); # Item: Lost Coin
      }
      if(plugin::check_handin(\%itemcount, 80028 => 1 )) {#Lost Coin
         quest::summonitem(80029); # Item: Locked Case
      }
      if(plugin::check_handin(\%itemcount, 80029 => 1 )) {#Locked Case
         quest::summonitem(80026); # Item: Dusty Golden Statue
      }
}

sub EVENT_TIMER {
      if($timer == 2) {
         quest::shout("Somebody! Anybody! Please help me find my watch!");
      }
}