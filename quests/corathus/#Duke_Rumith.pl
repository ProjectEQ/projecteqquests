$num_tics;

sub EVENT_COMBAT
{
	if($combat_state == 0)
	{
		#out of combat
		$npc->SetHP(1520000);
		quest::stoptimer("dominate");
		quest::stoptimer("arcane_blast");
	}
	elsif($combat_state == 1)
	{
		#in combat
		quest::shout("Death comes to those who linger in the line of fire.");
		quest::settimer("dominate", 20);
		quest::setnexthpevent(76);
		
		my $robot_spawner = $entity_list->GetMobByNpcTypeID(365057);
		if($robot_spawner)
		{
			$robot_spawner->Kill();
		}
	}
}

sub EVENT_DEATH_COMPLETE
{
	quest::shout("This wasn't... what I was promised...");
	quest::stoptimer("dominate");
	quest::stoptimer("arcane_blast");
	quest::spawn_condition("corathus", 2, 1); #enable CY
	quest::spawn_condition("corathus", 1, 0); #disable Start
	quest::spawn_condition("corathus", 9, 1); #enable spore boss
	quest::spawn_condition("corathus", 10, 1); #enable mino boss
	quest::spawn_condition("corathus", 11, 1); #enable spider boss
	quest::depopall(365029);
	quest::spawn2(365143, 0, 0, $npc->GetX(), $npc->GetY(), $npc->GetZ(), $npc->GetHeading());
	
	my $willf = $entity_list->GetMobByNpcTypeID(365171);
	if($willf)
	{
		$willf->Shout("Fool, I promised you riches and power but you've squandered it by falling to these insects.");
	}
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
		if($num_tics == 0)
		{
			quest::emote("begins to unleash a barrage of arcane energy.");
		}
		my @hatelist = $npc->GetHateList();
		foreach $ent (@hatelist)
		{
			if($ent)
			{
				my $h_ent = $ent->GetEnt();
				if($h_ent)
				{
					my $dmg = ($h_ent->GetMaxHP() * 0.34);
					$h_ent->Damage($npc, $dmg, 1045, 4, false);
				}
			}
		}
		
		$num_tics++;
		
		if($num_tics == 3)
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