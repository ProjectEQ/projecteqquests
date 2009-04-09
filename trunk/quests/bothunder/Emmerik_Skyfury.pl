sub EVENT_DEATH {
quest::spawn2(209102,0,0,$x,$y,$z,$h);
quest::signalwith(209034,2,1);
}

sub EVENT_AGGRO {
quest::signalwith(209034,1,1);
quest::settimer(1,31);
}

sub EVENT_TIMER {

quest::signalwith(209034,1,1);

}


sub_EVENT_DEATH {

quest::stoptimer(1);

}
