#Cost in platinum, customize as desired
our $CostPP = 100;

sub EVENT_SAY {
	if ($text=~/Hail/i) {
		plugin::Whisper("Hello there, $name! I am Valmere the Illusionist. For ${CostPP}pp, I can imbue you with a random appearance that's... MOSTLY temporary. If you'd like one, just say when you're [ready], and brace yourself");
	}
	if ($text=~/ready/i) {
		grant_illusion();
	}
}

sub grant_illusion {

	#Make sure the player has enough plat
	if ($client->GetCarriedMoney() >= $CostPP * 1000) {
		
		#Array of spells IDs that start with Illusion:
		my @illusions = (243,581,582,583,584,585,586,587,588,589,590,591,592,593,594,595,596,597,598,599,600,601,1194,1731,1732,2565,2826,3063,3586,4017,4018,4019,4020,4021,4022,4023,4024,4025,4418,6107,8036,9127,10605,10606,10607,11531,11556,11572,11580,11638,11747,11949,12299,12300,12322,12329
		,12330,12335,12337,12401,12402,12492,12873,12874,12875,12890,12892,12901,12902,12903,12904,12905,12925,12926,12927,12928,12929,12930,12988,13124,13372,13373,13374,13393,13394,13395,14656,14657,14658,15883,15884,15885,16940,17864,17874,18714,18715,18716,20105,20142,20143,20144
		,20157,20158,20159,20160,20535,20536,20537,21624,21625,21626,21628,21923,21962,22999,23015,23016,23022,26895,26966,27033,27701,27702,27703,27704,27705,27706,27707,27708,27709,27710,27711,27712,27713,27714,27715,27716,27717,27718,27719,27720,27721,27722,27723,27724,27725,27726
		,27727,27728,27729,27730,27731,27732,27733,27734,27735,27736,27737,27740,27741,27742,27743,27744,27745,27746,27747,27996,27997,30023,30103,30176,31498,31499,32042,32201,32202,32203,32401,32784,32787,32813,32821,32824,32874,32875,32878,32879,32895,32991,33085,33086,33571,33574
		,33575,33576,33774,33775,33887,33888,33968,33969,33999,36159,36224,37504,37615,37659,37781,37782,37787,37788,37793,37794,37869,37916,37974,37975,37976,37977,38376,38377,38378,38383,38384,38385,38386,38389,38390,38394,38395,38682,38796,38797,38798,38799,38800,38801,38802,38804
		,38805,38811,39028,39280,39282,39283,39284,39285,39286,39287,39288,39289,39290,39291,39292,39293,39526,39527,39528,39529,39530,39531,39532,39533,39534,39620,39621,39622,39623,39624,39855,39907,42281,42282);
		
		# Pick a random illusion
		my $RandomIllusion = $illusions[ int(rand(@illusions)) ];

		#Grant illusion
		quest::selfcast($RandomIllusion);
		
		#Some random quirky phrases to say after casting the illusion
		my @Snarky_Comments = (
			'Yikes… that one came out weirder than I expected. Don’t panic, it wears off. Probably.',
			'Oh! You look… different. Let’s call it ‘unique charm.’',
			'Hah! I haven’t seen that look since the gnome explosion of ’42!',
			'Uh oh… I might’ve mixed up a troll tincture with a glamour spell again.',
			'Wow, that’s definitely not what the scroll said it would do.',
			'Careful — mirrors might fight back if they see you right now.',
			'You’re gonna turn a lot of heads in the bazaar… not sure for the right reasons, though.',
			'Hmm. I was aiming for ‘majestic.’ Got ‘mildly cursed’ instead.',
			'Let’s just say… if there was a beauty contest, you’d win for originality.',
			'Oh dear. Well, look on the bright side — at least you’ll blend in at ogre family reunions!'
		);
		my $RandomComment = $Snarky_Comments[ int(rand(@Snarky_Comments)) ];
		plugin::Whisper($RandomComment);
		
		#Get paid
		$client->TakeMoneyFromPP($CostPP * 1000, 1);
	}
	else {
		plugin::Whisper("I'm sorry but you do not have enough money, $name. Be sure to stop by again when you do!");
	}
}
