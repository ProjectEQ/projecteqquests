#Usage: plugin::Whisper("Message");

sub Whisper {
	my $TextColor = 315;	#Set the Text Color for the Message (this one is beige)
	my $npc = plugin::val('$npc');
	my $client = plugin::val('$client');
	my $MyMessage = $_[0];	#Use the Message Supplied to the Function - "$_[0]" means to use the first argument given
	
	if ($client) {
		#$client->Message($TextColor, "-");	#Spacer between Text messages to make them easier to read
		my $NPCName = $npc->GetCleanName();	#Get the clean name of the NPC sending the message
		$client->Message($TextColor, "$NPCName whispers, '$MyMessage'");	#Send a message to the player simulating a whisper directly to them from the NPC
	}
}

return 1;	#always leave this line at the end of the script_function.pl file as it is needed by require()