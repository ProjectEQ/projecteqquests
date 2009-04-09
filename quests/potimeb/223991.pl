my $x;
my $y;
my $z;
my $h;

sub EVENT_SPAWN {
       $npc->SetHP(500000);
       quest::setnexthpevent(21);
       quest::emote("shakes the cavern with a bellow of pain as the white head explodes into a swirling vortex of ethereal energy!");
}

sub EVENT_HP {       
    if($hpevent == 21) {
        my $x = $npc->GetX();
        my $y = $npc->GetY();
        my $z = $npc->GetZ();
        my $h = $npc->GetHeading();
        quest::spawn2(223112,0,0,$x - 10,$y,$z,$h);
        quest::spawn2(223112,0,0,$x + 10,$y,$z,$h);
        quest::spawn2(223112,0,0,$x,$y - 10,$z,$h);
        quest::setnexthpevent(6);
}

    if($hpevent == 6) {
        my $x = $npc->GetX();
        my $y = $npc->GetY();
        my $z = $npc->GetZ();
        my $h = $npc->GetHeading();
        quest::spawn2(223112,0,0,$x - 10,$y,$z,$h);
        quest::spawn2(223112,0,0,$x + 10,$y,$z,$h);
        quest::spawn2(223112,0,0,$x,$y - 10,$z,$h);
        quest::spawn2(223112,0,0,$x,$y + 10,$z,$h);
}
 }
 
sub EVENT_DEATH {
         quest::spawn2(223214,0,0,-656.2,-1096.5,-2.7,60);
         quest::setglobal("quarm_down",1,7,"M10"); #general phase complete.
         quest::signalwith(223177,667,0);
         quest::delglobal("potb_p5_comp");
         quest::delglobal("potb_p1_start");
         quest::delglobal("potb_p1_comp");
         quest::delglobal("potb_p2_comp");
         quest::delglobal("potb_p3_comp");
         quest::delglobal("potb_p4_comp");
}

sub EVENT_SIGNAL {
  if ($signal == 66){
     quest::depop();
}
 }