#Nrinda_of_Ice

sub EVENT_DEATH_COMPLETE {
	quest::signalwith(216107,2,0); #Signal coirnav_controller we died
}

sub EVENT_COMBAT {
    if($combat_state == 0) {
        quest::stop()
    }
}