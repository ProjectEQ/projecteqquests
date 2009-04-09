sub EVENT_AGGRO {
	
if($aggro == undef){

	quest::spawn2(116552, 0, 0, ($x + 15), ($y + 5), $z, $h);
	quest::spawn2(116552, 0, 0, ($x - 15), ($y + 5), $z, $h);
	quest::spawn2(116552, 0, 0, $x, ($y - 15), $z, $h);
	$aggro=1;
	quest::settimer(1, 7200);
	}

}

sub EVENT_TIMER {

if($timer == 1){
	$aggro=undef;
	quest::stoptimer(1);
	}
}

sub EVENT_DEATH {

quest::stoptimer(1);

}
