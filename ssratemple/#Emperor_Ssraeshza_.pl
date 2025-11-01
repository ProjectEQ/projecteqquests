# quests/ssratemple/#Emperor_Ssraeshza_.pl
my $activated = 0;

sub _activate {
  return if $activated;
  $npc->SetSpecialAbility(24, 0); # WILL_NOT_AGGRO off
  $npc->SetSpecialAbility(25, 0); # IMMUNE_AGGRO off
  # hate nudge so he picks a target
  my @clients = $entity_list->GetClientList();
  foreach my $c (@clients) {
    next if !$c;
    if ($c->CalculateDistance($npc->GetX(), $npc->GetY(), $npc->GetZ()) <= 150) {
      $npc->AddToHateList($c, 50);
      last;
    }
  }
  $activated = 1;
}

sub EVENT_SPAWN {
  # spawn locked; controller will unlock
  $npc->SetSpecialAbility(24, 1);
  $npc->SetSpecialAbility(25, 1);
}

sub EVENT_SIGNAL { if ($signal == 1) { _activate(); } }

sub EVENT_DEATH_COMPLETE {
  quest::emote("'s corpse says 'How...did...ugh...'");
  quest::spawn2(162210,0,0,877, -326, 408,385);
  quest::spawn2(162210,0,0,953, -293, 404,385);
  quest::spawn2(162210,0,0,953, -356, 404,385);
  quest::spawn2(162210,0,0,773, -360, 403,128);
  quest::spawn2(162210,0,0,770, -289, 403,128);
}
