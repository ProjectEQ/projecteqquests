#Zone: Skyshrine
#Short Name: skyshrine
#Zone ID: 114
#
#NPC Name: Nalelin Fe`Dhar
#NPC ID: 114266

sub EVENT_SAY {
  if ($faction == 1) { #req ally CoV
    if($text=~/hail/i) {
      quest::say("Greetings, I seek the ones who stalk through the forests protecting it. If you are one known as a ranger, submit to my will and become stronger. The tasks I set forth will not be easy. Are you ready to submit to my will?");
    }
    if ($text=~/submit to your will/i) {
      quest::say("That is good, for there is nothing like the wrath of nature, woodland warrior. And Nature's wrath shall you be, with this armor to protect you in your struggle. I shall forge a coif, breastplate, sleeves, bracers, gauntlets, leggings, and boots for you.");
    }
    if ($text=~/coif/i) {
      quest::say("This coif shall protect you from battle and the elements. What I require of you are these: an unadorned chain coif and three pieces of crushed coral. Do not waste precious time!");
    }
    if ($text=~/breastplate/i) {
      quest::say("Even as the hardest tree in the forest gains protection from its bark, so shall you gain the protection of this breastplate. Bring these components for me - an unadorned chain tunic and three flawless diamonds.");
    }
    if ($text=~/sleeves/i) {
      quest::say("I require unadorned chain sleeves, as well as three flawed emeralds. Do this so that I may grant you them as a gift for your diligence.");
    }
    if ($text=~/bracer/i) {
      quest::say("This shall help shield your forearms from any stray blows. Bring me an unadorned chain bracelet and three crushed flame emeralds.");
    }
    if ($text=~/gauntlet/i) {
      quest::say("Bring me these items, for I will not grant you your pair until then - a pair of unadorned chain gauntlets and a set of three crushed topaz.");
    }
    if ($text=~/leggings/i) {
      quest::say("A pair of leggings you seek? I seek something as well. Bring me a pair of unadorned chain leggings and three flawed sea sapphires. Go now. The struggle continues as we speak.");
    }
    if ($text=~/boots/i) {
      quest::say("For the boots, I shall require a pair of unadorned chain boots as well as three pieces of crushed black marble.");
    }
  }
  else {
    quest::say("You must prove your dedication to the Claws of Veeshan before I will speak to you.");
  }
}

sub EVENT_ITEM {
  if ($faction == 1) { #req ally CoV 
    if (plugin::check_handin(\%itemcount, 25831 => 3, 24968 => 1)) { #cap
      quest::summonitem(31112);
    }
    elsif (plugin::check_handin(\%itemcount, 25814 => 3, 24963 => 1)) { #bp
      quest::summonitem(31113);
    }
    elsif (plugin::check_handin(\%itemcount, 25821 => 3, 24965 => 1)) { #arm
      quest::summonitem(31114);
    }
    elsif (plugin::check_handin(\%itemcount, 25838 => 3, 24967 => 1)) { #bracer
      quest::summonitem(31115);
    }
    elsif (plugin::check_handin(\%itemcount, 25832 => 3, 24969 => 1)) { #glove
      quest::summonitem(31116);
    }
    elsif (plugin::check_handin(\%itemcount, 25825 => 3, 24964 => 1)) { #leg
      quest::summonitem(31117);
    }
    elsif (plugin::check_handin(\%itemcount, 25833 => 3, 24966 => 1)) { #boots
      quest::summonitem(31118);
    }
    else {
      plugin::return_items(\%itemcount);
      return 1;
    }
    quest::emote("smiles warmly as he hands you your reward.");
    quest::say("Well done, $name.");
    quest::exp(175000);
    quest::faction(42,30); # CoV
    quest::faction(362,30); # Yelinak
    quest::faction(189,-60); # Kromzek
  }
  else {
    quest::say("I do not know you well enough to entrust such an item to you, yet.");
    plugin::return_items(\%itemcount);
  }
}

#END of FILE Zone: skyshrine ID:114266 -- Nalelin_Fe`Dhar