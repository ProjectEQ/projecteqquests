#Agent_of_The_Tribunal.pl
#All Trials
#Kilelen
   
sub EVENT_SAY {
	if ($text =~ /Hail/i) {
		quest::say("Do you wish to [return]?");
	}
	
	#elsif ($text =~ /return/) {
	#	quest::say("The trial is currently underway.");
	#}
	
	elsif($text =~ /return/) {
		quest::say("Very well.");
		quest::movepc(201,456,825,9);
	}
 }