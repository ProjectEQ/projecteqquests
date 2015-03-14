###USAGE EXAMPLES
###Akkadius
###plugin::vtell("message","race-name","sex(malefemale)");
###plugin::vtell("battle","barbarian","male");
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

##plugin::Autovtell("greet/battle/disagree/follow/greet/heal/help/laugh/part/retreat/stop/thanks");
##Automatically converts the race ID and Gender into a format the voicetell object understands
sub Autovtell
{
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


return 1;