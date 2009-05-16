sub EVENT_ENTERZONE {
    if($status < 80) { # If you are not a GM/Guide, then you will be kicked if the coirnav event fails.
        quest::settimer("PoKkickout",15); # You have 15 seconds to comply.
    }
}

sub EVENT_TIMER {
    my $RoCeventchk = $qglobals{coirnav_kick};
    if($RoCeventchk == 100) {  # Player kickout signalled from Coirnav Event
        quest::movepc(202,1456,-1,-100); # I am now authorised the use of lethal force.
    }
}