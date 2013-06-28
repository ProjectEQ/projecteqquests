sub EVENT_AGGRO {
quest::signalwith(209038,1,1);
quest::settimer(1,31);
}

sub EVENT_DEATH_COMPLETE {
quest::spawn2(209101,0,0,$x,$y,$z,$h);
quest::signalwith(209038,2,1);
quest::stoptimer(1);
}

sub_EVENT_TIMER {

quest::stoptimer(1);
quest::settimer(1,31);
quest::signalwith(209038,2,1);


}
