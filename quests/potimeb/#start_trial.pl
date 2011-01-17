#This guy is required to only allow the phase 1 timer to be started once.

sub EVENT_SIGNAL {
	if ($signal == 23){
		quest::signalwith(223177,33,0);
		quest::depop();
	}
	if ($signal == 66){
		quest::depop();
	}
}