sub EVENT_SPAWN {

quest::settimer(31,3600);

quest::setnexthpevent(50);

}



sub EVENT_TIMER {

if($timer == 31) {

quest::depop();

quest::stoptimer(31);

}

}

sub EVENT_HP {

	if ($hpevent == 50) { # Spawn 2 A_Mangled_Vegerog

           quest::spawn2(218023,0,0,$x,$y,$z,$h);

           quest::spawn2(218023,0,0,$x,$y,$z,$h);

           quest::setnexthpevent(15);

	   }



	

	if ($hpevent == 15) {	# Spawn 4 A_Mangled_Vegerog

           quest::spawn2(218023,0,0,$x,$y,$z,$h);

           quest::spawn2(218023,0,0,$x,$y,$z,$h);

           quest::spawn2(218023,0,0,$x,$y,$z,$h);	

           quest::spawn2(218023,0,0,$x,$y,$z,$h);				

	}

}



sub EVENT_DEATH_COMPLETE {

quest::signalwith(218094,1,1);

quest::signalwith(218091,3,1);

quest::depopall(218023); # Depop all A_Mangled_Vegerog
}