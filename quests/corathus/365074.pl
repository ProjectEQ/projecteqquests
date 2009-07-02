#healing mushroom
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
				emote::say("I would be healing damage but it's nyi");
				#$random_client->HealDamage(2000, $npc);
			}
			elsif($random_spell == 2)
			{
				emote::say("I would be healing damage but it's nyi");
				#$random_client->HealDamage(1000, $npc);
			}
			elsif($random_spell == 3)
			{
				emote::say("I would be healing damage but it's nyi");
				#$random_client->HealDamage(1000, $npc);
				$random_client->SetMana($random_client->GetMana() + 200);
				$random_client->Message(264, "Your mind clears.");
			}
			elsif($random_spell == 4)
			{
				$random_client->SetMana($random_client->GetMana() + 500);
				$random_client->Message(264, "Your mind clears.");
			}
			elsif($random_spell == 5)
			{
				$random_client->SetMana($random_client->GetMana() + 200);
				$random_client->Message(264, "Your mind clears.");
			}
		}	
	}
}

sub EVENT_DEATH
{
	quest::stoptimer("wither");
	quest::stoptimer("cast");
}