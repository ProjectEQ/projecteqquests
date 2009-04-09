sub EVENT_SAY {
  if ($text=~/Crypts of Nadox/i) {
    quest::say("'How am I supposed to know? Sounds like some darn troll lair. You're the adventurer, why don't you go investigate it. I will stay here to look for more clues.");
  }
}


sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 55003 => 1)) {
  quest::say("Yes, what is it, citizen?' Bribbely reads the note from Jasmine. 'Great, just what I need.' Guard Bribbely sighs. 'I have been a member of the guard for twenty years, investigating countless thefts and other crimes against Freeport and you think you can just waltz in here and solve this? You adventurers are all the same. Ok, 'investigator', if you think you are so smart, here is what we know so far: After the trolls attacked the ship, one of them was left behind and captured by us. After being beat, er questioned, the troll eventually told us that they were from Broken Skull Rock and that is probably where they took our captured ship. He didn't know about any mail, but says that any loot onboard was most likely taken to the [Crypts of Nadox] to await distribution by treasure sorters to the trolls there as payment. Further questioning revealed that a ship on the shores of Stonebrunt can take people to Broken Skull.");
}
}
