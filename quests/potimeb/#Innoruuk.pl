my $x;
my $y;
my $z;
my $h;
sub EVENT_AGGRO {
       quest::say("Your kind have invaded my home for long enough. If you thought you knew what hate was before, I have one last lesson to teach you!");
}

sub EVENT_SPAWN {
       quest::setnexthpevent(81);
       quest::settimer("innoruuk",1);
}

sub EVENT_HP {       
    if($hpevent == 81) {
        my $x = $npc->GetX();
        my $y = $npc->GetY();
        my $z = $npc->GetZ();
        my $h = $npc->GetHeading();
        quest::spawn2(quest::ChooseRandom(223130,223145),0,0,$x,$y + 15,$z,$h);
        quest::spawn2(quest::ChooseRandom(223130,223145),0,0,$x,$y + 25,$z,$h);
        quest::spawn2(quest::ChooseRandom(223130,223145),0,0,$x,$y - 15,$z,$h);
        quest::setnexthpevent(21);

}

    if($hpevent == 21) {
        my $x = $npc->GetX();
        my $y = $npc->GetY();
        my $z = $npc->GetZ();
        my $h = $npc->GetHeading();
        quest::spawn2(quest::ChooseRandom(223130,223145),0,0,$x,$y + 15,$z,$h);
        quest::spawn2(quest::ChooseRandom(223130,223145),0,0,$x,$y + 25,$z,$h);
        quest::spawn2(quest::ChooseRandom(223130,223145),0,0,$x,$y - 15,$z,$h);
        quest::spawn2(quest::ChooseRandom(223130,223145),0,0,$x,$y - 25,$z,$h);

}
 }

sub EVENT_DEATH {
        quest::signalwith(223158,13010,0);
        quest::stoptimer("innoruuk");
        quest::say("This cannot be. . . I will return. . . somehow, in some way. . .");
}

sub EVENT_SIGNAL {
  if ($signal == 66){
     quest::depop();
}
 }

sub EVENT_TIMER {
 my $x = $npc->GetX();
 my $y = $npc->GetY();
 if($timer eq "innoruuk") { 
 if($x > 380 || $x < 210 || $y > 380 || $y < 210) {
    $npc->GMMove(303.3,306,13.3,161.5);
  }
 }
}

