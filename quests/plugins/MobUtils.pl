###AKKADIUS FROM [Blood of the Akkadian]###
#Usage: plugin::MobHealPercentage(Numberofpercent);
# This script will heal a mob whatever percent amount at the time of trigger/
sub MobHealPercentage{
	my $npc = plugin::val('$npc');
	my $HealPercent = $_[0];
	my $curhp = $npc->GetHP();
	my $maxhp = $npc->GetMaxHP();
	$npc->SetHP($curhp + ($maxhp / 100 * $HealPercent));
}
#Usage: plugin::MobHealPoints(Numberofhitpoints);
# This script will heal a mob whatever point amount at the time of trigger
sub MobHealPoints{
	my $npc = plugin::val('$npc');
	my $HealPoints = $_[0];
	my $curhp = $npc->GetHP();
	my $maxhp = $npc->GetMaxHP();
	$npc->SetHP($curhp + $HealPoints);
}

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

#Usage: plugin::CheckLeashMob(Integer);
# This script will check the parameters in which the Leash was set and check against the arguement declared.
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