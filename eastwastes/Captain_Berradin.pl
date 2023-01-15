# items: 1459

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 1459 => 1)) { #tainted avalanche ale
    quest::say("You gotta be kiddin me, Avalanche Ale? Haven't had a bottle a this stuff in ages. Brell bless you, $name!");
    quest::say("Glug, glug, glug...");
    quest::settimer(1,5);
  }
  plugin::return_items(\%itemcount);
}

sub EVENT_TIMER {
  if($timer == 1) {
    quest::stoptimer(1);
    quest::doanim(58);
    quest::settimer(2,5);
  }
  if($timer == 2) {
    quest::stoptimer(2);
    quest::doanim(58);
    quest::settimer(3,5);
  }
  if($timer == 3) {
    quest::stoptimer(3);
    quest::doanim(21);
    quest::settimer(4,5);
  }
  if($timer == 4) {
    my $x = $npc->GetX();
    my $y = $npc->GetY();
    my $z = $npc->GetZ();
    my $h = $npc->GetHeading();
    quest::spawn2(116573,0,0,$x,$y,$z,$h); # NPC: #Captain_Berradin
    quest::depop_withtimer();
  }
}