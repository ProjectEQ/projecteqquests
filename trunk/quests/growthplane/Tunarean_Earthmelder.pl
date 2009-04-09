sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hail, my friend. Unfortunately I cannot talk right now. The giants must be dealt with.");
  }
  if ($text=~/giants/i) {
    quest::say("The giants are continuing to put forth efforts to encroach the lands blessed by Tunare. We need an outrider or preserver to aid us in our continued fight.");
  }
  if ($text=~/preserver/i) {
    quest::say("Noble preserver, you will be needed to combat the priests of the warbringer. Scouts have reported three priests wandering the Wakening Lands in search of a site to build a shrine to their god. Seek them out, kill them, and bring their heads and those of anyone else involved.");
  }
  if ($text=~/outrider/i) {
    quest::say("We have need of you to disrupt the construction efforts of the giants in the Wakening Land. Find the frost giant overseer, kill him and any others that are responsible for the building and bring back their heads.");
  }
}

sub EVENT_ITEM {
  # Gloves of Earthcrafting
  if (plugin::check_handin(\%itemcount, 31424 => 1, 31425 => 1, 31426 => 1, 31423 => 1)) {
    quest::summonitem(1208);
  }
  # Helm of the Tracker
  elsif (plugin::check_handin(\%itemcount, 31419 => 1, 31420 => 1, 31421 => 1, 31422 => 1)) {
    quest::summonitem(1207);
  }
  else {
    quest::say("I have no need of these, friend."); # text made up
    plugin::return_items(\%itemcount);
    return 1;
  }
  quest::say("You have done well, $name.  Here, take this item and use it well! Your efforts will not be forgotten.");
  quest::exp(1000);
}

# Quest by mystic414