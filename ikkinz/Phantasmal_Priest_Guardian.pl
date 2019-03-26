#     Phantasmal_Priest_Guardian.pl
# 294610
sub EVENT_DEATH_COMPLETE {
	 quest::ze(0,"Phantasmal Priest Guardian's corpse cannot sustain itself anymore and crashes to the ground");
	 quest::signalwith(294614,1,0); # NPC: #Trigger_Ikkinz_4
}