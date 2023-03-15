# This script should be attached to an NPC who will accept a class-specific armor and return the matching item from the other class
#kunark:thurg:kael:skyshrine:hate:fear:growth:ornate:elemental:qvic:oowt1:oowt2:

my %armor = (
				#Cleric
				2 =>     {
							#Head
							4 =>      [ 4564,31042,25391,31140,4881,-1,25493,9826,9827,67720,70748,70860 ],
							#Arms
							128 =>    [ 4566,31044,25393,31142,4883,-1,25495,11499,32012,68856,70749,70861 ],
							#Bracer
							1536 =>   [ 4567,31045,25394,31143,4884,-1,25496,11198,11199,68859,70750,70862 ],
							#Hands
							4096 =>   [ 4568,31046,25395,31144,4885,-1,25497,13557,13563,68857,70751,70863 ],
							#Feet
							524288 => [ 4570,31048,25397,31146,4887,-1,25499,20073,20074,68858,70752,70864 ],
							#Legs
							262144 => [ 4569,31047,25396,31145,4886,-1,25498,16795,16797,68963,70754,70866 ],
							#Chest
							131072 => [ 4565,31043,25392,31141,4882,-1,25494,15770,47646,68962,70753,70865 ]
				},
				#Paladin
				4 =>     {
							#Head
							4 =>      [ 4543,31021,25370,31119,31814,4851,-1,9811,9812,67721,70755,70867 ],
							#Arms
							128 =>    [ 4545,31023,25372,31121,31816,4853,-1,11437,11438,68861,70756,70868 ],
							#Bracer
							1536 =>   [ 4546,31024,25373,31122,31817,4854,-1,11159,11163,68864,70757,70869 ],
							#Hands
							4096 =>   [ 4547,31025,25374,31123,31818,4855,-1,12626,12627,68862,70758,70870 ],
							#Feet
							524288 => [ 4549,31027,25376,31125,31820,4857,-1,19448,19449,68863,70759,70871 ],
							#Legs
							262144 => [ 4548,31026,25375,31124,31819,4856,-1,16755,16757,68965,70761,70873 ],
							#Chest
							131072 => [ 4544,31022,25371,31120,31815,4852,-1,15751,47644,68964,70760,70872 ]
                },
				#Ranger
				8 =>      {
							#Head
							4 =>      [ 4536,31014,25363,31112,31800,4891,-1,9820,9821,67725,70762,70874 ],
							#Arms
							128 =>    [ 4538,31016,25365,31114,31802,4893,-1,11446,11447,68881,70763,70875 ],
							#Bracer
							1536 =>   [ 4539,31017,25366,31115,31803,4894,-1,11180,11193,68884,70764,70876 ],
							#Hands
							4096 =>   [ 4540,31018,25367,31116,31804,4895,-1,12666,12816,68882,70765,70877 ],
							#Feet
							524288 => [ 4542,31020,25369,31118,31806,4897,-1,19837,19838,68883,70766,70878 ],
							#Legs
							262144 => [ 4541,31019,25368,31117,31805,4896,-1,16775,16777,68973,70768,70880 ],
							#Chest
							131072 => [ 4537,31015,25364,31113,31801,4892,-1,15764,47647,68972,70767,70879 ]
                },
				#Shadow Knight
				16 =>    {
							#Head
							4 =>      [ 4522,31000,25349,31098,-1,4841,25451,9814,9815,68865,70769,70881 ],
							#Arms
							128 =>    [ 4524,31002,25351,31100,-1,4843,25453,11440,11441,68866,70770,70882 ],
							#Bracer
							1536 =>   [ 4525,31003,25352,31101,-1,4844,25454,11172,11173,68869,70771,70883 ],
							#Hands
							4096 =>   [ 4526,31004,25353,31102,-1,4845,25455,12629,12637,68867,70772,70884 ],
							#Feet
							524288 => [ 4528,31006,25355,31104,-1,4847,25457,19545,19546,68868,70773,70885 ],
							#Legs
							262144 => [ 4527,31005,25354,31103,-1,4846,25456,16761,16763,68967,70775,70887 ],
							#Chest
							131072 => [ 4523,31001,25350,31099,-1,4842,25452,15758,47645,68966,70774,70886 ]
                },
				#Druid
				32 =>    {
							#Head
							4 =>      [ 4571,31049,25398,31147,3801,31807,-1,9832,9833,67729,70776,70888 ],
							#Arms
							128 =>    [ 4573,31051,25400,31149,3803,31809,-1,11549,11575,68901,70777,70889 ],
							#Bracer
							1536 =>   [ 4574,31052,25401,31150,3804,31810,-1,11280,11281,68904,70778,70890 ],
							#Hands
							4096 =>   [ 4575,31053,25402,31151,3805,31811,-1,13589,13603,68902,70779,70891 ],
							#Feet
							524288 => [ 4577,31055,25404,31153,3807,31813,-1,20152,20422,68903,70780,70892 ],
							#Legs
							262144 => [ 4576,31054,25403,31152,3806,31812,-1,16809,16811,68981,70782,70894 ],
							#Chest
							131072 => [ 4572,31050,25399,31148,3802,31808,-1,15776,47651,68980,70781,70893 ]
                },
				#Shaman
				512 =>   {
							#Head
							4 =>      [ 4529,31007,25356,31105,4871,-1,25458,9829,9830,68885,70804,70916 ],
							#Arms
							128 =>    [ 4531,31009,25358,31107,4873,-1,25460,11518,11529,68886,70805,70917 ],
							#Bracer
							1536 =>   [ 4532,31010,25359,31108,4874,-1,25461,11273,11278,68889,70806,70918 ],
							#Hands
							4096 =>   [ 4533,31011,25360,31109,4875,-1,25462,13569,13579,68887,70807,70919 ],
							#Feet
							524288 => [ 4535,31013,25362,31111,4877,-1,25464,20077,20078,68888,70808,70920 ],
							#Legs
							262144 => [ 4534,31012,25361,31110,4876,-1,25463,16801,16803,68975,70810,70922 ],
							#Chest
							131072 => [ 4530,31008,25357,31106,4872,-1,25459,15773,47649,68974,70809,70921 ]
                },
				#Necromancer
				1024 =>  {
							#Head
							4 =>      [ -1,31063,25412,31161,-1,1232,25514,9946,9947,67733,70811,70923 ],
							#Arms
							128 =>    [ -1,31065,25414,31163,-1,1234,25516,11600,11618,68921,70812,70924 ],
							#Bracer
							1536 =>   [ -1,31066,25415,31164,-1,1235,25517,11305,11306,68924,70813,70925 ],
							#Hands
							4096 =>   [ -1,31067,25416,31165,-1,1236,25518,13622,13623,68922,70814,70926 ],
							#Feet
							524288 => [ -1,31069,25418,31167,-1,1238,25520,20430,20431,68923,70815,70927 ],
							#Legs
							262144 => [ -1,31068,25417,31166,-1,1237,25519,19023,19024,68991,70817,70929 ],
							#Chest
							131072 => [ -1,31064,25413,31162,-1,1233,25515,15785,47653,68990,70816,70928 ]
                },
				#Magician
				4096 =>  {
							#Head
							4 =>      [ -1,31070,25419,31168,1239,-1,25521,9908,9944,67732,70825,70937 ],
							#Arms
							128 =>    [ -1,31072,25421,31170,1241,-1,25523,11597,11598,68916,70826,70938 ],
							#Bracer
							1536 =>   [ -1,31073,25422,31171,1242,-1,25524,11302,11303,68919,70827,70939 ],
							#Hands
							4096 =>   [ -1,31074,25423,31172,1243,-1,25525,13618,13619,68917,70828,70940 ],
							#Feet
							524288 => [ -1,31076,25425,31174,1245,-1,25527,20427,20428,68918,70829,70941 ],
							#Legs
							262144 => [ -1,31075,25424,31173,1244,-1,25526,19000,19021,68987,70831,70943 ],
							#Chest
							131072 => [ -1,31071,25420,31169,1240,-1,25522,15782,47655,68986,70830,70942 ]
                },
				#Enchanter
				8192 =>  {
							#Head
							4 =>      [ -1,31077,25426,31175,1246,-1,25528,9835,9836,67734,70832,70944 ],
							#Arms
							128 =>    [ -1,31079,25428,31177,1248,-1,25530,11577,11578,68926,70833,70945 ],
							#Bracer
							1536 =>   [ -1,31080,25429,31178,1249,-1,25531,11283,11298,68929,70834,70946 ],
							#Hands
							4096 =>   [ -1,31081,25430,31179,1250,-1,25532,13613,13614,68927,70835,70947 ],
							#Feet
							524288 => [ -1,31083,25432,31181,1252,-1,25534,20424,20425,68928,70836,70948 ],
							#Legs
							262144 => [ -1,31082,25431,31180,1251,-1,25533,16815,16931,68989,70838,70950 ],
							#Chest
							131072 => [ -1,31078,25427,31176,1247,-1,25529,15779,47656,68988,70837,70949 ]
                },
				#Beastlord
				16384 => {
							#Head
							4 =>      [ 5460,5453,5439,5446,-1,7835,5467,9823,9824,67730,70839,70951 ],
							#Arms
							128 =>    [ 5462,5455,5441,5448,-1,7834,5469,11449,11450,68906,70840,70952 ],
							#Bracer
							1536 =>   [ 5463,5456,5442,5449,-1,7817,5470,11195,11196,68909,70841,70953 ],
							#Hands
							4096 =>   [ 5464,5457,5443,5450,-1,7832,5471,13545,13553,68907,70842,70954 ],
							#Feet
							524288 => [ 5466,5459,5445,5452,-1,7818,5473,20000,20032,68908,70843,70955 ],
							#Legs
							262144 => [ 5465,5458,5444,5451,-1,7819,5472,16783,16787,68983,70845,70957 ],
							#Chest
							131072 => [ 5461,5454,5440,5447,-1,7833,5468,15767,47652,68982,70844,70956 ]
                } 
			);

