sub EVENT_SAY {

	if($text=~/Hail/i && $maiden == undef) {
		quest::say("Weakling! How dare you approach me.  Access to Lord Marrs temple is reserved only for the honorable!  You will never be [ready]...");
		}

	if($text=~/ready/ && $maiden == undef) {
		quest::say("Be warned, $name, if you believe you are ready, you will fail, even if you can kill Lord Marrs servants!");
		$maiden=1;
		quest::settimer(1,7200);
		quest::spawn2(211076,0,0,($x - 50),$y,$z,$h);
		quest::signalwith(211081,4,1);
		}
	}






sub EVENT_TIMER {

	if($timer == 1) {
		$maiden=1;
		quest::stoptimer(1);	
		}	
	}