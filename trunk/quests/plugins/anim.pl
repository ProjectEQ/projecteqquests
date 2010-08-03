sub DoAnim {
	###Usage: plugin::DoAnim(salute);
	my $client = plugin::val('$client');
	my $text = $_[0];
		%Animlist = (
		"kick" => 1,
		"pierce" => 2,
		"2hslash" => 3,
		"2hblunt" => 4,
		"2hpierce" => 4,
		"throw" => 5,
		"offhand" => 6,
		"bash" => 7,
		"mainhand" => 8,
		"bow" => 9,
		"swim" => 10,
		"roundkick" => 11,
		"gethit" => 12,
		"gethit2" => 13,
		"falling" => 14,
		"drowning" => 15,
		"death" => 16,
		"standby" => 17,
		"standby2" => 18,
		"lunge" => 19,
		"jump" => 20,
		"falling2" => 21,
		"duckwalk" => 22,
		"ladderclimb" => 23,
		"crouch" => 24,
		"swim2" => 25,
		"idle" => 26,
		"cheer" => 27,
		"disgusted" => 28,
		"wave" => 29,
		"rude" => 30,
		"yawn" => 31,
		"movetoside" => 33,
		"iceslide" => 35,
		"kneel" => 36,
		"swim3" => 37,
		"sit" => 38,
		"cast" => 42,
		"cast2" => 43,
		"cast3" => 44,
		"flykick" => 45,
		"tigerclaw" => 46,
		"eaglestrike" => 47,
		"nodyes" => 48,
		"shakeno" => 49,
		"plead" => 50,
		"clap" => 51,
		"blush" => 52,
		"chuckle" => 54,
		"headtilt" => 57,
		"dance" => 58,
		"disagree" => 59,
		"glare" => 60,
		"peer" => 61,
		"kneel" => 62,
		"laugh" => 63,
		"point" => 64,
		"shrug" => 65,
		"handraise" => 66,
		"salute" => 67,
		"shiver" => 68,
		"tapfoot" => 69,
		"bowto" => 70,
		);
			quest::doanim($Animlist{$text});
}

	sub SetAnim {
		##Usage: plugin::SetAnim(sit);
		my $npc = plugin::val('$npc');
		my $SetAnimVal = $_[0];
			%SetAnimList = (
			"stand" => 0,
			"sit" => 1,
			"duck" => 2,
			"dead" => 3,
			"kneel" => 4,
			);
				$npc->SetAppearance($SetAnimList{$SetAnimVal}); 
	}
return 1;