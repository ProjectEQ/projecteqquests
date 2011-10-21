sub EVENT_SPAWN {
  quest::settimer("follow", 1);
}

sub EVENT_TIMER{
  if ($timer eq "follow"){
    my $OpponentID = 33066;
    my $getmobbynpctype = $entity_list->GetMobByNpcTypeID($OpponentID);
    my $follow_target = $getmobbynpctype->GetID();
    quest::follow($follow_target,10);
    quest::stoptimer("follow");
  }
}

sub EVENT_SIGNAL{
	quest::emote("clicks at Blixkin happily.");
	quest::signal(33066);
}