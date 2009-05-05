sub EVENT_SPAWN {
     if ($coirnav_start == 1) {
        $coirnav_start == undef; # We're started. Change variable to undef.

		quest::settimer(1,840); # 14 Minute timer for the event!!

		quest::spawn2(216048,0,0,$x+1,$y+1,$z,$h); # Spawn untargettable Coirnav, Avatar of Water

		quest::spawn2(216071,0,0,$x+15,$y,$z,$h); # Trash type 1

		quest::spawn2(216057,0,0,$x+30,$y,$z,$h); # Trash type 2

		quest::spawn2(216071,0,0,$x+45,$y,$z,$h);

		quest::spawn2(216057,0,0,$x+60,$y,$z,$h);

		quest::spawn2(216071,0,0,$x+75,$y,$z,$h);

		quest::spawn2(216057,0,0,$x+90,$y,$z,$h);

		quest::spawn2(216071,0,0,$x-15,$y,$z,$h);

		quest::spawn2(216057,0,0,$x-30,$y,$z,$h);

		quest::spawn2(216071,0,0,$x-45,$y,$z,$h);

		quest::spawn2(216057,0,0,$x-60,$y,$z,$h);

		quest::spawn2(216071,0,0,$x-75,$y,$z,$h);

		quest::spawn2(216057,0,0,$x-90,$y,$z,$h);

		quest::spawn2(216071,0,0,$x,$y+15,$z,$h);

		quest::spawn2(216057,0,0,$x,$y+30,$z,$h);

		quest::spawn2(216071,0,0,$x,$y+45,$z,$h);

		quest::spawn2(216057,0,0,$x,$y+60,$z,$h);

		quest::spawn2(216071,0,0,$x,$y+75,$z,$h);

		quest::spawn2(216057,0,0,$x,$y+90,$z,$h);

		quest::spawn2(216071,0,0,$x,$y-15,$z,$h);

		quest::spawn2(216057,0,0,$x,$y-30,$z,$h);

		quest::spawn2(216071,0,0,$x,$y-45,$z,$h);

		quest::spawn2(216057,0,0,$x,$y-60,$z,$h);

		quest::spawn2(216071,0,0,$x,$y-75,$z,$h);

		quest::spawn2(216057,0,0,$x,$y-90,$z,$h);

		quest::spawn2(216071,0,0,$x,$y,$z,$h);


		quest::spawn2(216070,0,0,$x+1,$y+1,$z,$h); # Spawn Named associated with this wave

     }
}

