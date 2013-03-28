#BeginFile Vahlara.pl
#Quests for The Mines of Gloomingdeep - Vahlara: Gloomingdeep Silk Collecting
sub EVENT_SAY {
  if (quest::istaskactivityactive(17,3)) {
    quest::say("Well done. The revolt's food supply is safe for the time being. Report back to the guards when you're rested.");
  }
  else {
    if (defined($qglobals{amote}) && ($qglobals{amote} == 2)) { #Emote spawnwer "Vast"
      quest::spawn2(189119,0,0,-126.0,-295.8,3.0,124.8);
    }
    if (defined($qglobals{bmote}) && ($qglobals{bmote} == 2)) { #Emote spawner "Screams"
      quest::spawn2(189120,0,0,-385.2,-516.3,-39.3,135.1);
    }
    if ($text=~/hail/i) {
      if(quest::istaskactivityactive(22,2)) {
        quest::summonitem(54224);
      }
      quest::say("I'm glad you managed to escape the slave warrens in one piece. There are many [others] who were not as lucky. Here, take this burlap armor. It's not much, but it should keep you safe");
      quest::popup("Equipping Armor", "Vahlara has offered you a piece of burlap armor to keep you safe.
                    <br><br>Equip the armor by dropping it into the large rectangular icon in the center of your inventory
                    (i) window.  Notice that your armor automatically moves to its proper armor slot on your body.<br><br>
                    <c \"#F07F00\">Once you have equipped the armor, respond to Vahlara's dialogue in your Main Chat window to continue.</c>");
    }
    if ($text=~/others/i) {
      if(quest::istaskactivityactive(22,2)) {
        quest::updatetaskactivity(22,2);
      }
      quest::say("These few here. They were injured when the revolt broke out. I'm trying to help, but we have a short supply of [bandages], and more wounded keep coming. I fear many will not survive the hour.");
      quest::popup("Equipping Armor", "Now that you have your sleeves equiped notice in your inventory window 
                    that your Armor Class or \"AC\" went up.  The higher your Armor Class the harder it will be for your 
                    enemies to hit you.<br><br>Vahlara can make you more armor if you are able to bring her pieces of 
                    Gloomingdeep Spider Silk from the mines beyond.<br><br><c \"#F07F00\">Open your Quest Window [ALT+Q]
                    to check the next step in your Basic Training.</c>");
    }
    if ($text=~/bandages/i) {
      quest::say("I was a skilled tailor before I was enslaved, so I'm able to weave spider silk into makeshift gauzes and dressings. But now even the spiderling silk is running scarce. If you can find three pieces of spiderling silk, bring them to me unstacked, and I'll give you some armor I've crafted from burlap. Burlap's no good for bandages anyway.");
    }
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 54234 => 1) || plugin::check_handin(\%itemcount, 54234 => 3)) { #Gloomingdeep Silk x 1 or 3
    quest::say("You have proven most resourceful $name.");
    quest::summonitem(quest::ChooseRandom(54217,54218,54219,54220,54221,54222,54223,54225,54226,54227,54228)); #Random Stitched Burlap item
  }
  elsif (plugin::check_handin(\%itemcount, 86010 => 4) || plugin::check_handin(\%itemcount, 86010 => 3) || plugin::check_handin(\%itemcount, 86010 => 2) || plugin::check_handin(\%itemcount, 86010 => 1)) {
    if (quest::istaskactivityactive(28,1)) {
      quest::say("Ah, yes. Thank you.");
    }
  }
  plugin::return_items(\%itemcount);
}