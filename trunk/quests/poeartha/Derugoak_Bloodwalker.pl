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

           quest::spawn2(218040,0,0,483.5,-767.2,37.1,129.1);

           quest::spawn2(218040,0,0,482.1,-894.0,37.1,2.1);

           quest::setnexthpevent(15);

	   }



	

	if ($hpevent == 15) {	

           quest::spawn2(218040,0,0,483.5,-767.2,37.1,129.1);

           quest::spawn2(218040,0,0,482.1,-894.0,37.1,2.1);

           quest::spawn2(218040,0,0,425.6,-831.1,37.1,63.9);	

           quest::spawn2(218040,0,0,538.8,-831.1,37.1,191.6);				

	}

}



sub EVENT_DEATH {

quest::signalwith(218094,1,1);

quest::signalwith(218091,3,1);

}