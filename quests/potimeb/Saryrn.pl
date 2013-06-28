my $x;
my $y;
my $z;
my $h;

sub EVENT_AGGRO {
       quest::say("No! That's impossible! Be gone from this place, mortals!");
}

sub EVENT_SPAWN {
       quest::setnexthpevent(91);
       quest::settimer("saryrn",1);
}

sub EVENT_HP {       
    if($hpevent == 91) {
        my $x = $npc->GetX();
        my $y = $npc->GetY();
        my $z = $npc->GetZ();
        my $h = $npc->GetHeading();
        quest::spawn2(223083,0,0,$x,$y + 15,$z,$h);
        quest::spawn2(223085,0,0,$x,$y + 25,$z,$h);
        quest::spawn2(223084,0,0,$x,$y - 15,$z,$h);
        quest::spawn2(223086,0,0,$x,$y - 25,$z,$h);
        quest::setnexthpevent(51);
}

    if($hpevent == 51) {
        my $x = $npc->GetX();
        my $y = $npc->GetY();
        my $z = $npc->GetZ();
        my $h = $npc->GetHeading();
        quest::spawn2(223083,0,0,$x,$y + 15,$z,$h);
        quest::spawn2(223085,0,0,$x,$y + 25,$z,$h);
        quest::spawn2(223084,0,0,$x,$y - 15,$z,$h);
        quest::spawn2(223086,0,0,$x,$y - 25,$z,$h);
        quest::setnexthpevent(11);
}

    if($hpevent == 11) {
        my $x = $npc->GetX();
        my $y = $npc->GetY();
        my $z = $npc->GetZ();
        my $h = $npc->GetHeading();
        quest::spawn2(223083,0,0,$x,$y + 15,$z,$h);
        quest::spawn2(223085,0,0,$x,$y + 25,$z,$h);
        quest::spawn2(223084,0,0,$x,$y - 15,$z,$h);
        quest::spawn2(223086,0,0,$x,$y - 25,$z,$h);
}
 }

sub EVENT_DEATH_COMPLETE {
        quest::signalwith(223157,12012,0);
        quest::say("My minions. . . my power. . . lost. Impossible. . .");
        quest::stoptimer("saryrn");
}

sub EVENT_SIGNAL {
  if ($signal == 66){
     quest::depop();
}
 }

sub EVENT_TIMER {
 my $x = $npc->GetX();
 my $y = $npc->GetY();
 if($timer eq "saryrn") { 
 if($x < -380 || $x > -199 || $y < -380 || $y > - 199) {
    $npc->GMMove(-320,-316,358,32.5);
  }
 }
}


