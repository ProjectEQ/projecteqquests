# Test of Illusion - enchanter epic quest - staff of the serpent
# 
# items: 10604, 17861, 10635, 10610


sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("The hidden self inside a myriad of magic is one that walks quite softly. Yes, that is what you must seek.");
  }
  if ($text=~/ready/i) {
    quest::say("Scattered throughout the world are various items. To prove your worth, go collect these and return them to me. The Xolion Rod, Innoruuk's Word, Chalice of Kings, and snow blossoms.");
  }
  if ($text=~/chalice of kings/i) {
    quest::say("The Chalice of Kings is the chalice of elven kings. Previously thought to be lost to the ages, it was recently discovered. I need its magical powers to create a magical liquid.");
  }
  if ($text=~/xolion rod/i) {
    quest::say("This is the rod of an ancient civilization found on this continent. Nothing is known of it other than that the scaled ones discovered it years ago.");
  }
  if ($text=~/snow blossoms/i) {
    quest::say("These are flowers that are also used in the creation process. They were once widespread, but now I am told they only grow in select places.");
  }
  if ($text=~/innoruuks word/i) {
    quest::say("The strict doctrine of the priests of Innoruuk is used as a material component in the crafting. The power of their hate must not be underestimated.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 10604 => 1)) {
    quest::say("Ah yes, Jeb's seal. The time to craft a Serpent must have come. I will need components collected to craft the first of the pieces. I will also provide you with a sack in which you must combine the items. Are you ready to collect them?");
    quest::summonitem(10604); # Item: Jeb's Seal
    quest::summonitem(17861); # Item: Enchanters Sack
  }
  if (plugin::check_handin(\%itemcount, 10635 => 1)) {
    quest::say("Excellent, you have done well. Here is the first piece of the staff. Now you must go seek out the second master; he will clear the path for you.");
    quest::faction(404,30); # Faction: Truespirit
    quest::exp(100000);
    quest::summonitem(10610); # Item: 1st Piece of Staff
  }
  plugin::return_items(\%itemcount);
}

# EOF Zone: overthere ID: 93150 NPC: Modani_Qu'Loni

