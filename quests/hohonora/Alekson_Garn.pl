
sub EVENT_SAY {
	if($text=~/hail/i) {
		quest::say("Weakling! How dare you approach me. Access to Lord Marrs temple is reserved only for the honorable! You will never be [ready]...");
	}
	if($text=~/ready/i) {
		quest::say("Be warned, $name. If you believe you are ready, you will fail, even if you can kill Lord Marr's servants!");
		quest::spawn2(211076,0,0,($x - 50),$y,$z,$h); # A_Custodian_of_Marr_
		quest::signalwith(211081,4,1);
		quest::depopwithtimer();
	}
}