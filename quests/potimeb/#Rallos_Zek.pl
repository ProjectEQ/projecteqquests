my $x;
my $y;
my $z;
my $h;

sub EVENT_AGGRO {
       quest::say("Defeating my sons in battle is impressive, but your legacy ends now. If no one else can stop these mortals, then the power of War shall!");
}

sub EVENT_SPAWN {
       quest::setnexthpevent(91);
       quest::settimer("rallos",1);
}

sub EVENT_HP {       
    if($hpevent == 91) {
        my $x = $npc->GetX();
        my $y = $npc->GetY();
        my $z = $npc->GetZ();
        my $h = $npc->GetHeading();
        quest::spawn2(quest::ChooseRandom(223002,223003),0,0,$x,$y + 15,$z,$h);
        quest::spawn2(quest::ChooseRandom(223002,223003),0,0,$x,$y + 25,$z,$h);
        quest::spawn2(quest::ChooseRandom(223002,223003),0,0,$x,$y - 15,$z,$h);
        quest::spawn2(quest::ChooseRandom(223002,223003),0,0,$x,$y - 25,$z,$h);
        quest::setnexthpevent(76);

}

    if($hpevent == 76) {
        my $x = $npc->GetX();
        my $y = $npc->GetY();
        my $z = $npc->GetZ();
        my $h = $npc->GetHeading();
        quest::spawn2(quest::ChooseRandom(223002,223003),0,0,$x,$y + 15,$z,$h);
        quest::spawn2(quest::ChooseRandom(223002,223003),0,0,$x,$y + 25,$z,$h);
        quest::spawn2(quest::ChooseRandom(223002,223003),0,0,$x,$y - 15,$z,$h);
        quest::spawn2(quest::ChooseRandom(223002,223003),0,0,$x,$y - 25,$z,$h);
        quest::setnexthpevent(56);
}

    if($hpevent == 56) {
        my $x = $npc->GetX();
        my $y = $npc->GetY();
        my $z = $npc->GetZ();
        my $h = $npc->GetHeading();
        quest::spawn2(quest::ChooseRandom(223002,223003),0,0,$x,$y + 15,$z,$h);
        quest::spawn2(quest::ChooseRandom(223002,223003),0,0,$x,$y + 25,$z,$h);
        quest::spawn2(quest::ChooseRandom(223002,223003),0,0,$x,$y - 15,$z,$h);
        quest::spawn2(quest::ChooseRandom(223002,223003),0,0,$x,$y - 25,$z,$h);
        quest::setnexthpevent(26);
}

    if($hpevent == 26) {
        my $x = $npc->GetX();
        my $y = $npc->GetY();
        my $z = $npc->GetZ();
        my $h = $npc->GetHeading();
        quest::spawn2(quest::ChooseRandom(223002,223003),0,0,$x,$y + 15,$z,$h);
        quest::spawn2(quest::ChooseRandom(223002,223003),0,0,$x,$y + 25,$z,$h);
        quest::spawn2(quest::ChooseRandom(223002,223003),0,0,$x,$y - 15,$z,$h);
        quest::spawn2(quest::ChooseRandom(223002,223003),0,0,$x,$y - 25,$z,$h);
        quest::spawn2(quest::ChooseRandom(223002,223003),0,0,$x,$y + 10,$z,$h);
        quest::spawn2(quest::ChooseRandom(223002,223003),0,0,$x,$y - 10,$z,$h);
}
 }

sub EVENT_DEATH {
        quest::signalwith(223158,13010,0);
        quest::say("My mantle shall never be passed on. . .");
        quest::stoptimer("rallos");
}

sub EVENT_SIGNAL {
  if ($signal == 66){
     quest::depop();
}
 }

sub EVENT_TIMER {
 my $x = $npc->GetX();
 my $y = $npc->GetY();
 if($timer eq "rallos") { 
 if($x > 370 || $x < 170 || $y > -170 || $y < -370) {
    $npc->GMMove(264,-279,18.75,217.5);
  }
 }
}
