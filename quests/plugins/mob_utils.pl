###AKKADIUS###
#Usage: plugin::MobHealPercentage(Numberofpercent);
# This script will heal a mob whatever percent amount at the time of trigger
sub MobHealPercentage{
	my $npc = plugin::val('$npc');
	my $HealPercent = $_[0];
	my $curhp = $npc->GetHP();
	my $maxhp = $npc->GetMaxHP();
	$npc->SetHP($curhp + ($maxhp / 100 * $HealPercent));
}

#Usage: plugin::MobDamagePercentage(Numberofpercent);
sub MobDamagePercentage{
	my $npc = plugin::val('$npc');
	my $HealPercent = $_[0];
	my $curhp = $npc->GetHP();
	my $maxhp = $npc->GetMaxHP();
	$npc->SetHP($curhp - ($maxhp / 100 * $HealPercent));
}

###AKKADIUS###
#Usage: plugin::MobHealPoints(Hitpoints to heal);
# This script will heal a mob whatever point amount at the time of trigger
sub MobHealPoints{
	my $npc = plugin::val('$npc');
	my $HealPoints = $_[0];
	my $curhp = $npc->GetHP();
	my $maxhp = $npc->GetMaxHP();
	$npc->SetHP($curhp + $HealPoints);
}

#Usage: plugin::MobDamagePoints(Hitpoints to damage);
sub MobDamagePoints{
	my $npc = plugin::val('$npc');
	my $HealPoints = $_[0];
	my $curhp = $npc->GetHP();
	my $maxhp = $npc->GetMaxHP();
	$npc->SetHP($curhp - $HealPoints);
}

###AKKADIUS###
#Usage: plugin::SpawnInPlace(NPCID to spawn in place, [1 = Don't depop what spawns in place]);
#The Second arguement for a plugin like this is for an instance where you have eggs spawn drakes and you don't want the eggs to depop
sub SpawnInPlace{
	my $npc = plugin::val('$npc');
	my $NPCID = $_[0];
	my $DontDie = $_[1];
	my $x = $NPCID->GetX();
	my $y = $NPCID->GetY();
	my $z = $NPCID->GetZ();
	my $h = $NPCID->GetHeading();
	if(!$DontDie){
	$NPCID->Depop();
	}
	quest::spawn2($NPCID, 0, 0, $x, $y, $z, $h);
}

###AKKADIUS###
#Usage: plugin::SpawnInPlaceByEnt(Entity Variable, [1 = Don't depop what spawns in place]);
#The Second arguement for a plugin like this is for an instance where you have eggs spawn drakes and you don't want the eggs to depop
sub SpawnInPlaceByEnt{
	my $npc = plugin::val('$npc');
	my $EntityID = $_[0];
	my $DontDie = $_[1];
	my $x = $EntityID->GetX();
	my $y = $EntityID->GetY();
	my $z = $EntityID->GetZ();
	my $h = $EntityID->GetHeading();
	my $NPCID = $EntityID->GetNPCTypeID();
	if(!$DontDie){
	$EntityID->Depop(0);
	}
	quest::spawn2($NPCID, 0, 0, $x, $y, $z, $h);
}

###AKKADIUS###
#Usage: plugin::SpawnChest(Chest NPCID to spawn in place, [the integer range you want the chest to randomly spawn from the dead mob]);
#Similar to plugin::SpawnInPlace, this plugin will spawn a chest in the same place, or will spawn a chest within a random generated desired range defined in the second arguement
sub SpawnChest{
	my $npc = plugin::val('$npc');
	my $NPCID = $_[0];
	my $Range = $_[1];
	my $ChestRange = plugin::RandomRange(1, $Range);
	my $x = $npc->GetX();
	my $y = $npc->GetY();
	my $z = $npc->GetZ();
	my $h = $npc->GetHeading();
	quest::spawn2($NPCID, 0, 0, $x + ($ChestRange), $y + ($ChestRange), $z, $h);
}

###AKKADIUS###
#Usage: plugin::SetLeashMob();
# This script will set the parameters in which the mob will be leashed for when you perform a check.
sub SetLeashMob{
	my $npc = plugin::val('$npc');
	my $MobX = $npc->GetX();
	my $MobY = $npc->GetY();
	my $MobZ = $npc->GetZ();
	my $MoBH = $npc->GetHeading();
	$npc->SetEntityVariable(60, $MobX);	# Set X Base Integer
	$npc->SetEntityVariable(61, $MobY); # Set Y Base Integer
	$npc->SetEntityVariable(62, $MobZ); # Set Z Base Integer
	$npc->SetEntityVariable(63, $MobH); # Set H Base Integer - Store for return
}

###AKKADIUS###
#Usage: plugin::CheckLeashMob(Range);
# This script will check the parameters in which the Leash was set and check against the arguement declared, if comes back true, the mob is reset to its leash set point.
sub CheckLeashMob{
	my $npc = plugin::val('$npc');
	my $LeashAmount = $_[0];
	my $GetLeashX = $npc->GetEntityVariable(60);
	my $GetLeashY = $npc->GetEntityVariable(61);
	my $GetLeashZ = $npc->GetEntityVariable(62);
	my $StoredHeading = $npc->GetEntityVariable(63);
	my $MobX = $npc->GetX();
	my $MobY = $npc->GetY();
	my $MobZ = $npc->GetZ();
	my $DifferenceX = $GetLeashX - $MobX;
	my $DifferenceY = $GetLeashY - $MobY;
	my $DifferenceZ = $GetLeashZ - $MobZ;
	my $FinX = abs($DifferenceX);
	my $FinY = abs($DifferenceY);
	my $FinZ = abs($DifferenceZ);
	if ($FinX > $LeashAmount || $FinY > $LeashAmount || $FinZ > $LeashAmount){
	$npc->GMMove($GetLeashX, $GetLeashY, $GetLeashZ, $StoredHeading); #Returns back to original point if mob goes beyond the throttled integer range
	}
}

return 1;