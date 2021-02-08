#Zone: Skyshrine
#Short Name: skyshrine
#Zone ID: 114
#
#NPC Name: Elaend Fe`Dhar
#NPC ID: 114261
# items: 25837, 24982, 31154, 25807, 24977, 31155, 25818, 24979, 31156, 25841, 24981, 31157, 25832, 24983, 31158, 25816, 24978, 31159, 25829, 24980, 31160

sub EVENT_SAY {
  if ($faction == 1) { #req ally CoV
    if($text=~/hail/i) {
      quest::say("Greetings to you. I seek one who calls himself a wizard. What do you call yourself, manling?");
    }
    if ($text=~/i am a wizard/i) {
      quest::say("Excellent. Are you sure enough of your skills to undertake my tasks? If not, get out of my sight!");
    }
    if ($text=~/undertake your tasks/i) {
      quest::say("I thought so. One should never back down from a challenge. Once you have completed them I will have a cap, a robe, sleeves, wristbands, gloves, leggings and boots.");
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
      quest::summonitem(31154); # Item: Icicle Circlet
    }
    elsif (plugin::check_handin(\%itemcount, 25807 => 3, 24977 => 1)) { #bp
      quest::summonitem(31155); # Item: Robe of Icicles
    }
    elsif (plugin::check_handin(\%itemcount, 25818 => 3, 24979 => 1)) { #arm
      quest::summonitem(31156); # Item: Icicle Sleeves
    }
    elsif (plugin::check_handin(\%itemcount, 25841 => 3, 24981 => 1)) { #bracer
      quest::summonitem(31157); # Item: Icicle Bracelet
    }
    elsif (plugin::check_handin(\%itemcount, 25832 => 3, 24983 => 1)) { #glove
      quest::summonitem(31158); # Item: Icicle Gloves
    }
    elsif (plugin::check_handin(\%itemcount, 25816 => 3, 24978 => 1)) { #leg
      quest::summonitem(31159); # Item: Icicle Pantaloons
    }
    elsif (plugin::check_handin(\%itemcount, 25829 => 3, 24980 => 1)) { #boots
      quest::summonitem(31160); # Item: Icicle Boots
    }
    else {
      plugin::return_items(\%itemcount);
      return 1;
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
    plugin::return_items(\%itemcount);
  }
}

#END of FILE Zone: skyshrine ID:114261 -- Elaend_Fe`Dhar
