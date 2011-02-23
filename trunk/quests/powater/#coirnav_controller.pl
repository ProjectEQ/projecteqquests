sub EVENT_SPAWN { #Only needed for #repop during testing

    	quest::stoptimer(1); # Stop timer
    	quest::stoptimer(2); # Stop timer
    	quest::stoptimer(3); # Stop timer
    	quest::stoptimer(4); # Stop timer
    	quest::stoptimer(5); # Stop timer
    	quest::stoptimer(6); # Stop timer
    	quest::stoptimer(7); # Stop timer
       	quest::delglobal("coirnav_kick"); # Delete player kickout timer check used by player.pl

}

sub EVENT_SIGNAL {

	if ($signal == 1 && $qglobals{coirnav_done} == undef) {

       	quest::setglobal("coirnav_kick", 3, 7, "M15"); # Set player kickout check used by player.pl 100 = kick, 3 = well just to validate.

        quest::depop(216048); # Depop spawned fake coirnav

        my $namedcount = 0; # Sets the named counter for later use
		quest::spawn2(216048,0,0,$x-5,$y,$z-10,69); # Spawn untargettable Coirnav, Avatar of Water

       	quest::settimer(1,895); # 15 Minute timer for the kickout event!!
       	quest::settimer(2,180); # 3 Minute timer for second wave spawn
       	quest::settimer(3,300); # 5 Minute timer for third wave
       	quest::settimer(4,600); # 10 Minute timer for the emote
       	quest::settimer(5,720); # 12 Minute timer for the emote
       	quest::settimer(6,840); # 14 Minute timer for the emote

        quest::signalwith(216048,1,0); #Signal fake coirnav for first emote

        $count = 0;
        while ($count <= 24) {
            $randX = int(rand(55));
            $randY = int(rand(75));
            $randZ = int(rand(20));
            $randH = int(rand(260));
            $randPNX = int(rand(2));
            $randPNY = int(rand(2));
            $randPNZ = int(rand(2));
            if($randPNX == 1) {
                $randX = -$randX;
            }
            if($randPNY == 1) {
                $randY = -$randY;
            }
            if($randPNZ == 1) {
                $randZ = -$randZ;
            }
        	quest::spawn2(216071,0,0,$x+$randX,$y+$randY,$z+$randZ,$randH); # Triloun Vaporfiend
            $count ++;
		}

		quest::spawn2(216070,0,0,$x+5,$y-20,$z+5,69); # Spawn #Pwelon_of_Vapor associated with this wave
       	    quest::setglobal("coirnav_wave", 1, 7, "M15");
	}

	if ($signal == 2 && $qglobals{coirnav_done} == undef) { # Called when the 3 nameds die.

        my $pweloncheck = $entity_list->GetMobByNpcTypeID(216070);
        my $nrindacheck = $entity_list->GetMobByNpcTypeID(216065);
        my $vamuilcheck = $entity_list->GetMobByNpcTypeID(216061);

        if(!$pweloncheck && !$nrindacheck && !$vamuilcheck){ # You sank my battleship.

    		quest::depop(216048); # Depop fake coirnav

            #Fear my corona of little bastards! Or, you could just DPS me down and this lot will depop.

        $count = 0;
        while ($count <= 26) {
            $randX = int(rand(55));
            $randY = int(rand(75));
            $randZ = int(rand(20));
            $randH = int(rand(260));
            $randPNX = int(rand(2));
            $randPNY = int(rand(2));
            $randPNZ = int(rand(2));
            if($randPNX == 1) {
                $randX = -$randX;
            }
            if($randPNY == 1) {
                $randY = -$randY;
            }
            if($randPNZ == 1) {
                $randZ = -$randZ;
            }
            if ($count <= 9) {
                quest::spawn2(216057,0,0,$x+$randX,$y+$randY,$z+$randZ,$randH); #Triloun Vaporling
            }
            if (($count >= 10) && ($count <=18)) {
            	quest::spawn2(216067,0,0,$x+$randX,$y+$randY,$z+$randZ,$randH); #Regrua Waterling
            }
            if (($count >= 19) && ($count <=26)) {
            	quest::spawn2(216074,0,0,$x+$randX,$y+$randY,$z+$randZ,$randH); #Hraquis Iceling
            }

            $count ++;
		}

    		quest::spawn2(216094,0,0,$x,$y,$z-10,69); # The Real Corinav
	    }
    }
	if($signal == 4) {
		
        if ($qlobals{coirnav_wave} == 3) { #make sure we're on 3rd wave
			
      		quest::depop(216070); # Depop "tough" #Pwelon_of_Vapor
      		quest::depop(216065); # Depop "tough" #Nrinda_of_Ice
      		quest::depop(216061); # Depop "tough" #Vamuil_of_Water

    		quest::spawn2(216109,0,0,$x+5,$y-20,$z+5,69); # Repop weak Pwelon_of_Vapor
    		quest::spawn2(216108,0,0,$x-10,$y,$z+5,69); # Repop weak Nrinda_of_Ice
    		quest::spawn2(216110,0,0,$x+5,$y+20,$z+5,69); # Repop weak Vamuil_of_Water
       	        quest::setglobal("coirnav_wave", 4, 7, "M15");

        }
    }


	if($signal == 5 && $qglobals{coirnav_done} == undef) { #Signalled on death of the real coirnav

    	quest::stoptimer(1); # Stop timer. If we don't, the event gets set to 2H if we succeed or not.
    	quest::stoptimer(2); # Stop timer
    	quest::stoptimer(3); # Stop timer
    	quest::stoptimer(4); # Stop timer
    	quest::stoptimer(5); # Stop timer
    	quest::stoptimer(6); # Stop timer
    	quest::stoptimer(7); # Stop timer
    	quest::depopall(216074); #Depop any remaining trash creatures Triloun-057, regrua-067, hraquis-074
    	quest::depopall(216067);
    	quest::depopall(216057);

		quest::delglobal("coirnav_done");
		quest::setglobal("coirnav_done", 3, 7, "D5"); # You can't attempt this again for 5 days

       	quest::delglobal("coirnav_kick"); # Delete player kickout timer check used by player.pl

    	quest::spawn2(216066,0,0,$x,$y,$z,69); #Spawn Essence of Water
	}
}

