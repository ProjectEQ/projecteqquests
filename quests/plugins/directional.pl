sub DirectionalAEList
{
	my $who = shift;
	my $angle_start = shift;
	my $angle_end = shift;
	my $aoe_range = shift;
	my $min_range = shift;
	my @m_list = @_; 
	my @ret_array;
	
	$angle_start = $angle_start + ($who->GetHeading() * 360.0 / 256.0);
	$angle_end = $angle_end + ($who->GetHeading() * 360.0 / 256.0);
	
	while($angle_start > 360.0)
	{
		$angle_start -= 360.0;
	}
	
	while($angle_end > 360.0)
	{
		$angle_end -= 360.0;
	}
	
	foreach $ent (@m_list)
	{
		if($ent != $who)
		{
			my $x_diff = $ent->GetX() - $who->GetX();
			$x_diff = $x_diff * $x_diff;
			
			my $y_diff = $ent->GetY() - $who->GetY();
			$y_diff = $y_diff * $y_diff;
			
			my $z_diff = $ent->GetZ() - $who->GetZ();
			$z_diff = $z_diff * $z_diff;
			
			if((($x_diff + $y_diff) <= ($aoe_range * $aoe_range)) && ($z_diff <= (($aoe_range * $aoe_range) / 2)))
			{
				my $heading_to_target = $who->CalculateHeadingToTarget($ent->GetX(), $ent->GetY()) * 360.0 / 256.0;
				while($heading_to_target < 0.0)
				{
					$heading_to_target += 360.0;
				}
				
				while($heading_to_target > 360.0)
				{
					$heading_to_target -= 360.0;
				}
				
				if($angle_start > $angle_end)
				{
					if(($heading_to_target >= $angle_start && $heading_to_target <= 360.0) || ($heading_to_target >= 0.0 && $heading_to_target <= $angle_end))
					{
						push(@ret_array, $ent);
					}

				}
				else
				{
					if($heading_to_target >= $angle_start && $heading_to_target <= $angle_end)
					{
						push(@ret_array, $ent);
					}
				}
			}
		}
	}
	
	return @ret_array;
}

return 1;