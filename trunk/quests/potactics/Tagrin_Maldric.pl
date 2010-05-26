#Tagrin Maldric is the blacksmith of the Zeks, and is part of obtaining Black Insanity (Zek bane) weapons. When aggro'd, he spawns 5 animated swords, who drop the actual ore for the bane weapons.
my $addsUp = 0;

sub EVENT_COMBAT { 
	if ($combat_state == 1 && $addsUp == 0){
		quest::spawn2(214119,0,0,$x-15,$y-15,$z,$h);
		quest::spawn2(214119,0,0,$x+15,$y-15,$z,$h);
		quest::spawn2(214119,0,0,$x-15,$y+10,$z,$h);
		quest::spawn2(214119,0,0,$x+15,$y+10,$z,$h);
		quest::spawn2(214119,0,0,$x,$y-15,$z,$h);
		$addsUp = 1;		
	} elsif ($combat_state ==0 && $addsUp == 1) {
		quest::depopall(214119);
		$addsUp = 0;
	}
}