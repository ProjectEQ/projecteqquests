my $instid = 0;

sub EVENT_SPAWN {
  quest::settimer(1,20);  #move timer
}

sub EVENT_AGGRO {
  quest::spawn2(quest::ChooseRandom(296059,296060,296061,296062,296063,296064),0,0,-80,-670,-127,121);
  quest::settimer(3,60);
  $instid = quest::GetInstanceID("inktuta",0);
}

sub EVENT_TIMER {
  if($timer == 1) {
    quest::stoptimer(1);
    quest::settimer(2,20);
    $npc->GMMove(-103,-652,-127,125);	#move loc mirror
    $npc->WipeHateList();
  }
  elsif($timer == 2) {
    quest::stoptimer(2);
    quest::settimer(1,20);
    $npc->GMMove(-55,-653,-127,121);  #move loc true
    $npc->WipeHateList();
  }
  elsif($timer == 3) {
    #random cursebearer
    quest::spawn2(quest::ChooseRandom(296059,296060,296061,296062,296063,296064),0,0,-75,-653,-127,121);
  }
}

sub EVENT_DEATH {
  quest::say("This is but a temporary setback. I will return.");
  quest::depop(296066);
  quest::spawn2(296071,0,0,-55, -653, -127, $h); #Jomica_the_Unforgiven
  quest::spawn2(296068,0,0,-127,-652,-127, 121); #bones (loot)
  quest::setglobal($instid.'_inktuta_status',10,3,"H6");
}