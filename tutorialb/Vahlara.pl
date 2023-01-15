#BeginFile Vahlara.pl
#Quests for The Mines of Gloomingdeep - Vahlara: Gloomingdeep Silk Collecting
# items: 67111, 67125, 67104, 67118, 54234, 54217, 54218, 54219, 54220, 54221, 54222, 54223, 54225, 54226, 54227, 54228, 86010
sub EVENT_SAY {
  if (quest::istaskactivityactive(5091,3)) {
    quest::say("Well done. The revolt's food supply is safe for the time being. Report back to the guards when you're rested.");
  }
  else {
    if (defined($qglobals{amote}) && ($qglobals{amote} == 2)) { #Emote spawnwer "Vast"
      quest::spawn2(189119,0,0,-126.0,-295.8,3.0,249.6); # NPC: _
    }
    if (defined($qglobals{bmote}) && ($qglobals{bmote} == 2)) { #Emote spawner "Screams"
      quest::spawn2(189120,0,0,-385.2,-516.3,-39.3,270.2); # NPC: _
    }
    if ($text=~/hail/i) {
      if(quest::istaskactivityactive(1448,2)) {
		if ($class eq "Berserker" || $class eq "Rogue" || $class eq "Shaman" || $class eq "Ranger"){
        	quest::summonitem(67111); # Item: Gloomingdeep Kobold Chain Sleeves
		}
		elsif ($class eq "Enchanter" || $class eq "Necromancer" || $class eq "Wizard" || $class eq "Magician"){
		quest::summonitem(67125); # Item: Gloomingdeep Kobold Cloth Sleeves
		}
		elsif ($class eq "Warrior" || $class eq "Bard" || $class eq "Shadowknight" || $class eq "Paladin" || $class eq "Cleric"){
		quest::summonitem(67104); # Item: Gloomingdeep Kobold Plate Vambraces
		}
		elsif ($class eq "Druid" || $class eq "Monk" || $class eq "Beastlord"){
		quest::summonitem(67118); # Item: Gloomingdeep Kobold Leather Sleeves
		}
      }
      quest::say("I'm glad you managed to escape the slave warrens in one piece. There are many [" . quest::saylink("others") . "] who were not as lucky. Here, take this armor we found on a kobold. It's not much, but it should keep you safe");
      quest::popup("Equipping Armor", "Vahlara has offered you a piece of kobold armor to keep you safe.
                    <br><br>Equip the armor by dropping it into the large rectangular icon in the center of your inventory
                    (<c \"#00c8f0\"> i</c> ) window.  Notice that your armor automatically moves to its proper armor slot on your body.<br><br> Also note that some armor you will later obtain can only be equipped by placing it directly in its corresponding slot, e.g. dropping a breastplate onto the \"chest\" icon in your inventory. When you do this, the armor will become \"attuned\" to your character, and you will no longer be able to trade it with other players.
					<br><br> <c \"#F07F00\">Once you have equipped the armor, respond to Vahlara's dialogue in your Main Chat window to continue.</c>");
    }
    if ($text=~/others/i) {
      if(quest::istaskactivityactive(1448,2)) {
        quest::updatetaskactivity(1448,2);
      }
      quest::say("These few here. They were injured when the revolt broke out. I'm trying to help, but we have a short supply of [" . quest::saylink("bandages") . "], and more wounded keep coming. I fear many will not survive the hour.");
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
    if (quest::istaskactivityactive(5092,1)) {
      quest::say("Ah, yes. Thank you.");
    }
  }
  plugin::return_items(\%itemcount);
}
