sub EVENT_SAY {
		if($text=~/Hail/i && $dragon == undef) {
			quest::say("Weakling! How dare you approach me.  Access to Lord Marrs temple is reserved only for the honorable!  You will never be [ready]...");
		}

		if($text=~/ready/ && $dragon == undef) {
			quest::say("Be warned, $name, if you believe you are ready, you will fail, even if you can kill Lord Marrs servants!");
			$dragon=1;
			quest::settimer(1,7200);
			quest::spawn2(211075,0,0,$x,$y,$z,$h);
			quest::depop();
		}
}

sub EVENT_TIMER {
if($timer == 1) {
$dragon=undef;
}
}