@fallback = (54384,54385,54386,54387,);

sub EVENT_SAY {	
	my $charKey = $client->CharacterID() . "-ArmorSwap";
	if ($text=~/hail/i) {
		plugin::NPCTell( "Hail yourself, $class. I'm the head armorsmith in the Reach, and I'm far too busy to deal with every trifling concern. Unless you have [".quest::saylink("class armor",1)."] for my collection, go talk to one of my underlings instead of bothering me.");
	} elsif ($text=~/class armor/i) {
		plugin::NPCTell( "Indeed. I collect and trade class-specific armors from all over Norrath and associated realms. I know that adventurers such as yourself often collect such treasures and have little use for those designed for a class other than their own or their companion's. If you bring me such equipment, either to [".quest::saylink("sell",1)."] or to [".quest::saylink("trade",1)."], then we have something to talk about.");
	} elsif ($text=~/trade/i) {
		plugin::NPCTell( "Simply tell me which class you'd like to trade your armor for, and then hand me the equipment, and we can make the exchange. Remember, I only accept class-specific set armor, and will only exchange for gear of similar power, and it will also [".quest::saylink("cost you some platinum",1)."] for the trouble.");
	} elsif ($text=~/cost you some platinum/i) {
		plugin::NPCTell( "I charge 2,000pp to exchange items from Sebilis, Karnor's Keep, Kael, the Temple of Veeshan, or the planes of Hate, Fear, and Growth. 6,000pp for armors from all other planes except the Elementals, which will cost you 10,000pp. Muramite armor from Taelosia will cost you 20,000pp, and the high-quality armors from Discord will cost you 40,000pp to exchange");
	}  elsif ($text=~/sell/i) { 
		plugin::NPCTell( "You are here to sell, I understand. The prices I offer vary, and I won't know for sure until you hand me the item, but you'll get a fair deal. Just hand it over and I'll appraise it");
		quest::set_data($charKey, -1, 1800);
	} elsif ($text=~/cleric/i) {
		plugin::NPCTell( "You are here for Cleric equipment, I understand. Hand over what you have, and I'll see what I can scrounge up for you.");
		quest::set_data($charKey, 2, 1800);
	}  elsif ($text=~/paladin/i) {
		plugin::NPCTell( "You are here for Paladin equipment, I understand. Hand over what you have, and I'll see what I can scrounge up for you.");
		quest::set_data($charKey, 4, 1800);
	}  elsif ($text=~/shadowknight/i) {
		plugin::NPCTell( "You are here for Shadow Knight equipment, I understand. Hand over what you have, and I'll see what I can scrounge up for you.");
		quest::set_data($charKey, 16, 1800);
	}  elsif ($text=~/ranger/i) {
		plugin::NPCTell( "You are here for Ranger equipment, I understand. Hand over what you have, and I'll see what I can scrounge up for you.");
		quest::set_data($charKey, 8, 1800);
	}  elsif ($text=~/shaman/i) {
		plugin::NPCTell( "You are here for Shaman equipment, I understand. Hand over what you have, and I'll see what I can scrounge up for you.");
		quest::set_data($charKey, 512, 1800);
	}  elsif ($text=~/druid/i) {
		plugin::NPCTell( "You are here for Druid equipment, I understand. Hand over what you have, and I'll see what I can scrounge up for you.");
		quest::set_data($charKey, 32, 1800);
	}  elsif ($text=~/beastlord/i) {
		plugin::NPCTell( "You are here for Beastlord equipment, I understand. Hand over what you have, and I'll see what I can scrounge up for you.");
		quest::set_data($charKey, 16384, 1800);
	}  elsif ($text=~/enchanter/i) {
		plugin::NPCTell( "You are here for Enchanter equipment, I understand. Hand over what you have, and I'll see what I can scrounge up for you.");
		quest::set_data($charKey, 8192, 1800);
	}  elsif ($text=~/magician/i) {
		plugin::NPCTell( "You are here for Magician equipment, I understand. Hand over what you have, and I'll see what I can scrounge up for you.");
		quest::set_data($charKey, 4096, 1800);
	}  elsif ($text=~/necromancer/i) {
		plugin::NPCTell( "You are here for Necromancer equipment, I understand. Hand over what you have, and I'll see what I can scrounge up for you.");
		quest::set_data($charKey, 1024, 1800);
	}
}

