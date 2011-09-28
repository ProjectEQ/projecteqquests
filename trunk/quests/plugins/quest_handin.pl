###Akkadius from Blood of the Akkadian####
###Usage: plugin::QuestHandIn(ItemRewardID, RewardMessageofNPC, NPCAnimation, Case(How many separate items you want handed in) ItemID1, HowManyItem1, [ItemID2, HowManyItem2, ItemID3, HowManyItem3, ItemID4, HowManyItem4]);
###This plugin requires my DoAnim plugin to function properly with the animation function
sub QuestHandIn{
		my $npc = plugin::val('$npc');
		my $client = plugin::val('$client');
		my $name = plugin::val('$name');
		my $itemcount = plugin::var('itemcount');
		my $ulevel = plugin::val('$ulevel');
		my $npc_name = $npc->GetCleanName();
		my $Item1 = 0;
		my $Item2 = 0;
		my $Item3 = 0;
		my $Item4 = 0;
		my $RewardID = $_[0];
		my $NPCMESSAGE = $_[1];
		my $NPCANIMATION = $_[2];
		my $CaseItems = $_[3];
		my $Item1 = $_[4];
		my $ItemCount1 = $_[5];
		my $Item2 = $_[6];
		my $ItemCount2 = $_[7];
		my $Item3 = $_[8];
		my $ItemCount3 = $_[9];
		my $Item4 = $_[10];
		my $ItemCount4 = $_[11];
		my $Reward = quest::varlink($RewardID);
		if ($CaseItems == 4){ ###If there are four separate item cases
		###quest::say("Fallen in case 1 $itemcount");
			if (plugin::check_handin($itemcount, $Item1 => $ItemCount1, $Item2 => $ItemCount2, $Item3 => $ItemCount3, $Item4 => $ItemCount4))
				{ 
				plugin::ClientSay("$NPCMESSAGE");
				$client->Message(15, "You have obtained [$Reward]!");
				plugin::DoAnim("$NPCANIMATION");
				quest::summonitem($RewardID);
				quest::write("HandIn/$npc_name$zonesn.txt","[$timestamp] : $name the $ulevel has handed in $Item1, $Item2, $Item3, $item4 into $npc_name, and gotten $RewardID.");			
				my $Npc_Name = $npc->GetCleanName();
				quest::we(13, "$Npc_Name shouts, 'Congratulations $name on their [$Reward!]");
				}
		}
		if ($CaseItems == 3){ ###If there are 3 separate item cases
		###	quest::say("Fallen in case 2");
			if (plugin::check_handin($itemcount, $Item1 => $ItemCount1, $Item2 => $ItemCount2, $Item3 => $ItemCount3))
					{ 
					plugin::ClientSay("$NPCMESSAGE");
					$client->Message(15, "You have obtained [$Reward]!");
					plugin::DoAnim("$NPCANIMATION");
					quest::summonitem($RewardID);
					quest::write("HandIn/$npc_name$zonesn.txt","[$timestamp] : $name the $ulevel has handed in $Item1, $Item2, $Item3, $item4 into $npc_name, and gotten $RewardID.");	
					my $Npc_Name = $npc->GetCleanName();
					quest::we(13, "$Npc_Name shouts, 'Congratulations $name on their [$Reward!]");
					}
		}
		if ($CaseItems == 2){ ###If there are 2 separate item cases
		###	quest::say("Fallen in case 3");
			if (plugin::check_handin($itemcount, $Item1 => $ItemCount1, $Item2 => $ItemCount2))
						{ 
						plugin::ClientSay("$NPCMESSAGE");
						$client->Message(15, "You have obtained [$Reward]!");
						plugin::DoAnim("$NPCANIMATION");
						quest::summonitem($RewardID);
						quest::write("HandIn/$npc_name$zonesn.txt","[$timestamp] : $name the $ulevel has handed in $Item1, $Item2, $Item3, $item4 into $npc_name, and gotten $RewardID.");	
						my $Npc_Name = $npc->GetCleanName();
						quest::we(13, "$Npc_Name shouts, 'Congratulations $name on their [$Reward!]");
						}
			}
		if ($CaseItems == 1){ ###If there is one single item case
		###quest::say("Fallen in case 4");
			if (plugin::check_handin($itemcount, $Item1 => $ItemCount1))
							{ 
							plugin::ClientSay("$NPCMESSAGE");
							$client->Message(15, "You have obtained [$Reward]!");
							plugin::DoAnim("$NPCANIMATION");
							quest::summonitem($RewardID);
							quest::write("HandIn/$npc_name$zonesn.txt","[$timestamp] : $name the $ulevel has handed in $Item1, $Item2, $Item3, $item4 into $npc_name, and gotten $RewardID.");	
							my $Npc_Name = $npc->GetCleanName();
							quest::we(13, "$Npc_Name shouts, 'Congratulations $name on their [$Reward!]");
							}

				}
}
