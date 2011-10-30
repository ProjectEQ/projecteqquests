sub EVENT_COMBAT {
	if($combat_state==1) {
		quest::say("<BBAAaaaaarrrkkk!!>  Your head will make an RRRex-rrex-excellent addition to my collection!");
	}
}

sub EVENT_DEATH {
	quest::say("This act ag-GRRR-grr-ainst the Splitpaws will not go without retribution.. mark.. my.. words..");
}