sub EVENT_ITEM {
	my $charKey = $client->CharacterID() . "-ArmorSwap";
	my $tarClass = quest::get_data($charKey);
	
	if ($tarClass == undef) {
			plugin::NPCTell("You didn't let me know what you were looking for, so I can only assume you wanted to sell these.");
	}
		
	if ($tarClass > 0) {
		if ($item1 > 0) {
			CheckItemUpgrade($item1,$tarClass);	
		}
		if ($item2 > 0) {
			CheckItemUpgrade($item2,$tarClass);		
		}
		if ($item3 > 0) {
			CheckItemUpgrade($item3,$tarClass);	
		}
		if ($item4 > 0) {
			CheckItemUpgrade($item4,$tarClass);		
		}		
	} else {
		if ($item1 > 0) {
			CheckItemSale($item1);		
		}
		if ($item2 > 0) {
			CheckItemSale($item2);		
		}
		if ($item3 > 0) {
			CheckItemSale($item3);		
		}
		if ($item4 > 0) {
			CheckItemSale($item4);	
		}
	}
}

sub CheckItemUpgrade {
	my $item = shift;
	my $tarClass = shift;
	my $iname = quest::getitemname($item);
	
	my $tarID = DoItemUpgrade($item, $tarClass);
	if ($tarID > 0 and $tarID != $item) {
		my $value = GetItemSaleMulti($item);
		if ($client->TakeMoneyFromPP($value*1000*1000*2, 1)) {
			$client->Message(2, "You paid ". plugin::commify($value*1000*2) ."pp to " . $npc->GetCleanName() . " to exchange [" . quest::varlink($item) . "] for [" . quest::varlink($tarID) . "].");
			plugin::takeItems($item => 1);
			$client->SummonItem($tarID, -1, true);
		} else {
			plugin::NPCTell("Sorry boss, you don't have enough money to pay for the exchange. How about you [".quest::saylink("sell",1)."] this to me instead?");
			plugin::return_items(\%itemcount);
		}			
	} elsif ($tarID == $item) {
		plugin::NPCTell("Sorry boss, I'm not going to take your money for no reason to swap [" . quest::varlink($item) . "] for another of itself. How about you [".quest::saylink("sell",1)."] this to me instead?");
		plugin::return_items(\%itemcount);
	} elsif (DoItemUpgrade($item, quest::getitemstat($item,"classes")) > 0) {		
		plugin::NPCTell("Sorry boss, I don't have anything for the class you asked about that I can swap [" . quest::varlink($item) . "] for. How about you [".quest::saylink("sell",1)."] this to me instead?"); 
		plugin::return_items(\%itemcount);
	} else {	
		if (!CheckDeprecatedItem($item)) {			
			plugin::NPCTell("Sorry boss, [" . quest::varlink($item) . "] isn't a piece of set armor, as far as I know. Bring me something I'm interested in next time.");
			plugin::return_items(\%itemcount);
		}	
	}
}

