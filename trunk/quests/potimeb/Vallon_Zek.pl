my $x;
my $y;
my $z;
my $h;

sub EVENT_AGGRO {
       quest::say("Welcome to your final stand, mortals. You shall progress no farther!");
}

sub EVENT_SPAWN {
       quest::setnexthpevent(50);
       quest::settimer("vzek",1);
}

sub EVENT_HP {       
    if($hpevent == 50) {
        my $x = $npc->GetX();
        my $y = $npc->GetY();
        my $z = $npc->GetZ();
        my $h = $npc->GetHeading();
        quest::spawn2(223164,0,0,$x,$y - 25,$z,$h);
        quest::spawn2(223164,0,0,$x,$y + 25,$z,$h);
      
}
 }

sub EVENT_SIGNAL {
  if ($signal == 66) {
    quest::depop();
} 
 }

sub EVENT_DEATH {
        quest::signalwith(223157,12011,0);
        quest::say("You stand to gain no honor in my death. May the wrath of Rallos Zek strike you down with great vengeance.");
        quest::stoptimer("vzek");
}

sub EVENT_TIMER {
 my $x = $npc->GetX();
 my $y = $npc->GetY();
 if($timer eq "vzek") { 
 if($x < 260) {
    $npc->GMMove(405,75,358,192);
  }
 }
}
