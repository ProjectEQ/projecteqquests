sub EVENT_SPAWN {
  my $rClient = $entity_list->GetRandomClient($x,$y,$z, 1500);
  if ($rClient) {
    $rClient->Message(15,"The thoughts of a cursed trusik invade your mind, 'You will share my fate. Do not attempt to resist. I am coming for you.'");
    quest::attack($rClient->GetName());
  }
}

sub EVENT_SLAY {
  quest::depop();
}