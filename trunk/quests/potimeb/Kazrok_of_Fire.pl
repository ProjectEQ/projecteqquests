sub EVENT_AGGRO {
    quest::emote("roars, 'Mortals, here? I will torch you alive for this atrocity!'");
}

sub EVENT_SPAWN {
    quest::setnexthpevent(76);
}

sub EVENT_DEATH {
    quest::signalwith(223190,14020,0);
    quest::say("You can extinguish the flame of my existence, but you are nothing compared to the might of Fennin Ro!");
}

sub EVENT_SIGNAL {
  if ($signal == 66) {
    quest::depop();
}
 }

sub EVENT_HP {       
    if($hpevent == 76) {
        my $x = $npc->GetX();
        my $y = $npc->GetY();
        my $z = $npc->GetZ();
        my $h = $npc->GetHeading();
        quest::spawn2(quest::ChooseRandom(223094,223095),0,0,$x,$y + 15,$z,$h);
        quest::spawn2(quest::ChooseRandom(223094,223095),0,0,$x,$y - 15,$z,$h);
        quest::setnexthpevent(51);

}

    if($hpevent == 51) {
        my $x = $npc->GetX();
        my $y = $npc->GetY();
        my $z = $npc->GetZ();
        my $h = $npc->GetHeading();
        quest::spawn2(quest::ChooseRandom(223094,223095),0,0,$x,$y + 15,$z,$h);
        quest::spawn2(quest::ChooseRandom(223094,223095),0,0,$x,$y - 15,$z,$h);
        quest::setnexthpevent(21);
}

    if($hpevent == 21) {
        my $x = $npc->GetX();
        my $y = $npc->GetY();
        my $z = $npc->GetZ();
        my $h = $npc->GetHeading();
        quest::spawn2(quest::ChooseRandom(223094,223095),0,0,$x,$y + 15,$z,$h);
        quest::spawn2(quest::ChooseRandom(223094,223095),0,0,$x,$y - 15,$z,$h);
}
 }
