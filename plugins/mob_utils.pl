#::: Author: Akkadius
#::: This function will heal a mob whatever percent amount at the time of trigger
#::: Usage: plugin::MobHealPercentage(Percent [1-100]);
sub MobHealPercentage{
	my $npc = plugin::val('$npc');
	my $HealPercent = $_[0];
	my $curhp = $npc->GetHP();
	my $maxhp = $npc->GetMaxHP();
	$npc->SetHP($curhp + ($maxhp / 100 * $HealPercent));
}

#::: Author: Akkadius
#::: This function will damage a mob whatever percent amount at the time of trigger
#::: Usage: plugin::MobDamagePercentage(Percent [1-100]);
sub MobDamagePercentage{
	my $npc = plugin::val('$npc');
	my $HealPercent = $_[0];
	my $curhp = $npc->GetHP();
	my $maxhp = $npc->GetMaxHP();
	$npc->SetHP($curhp - ($maxhp / 100 * $HealPercent));
}

#::: Author: Akkadius
#::: This function will heal a mob whatever number of hit points specified
#::: Usage: plugin::MobHealPoints(Number);
sub MobHealPoints{
	my $npc = plugin::val('$npc');
	my $HealPoints = $_[0];
	my $curhp = $npc->GetHP();
	my $maxhp = $npc->GetMaxHP();
	$npc->SetHP($curhp + $HealPoints);
}

#::: Author: Akkadius
#::: This function will damage a mob whatever number of hit points specified
#::: Usage: plugin::MobDamagePoints(Number);
sub MobDamagePoints{
	my $npc = plugin::val('$npc');
	my $HealPoints = $_[0];
	my $curhp = $npc->GetHP();
	my $maxhp = $npc->GetMaxHP();
	$npc->SetHP($curhp - $HealPoints);
}

#::: Author: Akkadius
#::: Description: The Second arguement for a plugin like this is for an instance where you have eggs spawn drakes and you don't want the eggs to depop
#::: Usage: plugin::SpawnInPlace(NPCID To Spawn In Place, [1 = Don't depop what spawns in place]);
sub SpawnInPlace{
	my $npc = plugin::val('$npc');
	my $NPCID = $_[0]; my $DontDie = $_[1];
	my $x = $NPCID->GetX(); my $y = $NPCID->GetY(); my $z = $NPCID->GetZ(); my $h = $NPCID->GetHeading();
	if(!$DontDie){ $NPCID->Depop(); }
	quest::spawn2($NPCID, 0, 0, $x, $y, $z, $h);
}

#::: Author: Akkadius
#::: Description: This function will spawn an NPC in place, uses the entity ID for the first argument such as ($npc)
#:::	The Second arguement for a plugin like this is for an instance where you have eggs spawn drakes and you don't want the eggs to depop
#::: Usage: plugin::SpawnInPlaceByEnt{(NPCID To Spawn In Place, [1 = Don't depop what spawns in place]);
sub SpawnInPlaceByEnt{
	my $npc = plugin::val('$npc');
	my $EntityID = $_[0]; my $DontDie = $_[1];
	my $x = $EntityID->GetX(); my $y = $EntityID->GetY(); my $z = $EntityID->GetZ(); my $h = $EntityID->GetHeading();
	my $NPCID = $EntityID->GetNPCTypeID();
	if(!$DontDie){ $EntityID->Depop(0); }
	quest::spawn2($NPCID, 0, 0, $x, $y, $z, $h);
}

#::: Author: Akkadius
#::: Description: This is used to spawn a chest in place, but it will use a random range to spit the chest out based on the NPC origin
#::: Usage: plugin::SpawnChest{(NPCID To Spawn In Place, [1 = Don't depop what spawns in place]);
sub SpawnChest{
	my $npc = plugin::val('$npc');
	my ($NPCID, $Range) = ($_[0], $_[1]);
	my $ChestRange = plugin::RandomRange(1, $Range);
	my ($x, $y, $z, $h) = (plugin::val('$x'), plugin::val('$y'), plugin::val('$z'), plugin::val('$h'));
	quest::spawn2($NPCID, 0, 0, $x + ($ChestRange), $y + ($ChestRange), $z, $h);
}

return 1;