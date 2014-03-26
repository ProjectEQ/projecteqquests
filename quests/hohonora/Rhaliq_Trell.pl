sub EVENT_SAY {
		if($text=~/Hail/i) {
			quest::say("Weakling! How dare you approach me.  Access to Lord Marrs temple is reserved only for the honorable!  You will never be [ready]...");
		}

		if($text=~/ready/i) {
			quest::say("Be warned, $name, if you believe you are ready, you will fail, even if you can kill Lord Marrs servants!");
			quest::spawn2(211088,0,0,526,1375,-115,$h);
			quest::depopwithtimer();
		}
}