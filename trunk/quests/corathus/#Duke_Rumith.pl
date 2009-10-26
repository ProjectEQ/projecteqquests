$num_tics;

sub EVENT_COMBAT
{
	if($combat_state == 0)
	{
		#out of combat
		$npc->SetHP(4860000);
	}
	elsif($combat_state == 1)
	{
		#in combat
		quest::shout("Death comes to those who linger.")
		quest::settimer("dominate", 20);
		quest::setnexthpevent(76);
	}
}

sub EVENT_DEATH
{
	quest::shout("This wasn't... what I was promised...");
	quest::stoptimer("dominate");
	quest::stoptimer("arcane_blast");
}

sub EVENT_TIMER
{
	if($timer eq "dominate")
	{
		quest::stoptimer("dominate");
		my @hatelist = $npc->GetHateList();
		@hatelist = sort {$b->GetHate() <=> $a->GetHate()} @hatelist;
		foreach $ent (@hatelist)
		{
			if($ent)
			{
				my $h_ent = $ent->GetEnt();
				if($h_ent)
				{
					my $ent_name = $h_ent->GetCleanName();
					quest::shout("$ent_name your will is mine to control.");
					$npc->CastSpell(7028, $h_ent->GetID(), 10, 0);
					last;
				}
			}
		}
		quest::settimer("dominate", 60);
	}
	elsif($timer eq "arcane_blast")
	{
		quest::emote("unleashes a barrage of arcane energy.");
		my @hatelist = $npc->GetHateList();
		foreach $ent (@hatelist)
		{
			if($ent)
			{
				my $h_ent = $ent->GetEnt();
				if($h_ent)
				{
					my $dmg = ($h_ent->GetMaxHP() * 0.21);
					$h_ent->Damage($npc, $dmg, 1045, 4, false);
				}
			}
		}
		
		$num_tics++;
		
		if($num_tics == 5)
		{
			quest::stoptimer("arcane_blast");
		}
	}
}

sub EVENT_HP
{
	if($hpevent == 76)
	{
		quest::setnexthpevent(51);
	}
	elsif($hpevent == 51)
	{
		quest::setnexthpevent(26);
	}
	$num_tics = 0;
	quest::settimer("arcane_blast", 2);
}