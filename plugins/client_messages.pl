#::: Usage: plugin::Whisper("Message");
#::: Author: Trevius from Stormhaven
#::: Wiki: http://wiki.eqemulator.org/p?Perl_Plugins_Master_Reference#pluginwhisperquotmessagequot

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

#::: Usage: plugin::ClientSay("Message", "Message2", "Message3"); 
#::: If Multiple arguments are supplied, it will return a random message from the list.
#::: If any of the arguments is a number, it will parse that number as the color to use for the TextColor of the message
#::: Author: Akkadius
#::: Wiki: http://wiki.eqemulator.org/p?Perl_Plugins_Master_Reference#pluginclientsayquotmessagequot-quotmessage2quot-quotmessage3quotnbsp

sub ClientSay{
	my $TextColor = 315;	#Set the Text Color for the Message (this one is beige)
	my $npc = plugin::val('$npc');
	my $client = plugin::val('$client');
	if ($client) {
		my $NPCName = $npc->GetCleanName();	#Get the clean name of the NPC sending the message
		#$client->Message($TextColor, " "); ###Gives a blank space in between messages
		$n = 0; $UseFirstMessage = -1;
		while($_[$n]){ $n++; if($_[$n] > 0){ $TextColor = $_[$n]; $UseFirstMessage = 1; } } $MyMessage = $_[int(rand($n))];
		if($UseFirstMessage == 1){ $MyMessage = $_[0]; }
		$client->Message($TextColor, "$NPCName says, '$MyMessage'");	#Send a message to the player simulating a whisper directly to them from the NPC
	}
}

#::: Author: Akkadius
#::: Usage: plugin::MM("Message"); 
#::: Will display a Marquee message on the screen
#::: Wiki: http://wiki.eqemulator.org/p?Perl_Plugins_Master_Reference#pluginmmquotmessagequot
sub MM{
	my $client = plugin::val('$client');
	$Text = $_[0];
	my ($client_mess) = $Text =~ s/clientmessage//g;
	my ($instant) = $Text =~ s/instant//g;
	if($instant){ $client->SendMarqueeMessage(15, 510, 1, 1, 3000,  $Text);  }
	else{ $client->SendMarqueeMessage(15, 510, 1, 100, 3000,  $Text); }
	if($client_mess){ $client->Message(15, $Text); }
} 

#::: Usage: plugin::vtell("greetname", "racename", "sex") - See plugin subroutine for options...
#::: Author: Akkadius

sub vtell{
	my ($GreetName, $RaceName, $Sex) = ($_[0], $_[1], $_[2]);
	my $name = plugin::val('$name');
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
	quest::voicetell($name, $GreetId{$GreetName}, $RaceID{$RaceName}, $SexName{$Sex});
}

#::: Usage: plugin::Autovtell("greet/battle/disagree/follow/greet/heal/help/laugh/part/retreat/stop/thanks");
#::: Author: Akkadius
#::: Description: Automatically converts the race ID and Gender into a format the voicetell object understands
sub Autovtell{
	my $GreetName = $_[0];
	my $npc = plugin::val('$npc');
	my $GetGender = $npc->GetGender();
	my $GetRace = $npc->GetRace();
	
	%GreetId2 = (
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
	
	%RaceID2 = (
		1 => 0,
		2 => 1,
		3 => 2,
		4 => 3,
		5 => 4,
		6 => 5,
		7 => 6,
		8 => 7,
		9 => 8,
		10 => 9,
		11 => 10,
		12 => 11,
		128 => 12,
		130 => 15,
		330 => 13,
	);
	
	%Gender = (
		0 => 2,
		1 => 3,
	);
	
	my $name = plugin::val('$name');
	quest::voicetell($name, $GreetId2{$GreetName}, $RaceID2{$GetRace}, $Gender{$GetGender});
}


return 1;	#always leave this line at the end of the script_function.pl file as it is needed by require()

