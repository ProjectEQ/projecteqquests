my $instid = 0;

sub EVENT_ITEM {
	$instid = quest::GetInstanceID('uqua',0);
	if (plugin::check_handin(\%itemcount, 67706 => 1)) {
		quest::settimer(1,30);
		quest::signalwith(292008,$instid);
	}
}

sub EVENT_TIMER {
  quest::stoptimer(1);
  quest::spawn2(292062,0,0,-869,-691,25,254);
  quest::spawn2(292063,0,0,-836,-692,25,255);
  quest::spawn2(292062,0,0,-906,-692,25,13);
  quest::spawn2(292063,0,0,-883,-636,26,133);
  quest::spawn2(292064,0,0,-850,-637,26,127);
  quest::spawn2(292065,5,0,-871,-209,59,125);
  quest::spawn2(292066,0,0,-871,-209,59,125);
  quest::spawn2(292067,0,0,-866,-43,61,130);
  quest::spawn2(292068,0,0,-869,-16,65,125);
}