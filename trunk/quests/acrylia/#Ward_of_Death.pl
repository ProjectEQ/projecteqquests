# Khati Sha Event
# Created by Gonner

sub EVENT_SPAWN {
	quest::settimer(7,60);
	quest::settimer(8,2100);
	quest::spawn2(154150,0,0,433.60,-357.44,36.13,260); # A_Sacrafice
	quest::spawn2(154149,0,0,385.78,-298.13,36.13,260); # A_Sacrafice
	quest::spawn2(154148,0,0,433.60,-236.54,36.13,260); # A_Sacrafice
}

sub EVENT_TIMER {
	if($timer == 7) {
		quest::spawn2(154150,462018,0,433.60,-357.44,36.13,260); # A_Sacrafice
		quest::spawn2(154149,462019,0,385.78,-298.13,36.13,260); # A_Sacrafice
		quest::spawn2(154148,462020,0,433.60,-236.54,36.13,260); # A_Sacrafice
	}

	if($timer == 8) {
		quest::stoptimer(7);
		quest::stoptimer(8);
		quest::signalwith(154130,5,10);
		quest::depop();
	}

}

sub EVENT_DEATH {
	quest::stoptimer(7);
quest::stoptimer(8);
	quest::signalwith(154130,1,10);
}

#END of FILE zone:acrylia ID:154155 -- #Ward_of_Death.pl

