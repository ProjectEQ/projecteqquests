my $instid;

sub EVENT_AGGRO {
	$instid = quest::GetInstanceID('inktuta',0); #get the instance id
}
	
sub EVENT_DEATH_COMPLETE {
	quest::crosszonemessageplayerbyname(5, "GMBobaski", "Inktuta Nijacka Dead. InstID: $instid");
	quest::emote("grasps at his throat as he chokes out a few final words");
	quest::say("I foresaw this. My death. Our deaths. We are all going to perish!");
}