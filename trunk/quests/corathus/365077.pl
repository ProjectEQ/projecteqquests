#Deadly mushroom
sub EVENT_SPAWN
{
	quest::settimer("wither", 60);
	quest::settimer("cast", 3);
}

sub EVENT_TIMER
{
	if($timer eq "wither")
	{
		quest::stoptimer("wither");
		quest::emote("withers and dies.");
		quest::depop();
	}
	elsif($timer eq "cast")
	{
		my $random_client = $entity_list->GetRandomClient($npc->GetX(), $npc->GetY(), $npc->GetZ(), 200);
		if($random_client) 
		{
			my $random_spell = quest::ChooseRandom(1,2,3,4,5);
			if($random_spell == 1)
			{
				$random_client->Damage($npc, 2500, 2993, 4, false);
				$random_client->Message(264, "You are covered with deadly spores, you have taken 2500 damage.");
			}
			elsif($random_spell == 2)
			{
				$random_client->Damage($npc, 1000, 2993, 4, false);
				$random_client->Message(264, "You are covered with deadly spores, you have taken 1000 damage.");
			}
			elsif($random_spell == 3)
			{
				$random_client->SetMana($random_client->GetMana() - 4000);
				$random_client->Message(264, "Your mind clouds from deadly spores.");
			}
			elsif($random_spell == 4)
			{
				$random_client->SetMana($random_client->GetMana() - 2000);
				$random_client->Message(264, "Your mind clouds from deadly spores.");
			}
			elsif($random_spell == 5)
			{
				$random_client->SetMana($random_client->GetMana() - 1000);
				$random_client->Message(264, "Your mind clouds from deadly spores.");
			}
		}	
	}
}

sub EVENT_DEATH
{
	quest::stoptimer("wither");
	quest::stoptimer("cast");
}