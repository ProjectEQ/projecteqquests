sub Dist
{
	my $a = shift;
	my $b = shift;
	my $x_dist = $a->GetX() - $b->GetX();
	$x_dist = $x_dist * $x_dist;
	
	my $y_dist = $a->GetY() - $b->GetY();
	$y_dist = $y_dist * $y_dist;
	
	my $z_dist = $a->GetZ() - $b->GetZ();
	$z_dist = $z_dist * $z_dist;
	
	my $total_dist = $x_dist + $y_dist + $z_dist;
	return sqrt($total_dist);
}

sub DistNoZ
{
	my $a = shift;
	my $b = shift;
	my $x_dist = $a->GetX() - $b->GetX();
	$x_dist = $x_dist * $x_dist;
	
	my $y_dist = $a->GetY() - $b->GetY();
	$y_dist = $y_dist * $y_dist;
	
	my $total_dist = $x_dist + $y_dist;
	return sqrt($total_dist);
}

sub DistNoRoot
{
	my $a = shift;
	my $b = shift;
	my $x_dist = $a->GetX() - $b->GetX();
	$x_dist = $x_dist * $x_dist;
	
	my $y_dist = $a->GetY() - $b->GetY();
	$y_dist = $y_dist * $y_dist;
	
	my $z_dist = $a->GetZ() - $b->GetZ();
	$z_dist = $z_dist * $z_dist;
	
	my $total_dist = $x_dist + $y_dist + $z_dist;
	return $total_dist;
}

sub DistNoRootNoZ
{
	my $a = shift;
	my $b = shift;
	my $x_dist = $a->GetX() - $b->GetX();
	$x_dist = $x_dist * $x_dist;
	
	my $y_dist = $a->GetY() - $b->GetY();
	$y_dist = $y_dist * $y_dist;
	
	my $total_dist = $x_dist + $y_dist;
	return $total_dist;
}

sub DistToCoords
{
	my $a = shift;
	my $xd = shift;
	my $yd = shift;
	my $zd = shift;
	my $x_dist = $a->GetX() - $xd;
	$x_dist = $x_dist * $x_dist;
	
	my $y_dist = $a->GetY() - $yd;
	$y_dist = $y_dist * $y_dist;
	
	my $z_dist = $a->GetZ() - $zd;
	$z_dist = $z_dist * $z_dist;
	
	my $total_dist = $x_dist + $y_dist + $z_dist;
	return sqrt($total_dist);
}

sub DistNoZToCoords
{
	my $a = shift;
	my $xd = shift;
	my $yd = shift;
	my $x_dist = $a->GetX() - $xd;
	$x_dist = $x_dist * $x_dist;
	
	my $y_dist = $a->GetY() - $yd;
	$y_dist = $y_dist * $y_dist;
	
	my $total_dist = $x_dist + $y_dist;
	return sqrt($total_dist);
}

sub DistNoRootToCoords
{
	my $a = shift;
	my $xd = shift;
	my $yd = shift;
	my $zd = shift;
	my $x_dist = $a->GetX() - $xd;
	$x_dist = $x_dist * $x_dist;
	
	my $y_dist = $a->GetY() - $yd;
	$y_dist = $y_dist * $y_dist;
	
	my $z_dist = $a->GetZ() - $zd;
	$z_dist = $z_dist * $z_dist;
	
	my $total_dist = $x_dist + $y_dist + $z_dist;
	return $total_dist;
}

sub DistNoRootNoZToCoords
{
	my $a = shift;
	my $xd = shift;
	my $yd = shift;
	my $x_dist = $a->GetX() - $b->GetX();
	$x_dist = $x_dist * $x_dist;
	
	my $y_dist = $a->GetY() - $b->GetY();
	$y_dist = $y_dist * $y_dist;
	
	my $total_dist = $x_dist + $y_dist;
	return $total_dist;
}

#::: Author: Akkadius
#::: This is a shorthand way of setting an entity variable
#::: Usage plugin::SEV(entity, variable_name, variable_value);
#::: Wiki: http://wiki.eqemulator.org/p?Perl_Plugins_Master_Reference#pluginseventity-variable-name-variable-value
sub SEV{
	$ent = $_[0];
	$var_n = $_[1];
	$var_v = $_[2];
	$ent->SetEntityVariable($var_n, $var_v);
}

#::: Author: Akkadius
#::: This is a shorthand way of reading an entity variable, it will return a value
#::: Usage plugin::REV(entity, variable_name);
#::: Wiki: http://wiki.eqemulator.org/p?Perl_Plugins_Master_Reference#pluginreventity-variable-name
sub REV{
	$ent = $_[0];
	$var_n = $_[1];
	# quest::say("Reading " . $var_n . " value is " . $ent->GetEntityVariable($var_n));
	return $ent->GetEntityVariable($var_n);
}

#::: Author: Akkadius
#::: A simple way to return the distance between the NPC initiating this plugin and the player, useful for all kinds of situations. Will return true if within distance, false if not.
#::: Usage plugin::CheckDist(entity1, distance);
#::: Wiki: http://wiki.eqemulator.org/p?Perl_Plugins_Master_Reference#pluginreventity-variable-name
sub CheckDist{
	$npc = plugin::val('$npc');
	$ent = $_[0];
	$dist = $_[1];
	if((abs($ent->GetX() - $npc->GetX()) <= $dist) && (abs($ent->GetY() - $npc->GetY()) <= $dist)){ return 1; } else{ return; }
}

#::: Author: Akkadius
#::: A simple way to return the distance between two select entities, useful for all kinds of situations. Will return true if within distance, false if not.
#::: Usage plugin::CheckDistBetween2Ents(entity1, entity2, distance);
#::: Wiki: http://wiki.eqemulator.org/p?Perl_Plugins_Master_Reference#plugincheckdistbetween2entsentity1-entity2-distance
sub CheckDistBetween2Ents{
	$npc = plugin::val('$npc'); 
	$ent = $_[0];
	$ent2 = $_[1];
	$dist = $_[2];
	if((abs($ent->GetX() - $ent2->GetX()) <= $dist) && (abs($ent->GetY() - $ent2->GetY()) <= $dist)){ return 1; } else{ return; }
}

#::: Author: Hunter (RIP Hunter)
#::: AddLoot(amount, chance, @itemarray)  -- array can be 1 item or more!
#::: Wiki: http://wiki.eqemulator.org/p?Perl_Plugins_Master_Reference#pluginaddlootamount-chance-itemarray

sub AddLoot  {
	my $amount = shift;
	my $chance = shift;
	my @itemdrop = @_;

	#Set to 2 for double lootz!
	my $Double_Loot = 1; # 1 = Normal 1x loot, 2 = Double Loot, etc

	for($n = 1; $n <= $amount; $n++) {
		for($i = 1; $i <= $Double_Loot; $i++) {
			my $random_number = int(rand($chance)+1);
			if($random_number == 1){ # 1/chance to drop 
				my $itemz = $itemdrop[ rand @itemdrop ];
				quest::addloot($itemz, 1); # 1 charge
			}
		}
	}
}

1;