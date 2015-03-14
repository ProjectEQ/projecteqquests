sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Hail, there, $race. How goes it? Much fairer than I, I'll wager. Me troops can't hit the broad side of a mammoth with their crossbows. Oh, by the way, I'm Lieutenant Ulfur, Commander of the 23rd Coldain crossbow regiment, if ye kin call it a regiment.");
  }
  if($text=~/regiment/i) {
    quest::say("Yes. we assist our troops in military endeavors. Although we're almost more harm than good. All me troops have soldier envy. They want in the middle of the rumble, face ta face with their enemies stompin them into the ground. That's all well and good but a contingent of crossbowmen can be the difference in winning or losing. Do you favor ranged weapons, $name?");
  } 
  if($text=~/yes/i) { #He responds to yes for this part.
    quest::say("Ahh, well, maybe sometime I'll let ya try out one of our famed crossbows. Maybe even give ye one if ye prove yerself to the Coldain cause. Unfortunately. though. we can spare no crossbows now. Perhaps in the future we will be able to.");
  }
  if($text=~/no/i) { #He responds to no crossbow for this part 
    quest::say("Heh, figures. Almost no one kin fully appreciate the warm feelin' ye get when a bolt ye fired splits the skull of yer adversary. They don't even see it comin'; kinda absolvers yer guilt fer killin' another bein'. Anonymous killin', heheheh.");
  }
}

sub EVENT_WAYPOINT_ARRIVE {
	if($wp==15) {
		quest::emote("yawns and says, 'Well, time fer me ta walk the floor again lads.'");
		quest::signal(115104);
		quest::signal(115206);
		quest::signal(115105);
		quest::signal(115207);
		quest::signal(115107);
		quest::signal(115208);
		quest::signal(115109);
		quest::signal(115110);
		quest::signal(115209);
		quest::signal(115112);
		quest::signal(115113);
		quest::signal(115211);
	}
}

#END of FILE Zone:thurgadina  ID:115103 -- Lieutenant_Ulfur