# warmly glowing stone quest -- ranger epic
#

sub EVENT_SAY {
  if ($text=~/are you one such as myself/i) {
    quest::emote("stares at you and whispers. 'You must be the one that has been spoken of. Yes, yes I am one of the circle. There are many of us in the lands right now, all seeking answers to the ills that have befallen our homes.'");
  }
  if ($text=~/answers/i) {
    quest::say("I have heard whispers of new Iksar movements in the land. The name of Venril Sathir is on the scaled lips and sharp tongues of every cold blooded lizard in this place.");
  }
  if ($text=~/venril sathir/i) {
    quest::say("All I've heard are whispers of connections between the undead lizards and the dark god of hate. There's some kind of history behind the two. It might be that Venril is the main focus of Innoruuk's will in the land. Then again, maybe not, but this is the best we've gotten so far. If you think you can do it, then find him and remove him from the face of this earth. Bring me the half of the stone I know you have and whatever conduit of power you find on his rotting corpse.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 20462 => 1, 20461 => 1)) {
    quest::emote("blinks and carefully takes the stones from you, cautiously scratching the jagged green stone against the other. Its skin seems to shiver and flake at the contact and eventually begins to shine brightly. 'With the gem nature's balance is complete. Take the stone and walk your path. Blade or lightning caller, burning sword or the mother's walk.'");
    quest::summonitem(20468);
  }
  else {
    quest::emote("will not take this item.");
    plugin::return_items(\%itemcount);
  }
}

# EOF zone: firiona ID: 84207 NPC: Foloal_Stormforest

