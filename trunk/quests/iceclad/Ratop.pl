sub EVENT_SIGNAL {
  if ($signal == 1) {
    quest::say("Squawk! Pieces of eight! Pieces of eight!");

    my $mobid = $entity_list->GetMobByNpcTypeID(110053);
    if ($mobid) {
      my $mobnpc = $mobid->CastToNPC();
      $mobnpc->SignalNPC(1);
    }
    else {
      my $mobid = quest::spawn2(110053, 0, 0, $x+9, $y+1, $z, $h);
      my $mob = $entity_list->GetMobID($mobid);
      my $mobnpc = $mob->CastToNPC();
      $mobnpc->SignalNPC(1);
    }
  }
  if ($signal == 2) {
    quest::say("We be out. You'll be needin to make more. Arg!");
  }
}

# Quest by mystic414