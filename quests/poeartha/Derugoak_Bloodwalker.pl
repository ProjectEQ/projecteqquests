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

	if ($hpevent == 50) { 

           quest::spawn2(218040,0,0,$x,$y,$z,$h);

           quest::spawn2(218040,0,0,$x,$y,$z,$h);

           quest::setnexthpevent(15);

	   }



	

	if ($hpevent == 15) {	

           quest::spawn2(218040,0,0,$x,$y,$z,$h);

           quest::spawn2(218040,0,0,$x,$y,$z,$h);

           quest::spawn2(218040,0,0,$x,$y,$z,$h);	

           quest::spawn2(218040,0,0,$x,$y,$z,$h);				

	}

}



sub EVENT_DEATH {

quest::signalwith(218094,1,1);

quest::signalwith(218091,3,1);

}