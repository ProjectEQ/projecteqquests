# Quest for Lorekeeper_Dorinan in Thurgadina - Cleric Velious Armor (Forbidden Rites) 

# Kiladiveus - created Sub EVENT_ITEM for quest. Used Faction requirement method. 

sub EVENT_SAY {
  if ($faction <= 3) { # Require Warmly and greater faction
    if($text=~/Hail/i){
      quest::say("Greetings to you. You are far away from your homelands, stranger. I am looking for someone. We here at the Temple of Lore are always seeking fellow priests of various faiths. Tell me, $race, are you a cleric?");
    }
    if ($text=~/i am a cleric/i) {
      quest::say("Ah, a most pious one indeed. I sense the aura of your devotion and conviction and they are strong about you. A shame you are so short-lived. But I see potential in you and for that I shall aid you in your calling, cleric. Do you wish my aid?");
    }
    if ($text=~/i wish your aid/i) {
      quest::say("Then I have a set of goals for you.  Once you have achieved them, you shall be rewarded with such as these: a helm, a breastplate, armplates, bracers, gauntlets, greaves and boots.  May they protect you from your enemies.");
    }
    if ($text=~/helm/i) {
      quest::say("Those who are wise as we are know that protection of the head is most important.  I may be able to forge you something most interesting if you were to bring me a corroded plate helm and three pieces of crushed onyx sapphire.");
    }
    if ($text=~/breastplate/i) {
      quest::say("If you find a corroded breastplate and three pieces of black marble bring them to me and I shall attempt to create an enchanted breastplate that will serve you well.");
    }
    if ($text=~/armplates/i) {
      quest::say("Three jaundice gems and a set of corroded plate vambraces might be an interesting combination.  The powers of the gems may be harvested to imbue the vambraces.");
    }
    if ($text=~/bracers/i) {
      quest::say("Bracers are quite easy to imbue.  Simply find three crushed opals and a corroded plate bracer and I will complete the ritual to enchant them.");
    }
    if ($text=~/boots/i) {
      quest::say("Simply bring me a set of three crushed flame emeralds and a pair of corroded plate boots and I will imbue them.  I bid you good luck in finding such things.");
    }
    if ($text=~/gauntlets/i) {
      quest::say("Strong protection for one's hands is important.  I may be able to craft you a set of powerful plate gauntlets if you find a set of corroded plate gauntlets and three crushed lava rubies.");
    }
    if ($text=~/greaves/i) {
      quest::say("'A set of corroded greaves might be salvageable if you were to find three chipped onyx sapphires. With the right techniques almost anything is possible.");
    }
  }
  else {
    quest::say("I do not know you well enough to entrust you with such a quest, yet.");
  }
}

sub EVENT_SIGNAL {
  if ($signal == 99) {
    quest::say("The Grand Historian cannot be disturbed right now. Loremaster Borannin will assist you if you seek to perform duties for the crown. If you wish to learn more of our history and culture please speak to the loremasters in the Temple's library here.");
  }
}

sub EVENT_ITEM {
  if ($faction <= 3) { # Require warmly and greater faction
    if (plugin::check_handin(\%itemcount, 25805 => 3, 24928 => 1)) { # tunic
      quest::summonitem(31043);
    }
    elsif (plugin::check_handin(\%itemcount, 25815 => 3, 24930 => 1)) { #sleeves
      quest::summonitem(31044);
    }
    elsif (plugin::check_handin(\%itemcount, 25827 => 3, 24929 => 1)) { #legs
      quest::summonitem(31047);
    }
    elsif (plugin::check_handin(\%itemcount, 25840 => 3, 24934 => 1)) { #gloves 
      quest::summonitem(31046);
    }
    elsif (plugin::check_handin(\%itemcount, 25841 => 3, 24933 => 1)) { #cap
      quest::summonitem(31042);
    }
    elsif (plugin::check_handin(\%itemcount, 25836 => 3, 24932 => 1)) { #bracers 
      quest::summonitem(31045);
    }
    elsif (plugin::check_handin(\%itemcount, 25838 => 3, 24931 => 1)) { # boots 
      quest::summonitem(31048);
    }
    else {
      plugin::return_items(\%itemcount);
      return 1;
    }
    quest::exp(100000);
    quest::faction(49,20); # coldain
    quest::faction(67,20); # Dain Frostreaver IV
    quest::faction(188,-60); # Kromrif
    quest::faction(189,-60); # Kromzek
    quest::emote("smiles warmly as she hands you your reward.");
    quest::say("You have done well.");
  }
  else {
    quest::say("I do not know you well enough to entrust you with such an item, yet.");
  }
}

#END of FILE Zone:thurgadina  ID:115015 -- Loremaster_Dorinan

