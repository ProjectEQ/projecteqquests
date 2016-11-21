#Notifies Jeplak_Lord_of_Srerendi that npc was killed in the camp.
sub EVENT_AGGRO {
    quest::settimer("tumadds",55);
}

sub EVENT_DEATH_COMPLETE {
    quest::signal(210179,0);
    quest::stoptimer("tumadds");
}

sub EVENT_TIMER {
  if($timer eq "tumadds") {
    if($npc->IsEngaged()) {
        quest::spawn2(210247,0,0,($x + 10),$y,$z,$h);
        quest::spawn2(210247,0,0,($x + 10),$y,$z,$h);
        quest::spawn2(210247,0,0,($x + 10),$y,$z,$h);
        quest::spawn2(210247,0,0,($x + 10),$y,$z,$h);
        quest::spawn2(210247,0,0,($x + 10),$y,$z,$h);
        quest::spawn2(210247,0,0,($x + 10),$y,$z,$h);
        quest::spawn2(210247,0,0,($x + 10),$y,$z,$h);
        quest::spawn2(210247,0,0,($x + 10),$y,$z,$h);
        quest::spawn2(210247,0,0,($x + 10),$y,$z,$h);
    } else {
        quest::stoptimer("tumadds");
    }    
}
}
