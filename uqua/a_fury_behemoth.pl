my $instid = 0;

sub EVENT_SPAWN {
  quest::emote("strides forward to deal with its enemies.");
}

sub EVENT_AGGRO {
	$instid = quest::GetInstanceID('uqua',0);
}

sub EVENT_DEATH_COMPLETE {
  quest::setglobal($instid."_uquafurydoor",1,3,"H6");
}