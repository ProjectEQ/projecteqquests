# warrior crafted armor
# generic reward text - could only find the correct text for the bracer
# updated the original file with correct text and used the handin plugin

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hail. I am Shakrn Meadowgreen, Warrior extraordinaire and Master Armorer of the Meadowgreen family. My brother and I craft [armor] for the bravest warriors in the land -- do you think you [qualify]?");
  }
  if ($text=~/armor/i) {
    quest::say("I smith [Helms], [Gauntlets], [Boots] and [Vambraces]. My brother Ulan smiths Bracers, Greaves, Pauldruns and Breastplates.");
  }
  if ($text=~/qualify/i) {
    quest::say("So you are a warrior of renown?  [Prove] it to me and I will smith you [armor] befitting your exalted station.");
  }
  if ($text=~/prove/i) {
    quest::say("You will prove yourself to me the old fashioned way, by killing things and bringing me back proof of your deed.  Bah.  What other way is there?");
  }
  if ($text=~/helm/i) {
    quest::say("One of my brethren spoke to me of the mystic properties of the Fire Totems carried by the Goblin High Shaman in Solusek's Eye. My mighty Centaur body will not fit down those twisty goblin passages, so I have not been able to acquire one on my own. As proof of your powers, I ask you to bring me a Fire Totem and one [Ruby] stone. Do so and I will reward you with a Crafted Helmet.");
  }
  if ($text=~/gauntlets/i) {
    quest::say("Crafted Gauntlets - the mark of a distinguished warrior. I have a personal grudge to settle with those twice-cursed Aviaks. They have been raiding our merchant convoys for the last few weeks, causing mischief to no end. Bring me an Aviak charm from a Avocet - I am sure that you will not need me to tell you how to get it. An Aviak Charm and two [Star Rubies], and I will reward you with Crafted Gauntlets.");
  }
  if ($text=~/boots/i) {
    quest::say("One of my brethren spoke to me of the mystic properties of the Frost Totems carried by the Goblin High Shamans in Permafrost Keep. I have been unable to fetch one for myself, as my Centaur's body will not fit through the tunnels of those sniveling wretches. Prove your might by gifting me a Frost Totem and two [Sapphire] stones. Do this and I will reward you with a pair of Crafted Boots.");
  }
  if ($text=~/vambraces/i) {
    quest::say("Come, Warrior, and speak to me of your strength. Bring me the Eye of a Griffon that I might eat it raw in the fashion of my ancestors. Do this for me - then gift me with two [Fire Emeralds], and for you I will make a Crafted Vambrace.");
  }
  if ($text=~/ruby/i) {
    quest::say("I need a ruby for a piece of jewelry my brother and I are creating.");
  }
  if ($text=~/star rubies/i) {
    quest::say("I need a star ruby for a piece of jewelry my brother and I are creating.");
  }
  if ($text=~/fire emerald/i) {
    quest::say("i need a fire emerald for a piece of jewelry my brother and I are creating.");
  }
  if ($text=~/sapphire/i) {
    quest::say("I need a sapphire for a piece of jewelry my brother and I are creating");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 13743 => 1, 10035 => 1)) { #helm
    quest::say("Excellent! Here is your reward, you have earned it!");
    quest::exp(25000);
    quest::summonitem(4173);
  }
  elsif (plugin::check_handin(\%itemcount, 13737 => 1, 10032 => 2)) { #gauntlet
    quest::say("Excellent! Here is your reward, you have earned it!");
    quest::exp(25000);
    quest::summonitem(4178);
  }
  elsif (plugin::check_handin(\%itemcount, 13744 => 1, 10034 => 2)) { #boots
    quest::say("Excellent! Here is your reward, you have earned it!");
    quest::exp(25000);
    quest::summonitem(4180);
  }
  elsif (plugin::check_handin(\%itemcount, 13739 => 1, 10033 => 2)) { #vambraces
    quest::say("Excellent! Here is your reward, you have earned it!");
    quest::exp(25000);
    quest::summonitem(4176);
  }
  else {
    plugin::return_items(\%itemcount);
  }
}

# EOF zone: southkarana ID: 14075 NPC: Shakrn_Meadowgreen