sub EVENT_TIMER {

    if($timer == 1) { # This  gets called when you fail because of timeout

    	quest::stoptimer(1); # Stop last timer - rest of them are stopped by now

    	quest::depopall(216071); #Depop any remaining trash creatures
    	quest::depopall(216076);
    	quest::depopall(216074);
    	quest::depopall(216060);
    	quest::depopall(216067);
    	quest::depopall(216057);

        quest::signalwith(216048,7,0); #Signal fake coirnav for banish emote
        quest::signalwith(216094,7,0); #or  real coirnav for banish emote

    	quest::depop(216061); # Depop any nameds up - sorry.
    	quest::depop(216070);
    	quest::depop(216065);
    	quest::depop(216094);

    	quest::delglobal("coirnav_done"); # Reset the event variable
	##quest::setglobal("coirnav_done", 3, 7, "H2"); #DEBUG
    	quest::setglobal("coirnav_done", 3, 7, "H2"); # You can't attempt this again for 2 hours

       	quest::delglobal("coirnav_kick"); # Delete player kickout timer check used by player.pl
       	quest::setglobal("coirnav_kick", 100, 7, "M1"); # Set player kickout timer check used by player.pl

        quest::settimer(7,45); # Reset kickout timer

    }

    if($timer == 2){ # 2nd wave of trash+named

        quest::signalwith(216048,2,0); #Signal fake coirnav for second wave emote

        $count = 0;
        while ($count <= 24) {
            $randX = int(rand(55));
            $randY = int(rand(75));
            $randZ = int(rand(20));
            $randH = int(rand(260));
            $randPNX = int(rand(2));
            $randPNY = int(rand(2));
            $randPNZ = int(rand(2));
            if($randPNX == 1) {
                $randX = -$randX;
            }
            if($randPNY == 1) {
                $randY = -$randY;
            }
            if($randPNZ == 1) {
                $randZ = -$randZ;
            }
        	quest::spawn2(216076,0,0,$x+$randX,$y+$randY,$z+$randZ,$randH); #Hraquis icefiend
            $count ++;
		}

		quest::spawn2(216061,0,0,$x-10,$y,$z+5,69); # Spawn #Nrinda_of_Ice associated with this wave

       	quest::setglobal("coirnav_wave", 2, 7, "M12");
    	quest::stoptimer(2); # Stop timer

    }

    if($timer == 3){ # 3nd wave of trash+named

        quest::signalwith(216048,3,0); #Signal fake coirnav for third wave emote

        $count = 0;
        while ($count <= 24) {
            $randX = int(rand(55));
            $randY = int(rand(75));
            $randZ = int(rand(30));
            $randH = int(rand(260));
            $randPNX = int(rand(2));
            $randPNY = int(rand(2));
            $randPNZ = int(rand(2));
            if($randPNX == 1) {
                $randX = -$randX;
            }
            if($randPNY == 1) {
                $randY = -$randY;
            }
            if($randPNZ == 1) {
                $randZ = -$randZ;
            }
        	quest::spawn2(216060,0,0,$x+$randX,$y+$randY,$z+$randZ,$randH); # Regrua waterfiend
            $count ++;
		}

		quest::spawn2(216065,0,0,$x+5,$y+20,$z+5,69); # Spawn #Vamuil_of_Water associated with this wave

       	quest::setglobal("coirnav_wave", 3, 7, "M10");
    	quest::stoptimer(3); # Stop timer

    }

    # We signal both fake and real coirnav here - only one will actually be up, but these emotes occour at any time in the event.

    if($timer == 4){ # Charging kickout
        quest::stoptimer(4);
        quest::signalwith(216048,4,0); #Signal fake coirnav
        quest::signalwith(216094,4,0); #or signal real one
    }

    if($timer == 5){ # Charging kickout 2
        quest::stoptimer(5);
        quest::signalwith(216048,5,0); #Signal fake coirnav
        quest::signalwith(216094,5,0); #or signal real one
    }

    if($timer == 6){ # Last emote. You're outtatime.
        quest::stoptimer(6);
        quest::signalwith(216048,6,0); #Signal fake coirnav
        quest::signalwith(216094,6,0); #or signal real one
    }
    if($timer == 7){ # Last emote. You're outtatime.
        quest::stoptimer(7);
       	quest::delglobal("coirnav_kick"); # Delete player kickout timer check used by player.pl
    }


}
