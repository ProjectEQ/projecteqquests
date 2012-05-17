# Ink of the dark - enchanter epic lead in quest

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 10626 => 1)) {
    quest::say("Crroooaak! Crrroooooaaakk!");
    quest::summonitem(10601);
    quest::exp(10000);
  }
  else {
    plugin::return_items(\%itemcount);
  }
}

# EOF zone: gukbottom ID: 66170 NPC: a_ghoul_scribe