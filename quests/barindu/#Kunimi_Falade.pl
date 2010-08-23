sub EVENT_SAY {
  if($text=~/hail/i) {
  if ($faction <= 1) { # Require ally faction
  if (defined $qglobals{bic} && $qglobals{bic} == 5) {
  quest::emote("glances around to make sure no one is within earshot then whispers,");
  quest::say("Who are you and what do you want?");
  }
  }
  }
  if ($text=~/proteri sent me/i) {
  if ($faction <= 1) { # Require ally faction
  if (defined $qglobals{bic} && $qglobals{bic} == 5) {
  quest::emote("looks nervous at the mention of that name and says,");
  quest::say("I'm sorry. I don't know anyone by that name.");
  }
}
}
if ($text=~/ingredients/i) {
  if ($faction <= 1) { # Require ally faction
  if (defined $qglobals{bic} && $qglobals{bic} == 5) {
  quest::say("Creating poisons is distasteful business and I'm afraid the items that go into it are just as distasteful. I need the black bile of a hynid and the yellow bile of a tide feaster from the shores of Natimbi and both a vial of corrosive slime and a mass of insect larva from the sewers beneath us. Once I have these items, I should be able to create an effective poison. Now, you should leave before we're seen.");
  }
  }
  }
}
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 64001 =>1 )) {
    quest::emote("takes the ring and studies it for a moment.");
    quest::say("So the time has finally come. Unfortunately, I have had little success. Our traditional poisons have absolutely no effect on these invaders. They don't even seem to notice the poison. But, there is some hope. I believe I can distill a poison that will affect them if I had the right [ingredients].");
  }
  if (plugin::check_handin(\%itemcount, 64002 =>1, 64003 =>1, 64004 =>1, 64005 =>1 )) {
   if (defined $qglobals{bic} && $qglobals{bic} == 5) {
 quest::emote("takes the ingredients and gets to work. Within a few minutes, she produces a viscous green liquid. Plucking a bunch of fruit from the nearby plant, she coats the fruit in the poison.");
 quest::say("That should do it. I can't be positive that this will do more than give Ixvet an upset stomach, but we can hope. Please take this to Proteri Amari.");
 quest::summonitem(64006);
 }
 }
 plugin::return_items(\%itemcount); 
}