sub EVENT_SIGNAL {

	if ($signal == 1 && $coirnav_done == undef) { 

                quest::depopzone(1);
                
		quest::settimer(1,840);

		quest::spawn2(216048,0,0,$x+1,$y+1,$z,$h); 



		quest::spawn2(216071,0,0,$x+15,$y,$z,$h); 

		quest::spawn2(216057,0,0,$x+30,$y,$z,$h); 

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



		quest::spawn2(216070,0,0,$x+1,$y+1,$z,$h); 

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



		quest::spawn2(216065,0,0,$x+1,$y+1,$z,$h); 

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



		quest::spawn2(216061,0,0,$x+1,$y+1,$z,$h); 

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



		quest::spawn2(216094,0,0,$x+1,$y+1,$z,$h); 

		}

	if($signal == 5 && $coirnav_done == undef) {

                quest::repopzone();

		quest::delglobal(coirnav_done);

		quest::setglobal(coirnav_done, 3, "D5");

	}

}

sub EVENT_TIMER {
        quest::depopzone(0);
        
        quest::repopzone();

	quest::stoptimer(1);

	quest::delglobal(coirnav_done);

	quest::setglobal(coirnav_done, 3, "H2");

}

	

