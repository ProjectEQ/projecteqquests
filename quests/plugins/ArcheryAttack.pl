# Usage: plugin::ArcheryAttack(MeanDamage, Variance, TargNumber);
# MeanDamage - average damage of the attack
# Variance - +- % of mean as a range.
# TargNumber - 1: Current target, 2: All Targets on Hatelist, 3: Random Target from Hatelist
# Requires most current globals.pl and randomrange.pl plugins.

sub ArcheryAttack {

## Variables, set these to customize how the script works

$ACDiv = 75;     # 35% shielding (max default) at 2625 AC with ACDiv of 75
$PCTMiss = 5;    # Percent chance to miss outright
$PCTCrit = 5;    # Percent chance to critically hit
$MaxShield = 35; # Max Shielding percent
$ThroatDamage = 1.25; # Following variables edit the damage
$HeadDamage = 1.1;    # Based on where the arrow is striking
$ChestDamage = 1.0;   # Feel free to edit these to
$ArmDamage = 0.9;     # Suit your needs.
$LegDamage = 0.9;
$HandDamage = 0.75;
$FootDamage = 0.75;

## End Variables

$PCTMiss = 100-$PCTMiss+1;

	$npc = plugin::val('$npc');
	$entity_list = plugin::val('entity_list');

	my $MeanDamage = $_[0];
	my $Variance = $_[1];
	my $TargNumber = $_[2];
	my $MobName = $npc->GetCleanName();

	my $MinDamage = int ( $MeanDamage * (1-($Variance/100)) );
	my $MaxDamage = int ( $MeanDamage * (1+($Variance/100)) );
	$HitDmg = plugin::RandomRange($MinDamage, $MaxDamage);


	if ($TargNumber == 1) {
	       	$targ = $npc->GetHateTop();
		$hitname = $targ->GetName();
            	$targid = $targ->GetID();
		$targid = $entity_list->GetClientByID($targid);
		LocDmg();
		quest::emote("sights and releases an arrow at his most infuriating enemy, $hitname."); 
		quest::doanim(9);
		ApplyDamage();
	}

	if ($TargNumber == 2) {
		quest::emote("begins to a fire off a furious barrage of arrows, aiming at everyone around him!");
		quest::doanim(9);
		LocDmg();
		HitAllClients();
	}

	if ($TargNumber == 3) {
		$target = $npc->GetHateRandom();
		$targid = $target->GetID();
		$targid = $entity_list->GetClientByID($targid);
		$hitname = $target->GetName();
		LocDmg();	
		quest::emote("looses an arrow at $hitname at random.");
		quest::doanim(9);
		ApplyDamage();
	}
}

sub LocDmg {	

	$HitLoc = quest::ChooseRandom("head","head","leg","arm","chest","chest","throat","throat","hand","foot"); 

	CritOrMiss();

	if ($HitLoc eq "head") {
		$HitDmg = int($HitDmg*$HeadDamage);
	}

	if ($HitLoc eq "leg") {
		$HitDmg = int($HitDmg*$LegDamage);
	}

	if ($HitLoc eq "arm") {
		$HitDmg = int($HitDmg*$ArmDamage);
	}

	if ($HitLoc eq "throat") {
		$HitDmg = int($HitDmg*$ThroatDamage);
	}

	if ($HitLoc eq "hand" ) {
		$HitDmg = int($HitDmg*$HandDamage);
	}

	if ($HitLoc eq "foot") {
		$HitDmg = int($HitDmg*$FootDamage);
	}

	if ($HitLoc eq "chest") {
		$HitDmg = int($HitDmg*$ChestDamage);
	}
}


sub HitAllClients { 	
	my @hatelist = $npc->GetHateList();
	foreach $ent (@hatelist)
	{
		if($ent)
		{
			my $h_ent = $ent->GetEnt();
			if($h_ent)
			{
            			$targid = $h_ent->GetID();
				$targid = $entity_list->GetClientByID($targid);
				ApplyDamage();
			}
		}
	}
}

sub ApplyDamage {
	if ($HitDmg != 0) { 

	$pac = $targid->CastToMob()->GetAC();

	$shielding = $pac/$ACDiv;


	if ($shielding > $MaxShield) {
		$shielding = $MaxShield;
	}

	$shielding = $shielding/100;
	$HitDmg = int ($HitDmg * (1-$shielding));
	$targid->Damage($npc,$HitDmg,0,4);
		if ($DidCrit eq "crit") {
			$targid->Message(13,"You have been CRITICALLY STRUCK by an arrow in the $HitLoc for $HitDmg points of non-melee damage!");  
		}
		else {
			$targid->Message(13,"You have been struck by an arrow in the $HitLoc for $HitDmg points of non-melee damage!");  
		}
	}
	else {
		$targid->Message(13,"You breathe a sigh of relief as the arrow narrowly misses you!"); 
	}
}

sub CritOrMiss {

	$didmiss = int(rand(100));
	if ($didmiss > $PCTMiss) {
		$HitDmg = 0;
	}
	if ($didmiss <= $PCTCrit) {
		$DidCrit = "crit";
		$HitDmg = $HitDmg*2;
	}

	else {
		$DidCrit = "no";
	}
}