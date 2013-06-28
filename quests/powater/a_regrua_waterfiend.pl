#Regura waterfiend
#Signals coirnav_controller on death to look for more of me to decide if the first 3 waves are over.

sub EVENT_DEATH_COMPLETE {

	quest::signalwith(216107,4,0);


}
