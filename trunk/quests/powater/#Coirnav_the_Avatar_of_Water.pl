sub EVENT_DEATH {

	quest::signalwith(216107,5,0);
        quest::say("Im working");

	quest::spawn2(216066,0,0,$x+1,$y+1,$z,$h);

}

