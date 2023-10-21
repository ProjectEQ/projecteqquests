my $partone = 0;

sub EVENT_SPAWN {
  quest::set_proximity($x-25,$x+25,$y-25,$y+25, -999999, 999999, 1);
  quest::enable_proximity_say();
}

sub EVENT_PROXIMITY_SAY {
  if ($text=~/yo ho. no sun!!/i) {
    $partone = 1;
  }
  elsif ($text=~/a skeleton's day is never done./i && $partone == 1) {
    $client->Message(1,"Your voice echoes nicely from the walls.");
    $start = $entity_list->GetMobByNpcTypeID(38139);
    if ($start) {
      $moving = $start->CastToNPC();
      $moving->SignalNPC(1);
      $partone = 0;
    }
  }
  else {
    $partone = 0;
  }
}