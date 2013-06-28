my $x;
my $y;
my $z;
my $h;


sub EVENT_AGGRO {
       quest::say("Now is the chance to prove my power reigns supreme. Prepare to feel the power of nightmares shatter your soul!");
}

sub EVENT_SPAWN {
       quest::setnexthpevent(91);
       quest::settimer("terris",1);
}

sub EVENT_HP {       
    if($hpevent == 91) {
        my $x = $npc->GetX();
        my $y = $npc->GetY();
        my $z = $npc->GetZ();
        my $h = $npc->GetHeading();
        quest::spawn2(223079,0,0,$x,$y + 15,$z,$h);
        quest::spawn2(223081,0,0,$x,$y + 25,$z,$h);
        quest::spawn2(223080,0,0,$x,$y - 15,$z,$h);
        quest::spawn2(223082,0,0,$x,$y - 25,$z,$h);
        quest::setnexthpevent(51);
}

    if($hpevent == 51) {
        my $x = $npc->GetX();
        my $y = $npc->GetY();
        my $z = $npc->GetZ();
        my $h = $npc->GetHeading();
        quest::spawn2(223079,0,0,$x,$y + 15,$z,$h);
        quest::spawn2(223081,0,0,$x,$y + 25,$z,$h);
        quest::spawn2(223080,0,0,$x,$y - 15,$z,$h);
        quest::spawn2(223082,0,0,$x,$y - 25,$z,$h);
        quest::setnexthpevent(11);
}

    if($hpevent == 11) {
        my $x = $npc->GetX();
        my $y = $npc->GetY();
        my $z = $npc->GetZ();
        my $h = $npc->GetHeading();
        quest::spawn2(223079,0,0,$x,$y + 15,$z,$h);
        quest::spawn2(223081,0,0,$x,$y + 25,$z,$h);
        quest::spawn2(223080,0,0,$x,$y - 15,$z,$h);
        quest::spawn2(223082,0,0,$x,$y - 25,$z,$h);
}
 }

sub EVENT_SIGNAL {
  if ($signal == 66) {
    quest::depop();
} 
 }

sub EVENT_DEATH_COMPLETE {
        quest::signalwith(223157,12013,0);
        quest::say("My armies have failed. . . how could this have happened?");
        quest::stoptimer("terris");
}

sub EVENT_TIMER {
 my $x = $npc->GetX();
 my $y = $npc->GetY();
 if($timer eq "terris") { 
 if($x < -380 || $x > -199 || $y > 380 || $y < 199) {
    $npc->GMMove(-310,307,365,95);
  }
 }
}