sub CheckDeprecatedItem {
	my $item = shift;
	my @items = (4911,4912,4913,4914,4915,4916,4917,54384,54385,54386,54387,54388,54389,
				 4861,4862,4863,4864,4865,4866,4867,4901,4902,4903,4904,4905,4906,4097);
	if (grep(/^$item$/, @items)) {
		plugin::NPCTell("I recognize this as a piece of armor I can use, but I'm not sure exactly how to swap it fairly. I'll pay you instead!");
		return 1;
	} else {
		return 0;
	}
}

sub CheckItemSale {
	my $item = shift;
	my $value = GetItemSaleMulti($item);
	if (CheckDeprecatedItem($item)) {
		$value = 1;
	} 
	if ($value > 0) {
		plugin::takeItems($item => 1);
		$client->Message(2, "You recieved ". plugin::commify($value*1000) ."pp from " . $npc->GetCleanName() . " for selling [" . quest::varlink($item) . "].");
		$client->AddMoneyToPP(0,0,0,$value*1000,1);
	} else {
		plugin::NPCTell("Sorry boss, [" . quest::varlink($item) . "] isn't a piece of set armor, as far as I know. Bring me something I'm interested in next time.");
		plugin::return_items(\%itemcount);	
	}	
}

sub DoItemUpgrade {
	my $item = shift;
	my $tarClass = shift;
	
	my $sourceClass = quest::getitemstat($item,"classes");
	my $slot        = quest::getitemstat($item,"slots");	
	my @sourceRow   = @{$armor{$sourceClass}{$slot}};
	
	my $count = 0;
	foreach $i (@sourceRow) {
		if ($i == $item) {
			return $armor{$tarClass}{$slot}[$count];
		}
		$count = $count + 1;
	}
	return -1;
}

sub GetItemSaleMulti {
	my $item = shift;
	
	my $sourceClass = quest::getitemstat($item,"classes");
	my $slot        = quest::getitemstat($item,"slots");	
	my @sourceRow   = @{$armor{$sourceClass}{$slot}};
	
	my $count = 0;
	my $value = 0;
	foreach $i (@sourceRow) {
		if ($i == $item) {
			if ($count < 7) {
				$value = 1;
			} elsif ($count < 8) {
				$value = 3;
			} elsif ($count < 9) {
				$value = 5;
			} elsif ($count < 10) {
				$value = 10;
			} elsif ($count < 11) {
				$value = 5;
			} elsif ($count < 12) {
				$value = 20;
			}
		}
		$count = $count + 1;
	}	
	return $value;
}