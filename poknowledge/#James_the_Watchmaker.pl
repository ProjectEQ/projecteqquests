#James_the_Watchmaker.pl
#Start basic Say Script
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
            push (@task_list, 260);#level 20 caster
            push (@task_list, 261);#level 25 caster
            push (@task_list, 262);#level 30 caster
            push (@task_list, 263);#level 35 caster
            push (@task_list, 264);#level 40 caster
            push (@task_list, 265);#level 45 caster
            push (@task_list, 266);#level 50 caster
            push (@task_list, 267);#level 55 caster
            push (@task_list, 268);#level 60 caster
      }
         if(($class eq "Warrior") || ($class eq "Monk") || ($class eq "Rogue") || ($class eq "Berserker")) {
            push (@task_list, 269);#level 20 melee
            push (@task_list, 270);#level 25 melee
            push (@task_list, 234);#level 30 melee
            push (@task_list, 235);#level 35 melee
            push (@task_list, 236);#level 40 melee
            push (@task_list, 237);#level 45 melee
            push (@task_list, 238);#level 50 melee
            push (@task_list, 239);#level 55 melee
            push (@task_list, 240);#level 60 melee
      }
         if(($class eq "Cleric") || ($class eq "Druid") || ($class eq "Shaman")) {
            push (@task_list, 241);#level 20 healer
            push (@task_list, 242);#level 25 healer
            push (@task_list, 243);#level 30 healer
            push (@task_list, 244);#level 35 healer
            push (@task_list, 245);#level 40 healer
            push (@task_list, 246);#level 45 healer
            push (@task_list, 247);#level 50 healer
            push (@task_list, 248);#level 55 healer
            push (@task_list, 249);#level 60 healer
      }
         if(($class eq "Paladin") || ($class eq "Ranger") || ($class eq "Shadowknight") || ($class eq "Bard") || ($class eq "Beastlord")) {
            push (@task_list, 250);#level 20 hybrid
            push (@task_list, 251);#level 25 hybrid
            push (@task_list, 252);#level 30 hybrid
            push (@task_list, 253);#level 35 hybrid
            push (@task_list, 254);#level 40 hybrid
            push (@task_list, 255);#level 45 hybrid
            push (@task_list, 256);#level 50 hybrid
            push (@task_list, 257);#level 55 hybrid
            push (@task_list, 258);#level 60 hybrid
      }
         
            push (@task_list, 259);#level 65 all
         quest::taskselector(@task_list);
         @task_list = ();
   }
}



sub EVENT_ITEM {
      if(plugin::check_handin(\%itemcount, 80026 => 1 )) {#Dusty Golden Statue
         quest::summonitem(80027);
      }
      if(plugin::check_handin(\%itemcount, 80027 => 1 )) {#Broken Gearshard
         quest::summonitem(80028);
      }
      if(plugin::check_handin(\%itemcount, 80028 => 1 )) {#Lost Coin
         quest::summonitem(80029);
      }
      if(plugin::check_handin(\%itemcount, 80029 => 1 )) {#Locked Case
         quest::summonitem(80026);
      }
}

sub EVENT_TIMER {
      if($timer == 2) {
         quest::shout("Somebody! Anybody! Please help me find my watch!");
      }
}