sub EVENT_SPAWN {
	quest::settimer(1,900);
}

sub EVENT_TIMER {
	quest::depop();
}

sub EVENT_SIGNAL{
	if($signal == 1){
		quest::say("We neither fear you nor seek to be drawn into your dark ways, Lord Sfarosh. You will provide us some information as demanded by the Magistrates of the Loyalist Empire. The questions are simple, answer quickly and the sooner you shall be freed from this summoning. What is your history with the alchemist Valdanov Zevfeer?");
		quest::signalwith(160458,2,5000);
	}
	if($signal == 2){
		quest::say("The circle of containment is breaking down without Ajeea! Prepare yourselves!");
		quest::signalwith(160458,5,5000);
	}
	if($signal == 3){
		quest::say("Eliminate the shades! Selis and I will get Ajeea to safety and concentrate on a ward to prevent any further intrusion and stifle the shades power! Seek me out and bring me the robes of these shades when they have been slain so that we may research placing a more permanent ward against such creatures on the Conlegium.");
		quest::signalwith(160458,6,5000);
		quest::depop();
	}
}

