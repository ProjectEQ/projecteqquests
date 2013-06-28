sub EVENT_SPAWN {
    quest::setnexthpevent(91);
}

sub EVENT_DEATH_COMPLETE {
    quest::signalwith(223189,14038,0);
    quest::say("Your efforts are commendable, but you will not get far. By Coirnav, you are doomed to failure.");
}

sub EVENT_SIGNAL {
  if ($signal == 66) {
    quest::depop();
}
 }

sub EVENT_HP {       
    if($hpevent == 91) {
        my $x = $npc->GetX();
        my $y = $npc->GetY();
        my $z = $npc->GetZ();
        my $h = $npc->GetHeading();
        quest::spawn2(quest::ChooseRandom(223092,223093),0,0,$x,$y + 15,$z,$h);
        quest::spawn2(quest::ChooseRandom(223100,223115),0,0,$x,$y - 15,$z,$h);
        quest::setnexthpevent(46);

}

    if($hpevent == 46) {
        my $x = $npc->GetX();
        my $y = $npc->GetY();
        my $z = $npc->GetZ();
        my $h = $npc->GetHeading();
        quest::spawn2(223225,0,0,$x,$y + 15,$z,$h);
        quest::spawn2(223193,0,0,$x,$y - 15,$z,$h);
}
 }
