sub EVENT_DEATH {
	my $r_n = int(rand(100));
	if($r_n < 75) {
             if ($r_n <= 25) {
                 quest::spawn2(201336, 0, 0, $x, $y, $z, $h);
             } elsif ($r_n <= 50) {
                 quest::spawn2(201440, 0, 0, $x, $y, $z, $h);
             } elsif ($r_n < 75) {
                 quest::spawn2(201441, 0, 0, $x, $y, $z, $h);
             }	
	}
}