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

1;