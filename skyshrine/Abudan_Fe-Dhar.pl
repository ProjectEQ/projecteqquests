#Zone: Skyshrine
#Short Name: skyshrine
#Zone ID: 114
#
#NPC Name: Abudan Fe`Dhar
#NPC ID: 114268
# items: 25837, 24982, 31161, 25807, 24977, 31162, 25818, 24979, 31163, 25841, 24981, 31164, 25832, 24983, 31165, 25816, 24978, 31166, 25829, 24980, 31167

sub EVENT_SAY {
  if ($faction == 1) { #req ally CoV
    if($text=~/hail/i) {
      quest::emote("eyes you malevolently.");
      quest::say("I seek those who practice the dark magicks. I seek those who call themselves necromancers. Are you what I seek?");
    }
    if ($text=~/i am a necromancer/i) {
      quest::say("Excellent. Are you sure enough of your skills to undertake my tasks? If not, get out of my sight weakling!");
    }
    if ($text=~/undertake your tasks/i) {
      quest::say("I thought so. I have several tasks for you accomplish. Once you have completed them I will have a cap, a robe, sleeves, wristbands, gloves, leggings and boots to reward you with.");
    }
    if ($text=~/cap/i) {
      quest::say("For you to receive my gift, I shall require three crushed flame opals and a tattered silk turban.");
    }
    if ($text=~/robe/i) {
      quest::say("This exquisite robe shall be yours in exchange for a tattered silk robe and three pristine emeralds.");
    }
    if ($text=~/sleeves/i) {
      quest::say("For these durable sleeves, you must fetch me a pair of tattered silk sleeves and three flawed topaz.");
    }
    if ($text=~/wristband/i) {
      quest::say("The crafting of this wristband requires that you bring me a tattered silk wristband and three crushed onyx sapphires.");
    }
    if ($text=~/glove/i) {
      quest::say("For this fine pair of gloves you must seek out and return to me a pair of tattered silk gloves and three crushed topaz.");
    }
    if ($text=~/leggings/i) {
      quest::say("This pair of leggings will be yours provided you supply me with a pair of tattered silk pantaloons and three nephrite.");
    }
    if ($text=~/boots/i) {
      quest::say("These supple boots shall be yours upon receipt of a pair of tattered silk boots and three crushed jaundice gems.");
    }
  }
  else {
    quest::say("You must prove your dedication to the Claws of Veeshan before I will speak to you.");
  }
}

sub EVENT_ITEM {
  if ($faction == 1) { #req ally CoV 
    if (plugin::check_handin(\%itemcount, 25837 => 3, 24982 => 1)) { #cap
      quest::summonitem(31161); # Item: Rotting Crown
    }
    elsif (plugin::check_handin(\%itemcount, 25807 => 3, 24977 => 1)) { #bp
      quest::summonitem(31162); # Item: Rotting Robe
    }
    elsif (plugin::check_handin(\%itemcount, 25818 => 3, 24979 => 1)) { #arm
      quest::summonitem(31163); # Item: Rotting Sleeves
    }
    elsif (plugin::check_handin(\%itemcount, 25841 => 3, 24981 => 1)) { #bracer
      quest::summonitem(31164); # Item: Rotting Wristguard
    }
    elsif (plugin::check_handin(\%itemcount, 25832 => 3, 24983 => 1)) { #glove
      quest::summonitem(31165); # Item: Rotting Gloves
    }
    elsif (plugin::check_handin(\%itemcount, 25816 => 3, 24978 => 1)) { #leg
      quest::summonitem(31166); # Item: Rotting Trousers
    }
    elsif (plugin::check_handin(\%itemcount, 25829 => 3, 24980 => 1)) { #boots
      quest::summonitem(31167); # Item: Rotting Boots
    }
    quest::emote("smiles warmly as he hands you your reward.");
    quest::say("Well done, $name.");
    quest::exp(175000);
    quest::faction(430,30); # CoV
    quest::faction(436,30); # Yelinak
    quest::faction(448,-60); # Kromzek
  }
  else {
    quest::say("I do not know you well enough to entrust such an item to you, yet.");
  }
  plugin::return_items(\%itemcount);
}

#END of FILE Zone: skyshrine ID:114268 -- Abudan_Fe`Dhar
