# Rakshasa Skulls

my $x = $npc->GetX();
 
my $y = $npc->GetY();
 
my $z = $npc->GetZ(); 
 
my $h = $npc->GetHeading();


sub EVENT_WAYPOINT {

#	if($x == 107 && $y == -265) {
#	quest::forcedooropen();	# Door to enter the room


#}
		 
#	if($x == 165 && $y == -233) {
#	quest::pause(60);
#	quest::doanim(36); # Kneel
#	quest::castspell(278); # Spirit of wolf
#	quest::say("Sorry for the delay mistress, I ran into a spot of trouble on the way here. I am prepared to deliver your crate to the spiritualists back home."); # Reporting in.
#	quest::signalwith(160126,2,10000);  # Signal to have Rhorer respond with her first line
	
#}

	if($x == 122 && $y == -264) {
	quest::forcedooropen(); # Open door to leave the room
#	quest::signalwith(160126,6,0000);  # Signal to have Rhorer Shout, Courier is possessed.
	
}


}



sub EVENT_DEATH {

	quest::me("The Vah Shir courier slams the crate of skulls against the ground with unnatural force as he falls jarring it open.");
	quest::me("With his dying breath the possessed courier mutters a dark incantation and the skulls burst from the chest sprouting new skeletal forms.");
#	quest::signalwith(160126,7,15000);
	
	quest::signal(160126,15000); #temporary Signal

}


sub EVENT_SIGNAL {

	quest::depop();
	
#	if($signal == 3) { # Signal to do emote after Rhorer gives the crate over.
	
#	quest::me("A Vah Shir courier tucks the crate of skulls under his arm and nods to Roshawna. Suddenly the courier begins to shake, his fur stands on end, and his eyes glaze over expressionlessly.");
	quest::me("The courier runs for the gates of Katta Castellum with an otherworldly howl echoing in his wake.");


#	if($signal == 4) {
#	quest::resume();
}


#END of FILE Zone:katta  ID:160427 -- A_Vah_Shir_courier.pl