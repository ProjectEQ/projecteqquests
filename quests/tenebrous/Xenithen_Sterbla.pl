sub EVENT_AGGRO {
	quest::emote("roars a bestial war cry spraying red spittle as flames of rage fill his eyes!");
}

sub EVENT_DEATH {
	quest::emote("goes limp and falls from the air bursting into a cloud of dust upon impact with the ground.");
	quest::signal(172168,1);  #signal for a chance to spawn Heratius Grolden
}