sub EVENT_SIGNAL {

	if ($signal == 1 && $coirnav_done == undef) {

        quest::setglobal(coirnav_start, 1 ,"H2"); # Set global for event start, so when depopzone hits, the event knows to continue.

        quest::depopzone(1);  # Depop everything, reset timers


		}

	if ($signal == 2 && $coirnav_done == undef) {
		quest::depopall(216071);
		quest::depopall(216057);


		quest::spawn2(216067,0,0,$x+15,$y,$z,$h);

		quest::spawn2(216060,0,0,$x+30,$y,$z,$h); 

		quest::spawn2(216067,0,0,$x+45,$y,$z,$h);

		quest::spawn2(216060,0,0,$x+60,$y,$z,$h);

		quest::spawn2(216067,0,0,$x+75,$y,$z,$h);

		quest::spawn2(216060,0,0,$x+90,$y,$z,$h);

		quest::spawn2(216067,0,0,$x-15,$y,$z,$h);

		quest::spawn2(216060,0,0,$x-30,$y,$z,$h);

		quest::spawn2(216067,0,0,$x-45,$y,$z,$h);

		quest::spawn2(216060,0,0,$x-60,$y,$z,$h);

		quest::spawn2(216067,0,0,$x-75,$y,$z,$h);

		quest::spawn2(216060,0,0,$x-90,$y,$z,$h);

		quest::spawn2(216067,0,0,$x,$y+15,$z,$h);

		quest::spawn2(216060,0,0,$x,$y+30,$z,$h);

		quest::spawn2(216067,0,0,$x,$y+45,$z,$h);

		quest::spawn2(216060,0,0,$x,$y+60,$z,$h);

		quest::spawn2(216067,0,0,$x,$y+75,$z,$h);

		quest::spawn2(216060,0,0,$x,$y+90,$z,$h);

		quest::spawn2(216067,0,0,$x,$y-15,$z,$h);

		quest::spawn2(216060,0,0,$x,$y-30,$z,$h);

		quest::spawn2(216067,0,0,$x,$y-45,$z,$h);

		quest::spawn2(216060,0,0,$x,$y-60,$z,$h);

		quest::spawn2(216067,0,0,$x,$y-75,$z,$h);

		quest::spawn2(216060,0,0,$x,$y-90,$z,$h);

		quest::spawn2(216067,0,0,$x,$y,$z,$h);



		quest::spawn2(216065,0,0,$x+1,$y+1,$z,$h); # Spawn Named associated with this wave

		}

	if ($signal == 3 && $coirnav_done == undef) {
		quest::depopall(216060);
		quest::depopall(216067);


		quest::spawn2(216076,0,0,$x+15,$y,$z,$h); 

		quest::spawn2(216074,0,0,$x+30,$y,$z,$h); 

		quest::spawn2(216076,0,0,$x+45,$y,$z,$h);

		quest::spawn2(216074,0,0,$x+60,$y,$z,$h);

		quest::spawn2(216076,0,0,$x+75,$y,$z,$h);

		quest::spawn2(216074,0,0,$x+90,$y,$z,$h);

		quest::spawn2(216076,0,0,$x-15,$y,$z,$h);

		quest::spawn2(216074,0,0,$x-30,$y,$z,$h);

		quest::spawn2(216076,0,0,$x-45,$y,$z,$h);

		quest::spawn2(216074,0,0,$x-60,$y,$z,$h);

		quest::spawn2(216076,0,0,$x-75,$y,$z,$h);

		quest::spawn2(216074,0,0,$x-90,$y,$z,$h);

		quest::spawn2(216076,0,0,$x,$y+15,$z,$h);

		quest::spawn2(216074,0,0,$x,$y+30,$z,$h);

		quest::spawn2(216076,0,0,$x,$y+45,$z,$h);

		quest::spawn2(216074,0,0,$x,$y+60,$z,$h);

		quest::spawn2(216076,0,0,$x,$y+75,$z,$h);

		quest::spawn2(216074,0,0,$x,$y+90,$z,$h);

		quest::spawn2(216076,0,0,$x,$y-15,$z,$h);

		quest::spawn2(216074,0,0,$x,$y-30,$z,$h);

		quest::spawn2(216076,0,0,$x,$y-45,$z,$h);

		quest::spawn2(216074,0,0,$x,$y-60,$z,$h);

		quest::spawn2(216076,0,0,$x,$y-75,$z,$h);

		quest::spawn2(216074,0,0,$x,$y-90,$z,$h);

		quest::spawn2(216076,0,0,$x,$y,$z,$h);



		quest::spawn2(216061,0,0,$x+1,$y+1,$z,$h); # Spawn Named associated with this wave

		}

	if ($signal == 4 && $coirnav_done == undef) { 

		quest::depop(216048); 
		quest::depopall(216074);
		quest::depopall(216076);



		quest::spawn2(216071,0,0,$x+15,$y,$z,$h); 

		quest::spawn2(216076,0,0,$x+30,$y,$z,$h); 

		quest::spawn2(216071,0,0,$x+45,$y,$z,$h);

		quest::spawn2(216076,0,0,$x+60,$y,$z,$h);

		quest::spawn2(216071,0,0,$x+75,$y,$z,$h);

		quest::spawn2(216076,0,0,$x+90,$y,$z,$h);

		quest::spawn2(216071,0,0,$x-15,$y,$z,$h);

		quest::spawn2(216076,0,0,$x-30,$y,$z,$h);

		quest::spawn2(216071,0,0,$x-45,$y,$z,$h);

		quest::spawn2(216076,0,0,$x-60,$y,$z,$h);

		quest::spawn2(216071,0,0,$x-75,$y,$z,$h);

		quest::spawn2(216076,0,0,$x-90,$y,$z,$h);

		quest::spawn2(216071,0,0,$x,$y+15,$z,$h);

		quest::spawn2(216076,0,0,$x,$y+30,$z,$h);

		quest::spawn2(216071,0,0,$x,$y+45,$z,$h);

		quest::spawn2(216076,0,0,$x,$y+60,$z,$h);

		quest::spawn2(216071,0,0,$x,$y+75,$z,$h);

		quest::spawn2(216076,0,0,$x,$y+90,$z,$h);

		quest::spawn2(216071,0,0,$x,$y-15,$z,$h);

		quest::spawn2(216076,0,0,$x,$y-30,$z,$h);

		quest::spawn2(216071,0,0,$x,$y-45,$z,$h);

		quest::spawn2(216076,0,0,$x,$y-60,$z,$h);

		quest::spawn2(216071,0,0,$x,$y-75,$z,$h);

		quest::spawn2(216076,0,0,$x,$y-90,$z,$h);

		quest::spawn2(216071,0,0,$x,$y,$z,$h);



		quest::spawn2(216094,0,0,$x+1,$y+1,$z,$h); # The Real Corinav

		}

	if($signal == 5 && $coirnav_done == undef) {

    	quest::stoptimer(1); # Stop timer. If we don't, the event gets set to 2H if we succeed or not.

        quest::repopzone();

		quest::delglobal(coirnav_done);

		quest::setglobal(coirnav_done, 3, "D5"); # You can't attempt this again for 5 days

	}

}

sub EVENT_TIMER {
		quest::depopall(216071);
		quest::depopall(216076);
    quest::repopzone();

	quest::stoptimer(1);

	quest::delglobal(coirnav_done);
	quest::delglobal(coirnav_start); # Delete variable that starts the whole event
	quest::setglobal(coirnav_done, 3, "H2"); # Fail, you can't attempt this again for 2 hours

}

	


	

