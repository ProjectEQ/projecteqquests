sub EVENT_SAY {
		if($text=~/Hail/i) {
			quest::say("Weakling! How dare you approach me.  Access to Lord Marrs temple is reserved only for the honorable!  You will never be [ready]...");
		}

		if($text=~/ready/) {
			quest::say("Be warned, $name, if you believe you are ready, you will fail, even if you can kill Lord Marrs servants!");
			quest::spawn2(211075,0,0,$x,$y,$z,$h); #Ryda`Dar
			quest::depop_withtimer();
		}
}