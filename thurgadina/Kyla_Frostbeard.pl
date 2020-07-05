#Zone: Thurgadin
#Short Name: thurgadina
#Zone ID: 115
#
#NPC Name: Kyla Frostbeard
#NPC ID: 115149 115217
#
# used generic reward text found on other npc's already created.
# items: 25837, 24954, 31070, 25807, 24949, 31071, 25818, 24951, 31072, 25841, 24953, 31073, 25832, 24955, 31074, 25816, 24950, 31075, 25829, 24952, 31076

sub EVENT_SAY {
  if ($faction <= 3) { # Require warmly and greater faction
    if ($text=~/hail/i) {
      quest::say("Greetings to you. I seek those who call themselves magicians. Are you a magician, little one?");
    }
    if ($text=~/i am a magician/i) {
    quest::say("I thought so. I have several tasks for you accomplish. Once you have completed them I will have a cap, a robe, sleeves, wristbands, gloves, leggings and boots to reward you with.");
    }
    if ($text=~/cap/i) {
    quest::say("For an enchanted head guard bring me a torn enchanted silk turban as well as three pieces of crushed flame opal.");
    }
    if ($text=~/robe/i) {
    quest::say("If you wish to have a fine robe, bring unto me a torn enchanted silk robe and three pristine emeralds. Then you will receive a robe beyond your wildest dreams.");
    }
    if ($text=~/sleeves/i) {
    quest::say("Bring unto me a set of torn enchanted silk sleeves as well as three flawed topaz. With these in my possession I can create a set of enchanted sleeves the likes of which spellcasters like you dream of.");
    }
    if ($text=~/wristbands/i) {
    quest::say("An enchanted silk wristguard and three crushed onyx sapphires is all that I require to create an imbued wrist wrap of great power. Seek out these items and return to me when you have acquired them.");
    }
    if ($text=~/leggings/i) {
    quest::say("Three nephrite and a pair of torn enchanted silk leggings will net you a fine set of pantaloons.");
    }
    if ($text=~/boots/i) {
    quest::say("Three crushed jaundice gems combined with torn enchanted silk boots would make a most interesting set of footwear. The latent powers of the gems can be harnessed to create magical effects.");
    }
    if ($text=~/gloves/i) {
    quest::say("If you seek gloves of great power, bring to me three crushed topaz and a pair of torn enchanted silk gloves. I will use the power of the gems to imbue the gloves.");
    }
  }
  else {
    quest::say("I do not know you well enough to entrust you with such a quest, yet.");
  }
}

sub EVENT_ITEM {
  if ($faction <= 3) { # Require warmly and greater faction
    if (plugin::check_handin(\%itemcount, 25837 => 3, 24954 => 1)) { # cap
      quest::summonitem(31070); # Item: Arch Mage's Crown
      quest::exp(100000);
      quest::faction(406,20); # coldain
      quest::faction(405,20); # Dain Frostreaver IV
      quest::faction(419,-60); # Kromrif
      quest::faction(448,-60); # Kromzek
      quest::emote("smiles warmly as she hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25807 => 3, 24949 => 1)) { # robe
      quest::summonitem(31071); # Item: Arch Mage's Robe
      quest::exp(100000);
      quest::faction(406,20); # coldain
      quest::faction(405,20); # Dain Frostreaver IV
      quest::faction(419,-60); # Kromrif
      quest::faction(448,-60); # Kromzek
      quest::emote("smiles warmly as she hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25818 => 3, 24951 => 1)) { # sleeves
      quest::summonitem(31072); # Item: Arch Mage's Sleeves
      quest::exp(100000);
      quest::faction(406,20); # coldain
      quest::faction(405,20); # Dain Frostreaver IV
      quest::faction(419,-60); # Kromrif
      quest::faction(448,-60); # Kromzek
      quest::emote("smiles warmly as she hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25841 => 3, 24953 => 1)) { # wrist
      quest::summonitem(31073); # Item: Arch Mage's Warband
      quest::exp(100000);
      quest::faction(406,20); # coldain
      quest::faction(405,20); # Dain Frostreaver IV
      quest::faction(419,-60); # Kromrif
      quest::faction(448,-60); # Kromzek
      quest::emote("smiles warmly as she hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25832 => 3, 24955 => 1)) { # gloves
      quest::summonitem(31074); # Item: Arch Mage's Gloves
      quest::exp(100000);
      quest::faction(406,20); # coldain
      quest::faction(405,20); # Dain Frostreaver IV
      quest::faction(419,-60); # Kromrif
      quest::faction(448,-60); # Kromzek
      quest::emote("smiles warmly as she hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25816 => 3, 24950 => 1)) { # legs
      quest::summonitem(31075); # Item: Arch Mage's Pantaloons
      quest::exp(100000);
      quest::faction(406,20); # coldain
      quest::faction(405,20); # Dain Frostreaver IV
      quest::faction(419,-60); # Kromrif
      quest::faction(448,-60); # Kromzek
      quest::emote("smiles warmly as she hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25829 => 3, 24952 => 1)) { # boots
      quest::summonitem(31076); # Item: Arch Mage's Boots
      quest::exp(100000);
      quest::faction(406,20); # coldain
      quest::faction(405,20); # Dain Frostreaver IV
      quest::faction(419,-60); # Kromrif
      quest::faction(448,-60); # Kromzek
      quest::emote("smiles warmly as she hands you your reward.");
      quest::say("You have done well.");
    }
    else {
      plugin::return_items(\%itemcount); 
    }
  }
  else {
    quest::say("I do not know you well enough to entrust you with such an item, yet.");
  }
}

#END of FILE Zone: thurgadina ID:115149 -- Kyla_Frostbeard

