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

sub vtell
{
	my $GreetName = $_[0];
	my $RaceName = $_[1];
	my $Sex = $_[2];
	%GreetId = (
		"agree" => 1,
		"battle" => 2,
		"disagree" => 3,
		"follow" => 4,
		"greet" => 5,
		"heal" => 6,
		"help" => 7,
		"laugh" => 8,
		"part" => 9,
		"retreat" => 10,
		"stop" => 11,
		"thanks" => 12,
	);
		%RaceID = (
		"human" => 0,
		"barbarian" => 1,
		"erudin" => 2,
		"woodelf" => 3,
		"highelf" => 4,
		"darkelf" => 5,
		"halfelf" => 6,
		"dwarf" => 7,
		"troll" => 8,
		"ogre" => 9,
		"halfling" => 10,
		"gnome" => 11,
		"iksar" => 12,
		"froglok" => 13,
		"vahshir" => 15,
	);
		%SexName = (
		"male" => 2,
		"female" => 3,
	);
	my $name = plugin::val('$name');
	quest::voicetell($name, $GreetId{$GreetName}, $RaceID{$RaceName}, $SexName{$Sex});
}

return 1;	#always leave this line at the end of the script_function.pl file as it is needed by require()