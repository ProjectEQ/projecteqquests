# Emperor Ssraeshza trigger
#
sub EVENT_SIGNAL {
	quest::depop();
}

sub EVENT_DEATH {
  quest::signalwith(162065,99,0);
}

#EOF zone: ssratemple ID: 162064 NPC: #Ssraeshzian_Blood_Golem

