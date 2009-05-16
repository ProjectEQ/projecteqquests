#Triloun Vaporfiend
#Signals coirnav_controller on death to look for more of me to decide if the first 3 waves are over.

sub EVENT_DEATH {

	quest::signalwith(216048,8,0);


}