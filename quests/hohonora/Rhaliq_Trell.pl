sub EVENT_SAY {
		if($text=~/Hail/i && $villager == undef) {
			quest::say("Weakling! How dare you approach me.  Access to Lord Marrs temple is reserved only for the honorable!  You will never be [ready]...");
		}

		if($text=~/ready/i && $villager == undef) {
			quest::say("Be warned, $name, if you believe you are ready, you will fail, even if you can kill Lord Marrs servants!");
			$villager=1;
			quest::settimer(1,14400);
			quest::spawn2(211088,0,0,526,1375,-115,$h);
		}

                if($text=~/hail/i && $flag == 1) {
                        quest::say("Congratulations... Two other trials and you may have proven yourself worthy to stand before Lord Marr.");
                    	quest::setglobal("pop_hoh_trell", 1, 5, "F");
	                $client->Message(4,"You receive a character flag!");
                         }
}

sub EVENT_SIGNAL {
if($signal == 8) {
quest::settimer(9,600);
quest::shout("Clever ones you are!");
$flag=1;
}}


sub EVENT_TIMER {
if($timer == 1) {
$villager=undef;
}

if($timer == 9) {
$flag=undef;
}
}