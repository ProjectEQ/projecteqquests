sub EVENT_ENTERZONE {

  if (($status <= 19) && (!defined($qglobals{dread_access})) ) {
     $client->Message(15, "You must be flagged for Dreadspire to enter this zone.");
     quest::movepc(152, 0,0,-30);
     }

}


sub EVENT_CLICKDOOR {
#$GetPlN = $client->GetName();
#quest::emote("TEST: I suck my name is $name  $qglobals{PXX_Door} x $client x $GetPlN x $doorid ");
	if ($status >= 19) {
       $client->Message(15, "You've clicked $doorid , global is $qglobals{PXX_DoorExit})");
     
	  }       

	#PXX Door Enter - Closes when PXX 98%. Open otherwise
	if ( (($doorid == 258) || ($doorid == 2) ) && (!defined($qglobals{PXX_Door})) ) {
      	$client->Message(15, "You hear the sound of gears grinding");
       quest::forcedooropen(2);
	}

       #PXX Door Exit - Open only if PXX dead
	if ( ( ($doorid == 259) || ($doorid == 3) ) && (!defined($qglobals{PXX_DoorExit})) ) {
	#if ( ($doorid == 259) && (!defined($qglobals{PXX_DoorExit})) ) {
      	$client->Message(15, "You hear the sound of gears grinding");
	quest::forcedooropen(3);
	}

       #PXX Door Exit - Open only if PXX dead
	if ( ( ($doorid == 260) || ($doorid == 4) ) && (!defined($qglobals{PXX_DoorExit})) ) {
      	$client->Message(15, "You hear the sound of gears grinding");
       quest::forcedooropen(4);
	}

       #PKK Door Enter - Closes when PKK 98%. Open otherwise
	if ( (($doorid == 261) || ($doorid == 5) ) && (!defined($qglobals{PKK_Door})) ) {
      	$client->Message(15, "You hear the sound of gears grinding");
       quest::forcedooropen(5);
	}

       #PKK Door Exit - Open only if PKK dead
	if ( (($doorid == 262) || ($doorid == 6) ) && (!defined($qglobals{PKK_DoorExit})) ) {
      	$client->Message(15, "You hear the sound of gears grinding");
	quest::forcedooropen(6);
	}

	#PKK Door Exit - Open only if PKK dead
	if ( (($doorid == 263) || ($doorid == 7) ) && (!defined($qglobals{PKK_DoorExit})) ) {
      	$client->Message(15, "You hear the sound of gears grinding");
	quest::forcedooropen(7);
	}

       #ZSB Door Enter - Closes when 98%. Open otherwise
	if ( (($doorid == 264) || ($doorid == 8) ) && (!defined($qglobals{ZSB_Door})) ) {
      	$client->Message(15, "You hear the sound of gears grinding");
       quest::forcedooropen(8);
	}

	#ZSB Door Exit - Open only if dead
	if ( (($doorid == 265) || ($doorid == 4) )&& (!defined($qglobals{ZSB_DoorExit})) ) {
      	$client->Message(15, "You hear the sound of gears grinding");
	quest::forcedooropen(10);
	}

	#ZMD Door Enter - Closes when 98%. Open otherwise
	if ( (($doorid == 269) || ($doorid == 13) ) && (!defined($qglobals{ZMD_Door})) ) {
      	$client->Message(15, "You hear the sound of gears grinding");
       quest::forcedooropen(13);
	}

	#ZMD Door Exit - Open only if dead
	if ( (($doorid == 268)|| ($doorid == 12) ) && (!defined($qglobals{ZMD_DoorExit})) ) {
      	$client->Message(15, "You hear the sound of gears grinding");
	quest::forcedooropen(12);
	}

	#PRT Door Enter - Closes when 98%. Open otherwise
	if ( (($doorid == 279) || ($doorid == 23) ) && (!defined($qglobals{PRT_Door})) ) {
      	$client->Message(15, "You hear the sound of gears grinding");
       quest::forcedooropen(23);
	}

	#PRT Door Exit - Closes when 98%. Open otherwise
	if ( (($doorid == 278) || ($doorid == 22) ) && (!defined($qglobals{PRT_DoorExit})) ) {
      	$client->Message(15, "You hear the sound of gears grinding");
       quest::forcedooropen(22);
	}

	#PRT Door Exit - Closes when 98%. Open otherwise
	if ( (($doorid == 273) || ($doorid == 17) ) && (!defined($qglobals{PRT_DoorExit})) ) {
      	$client->Message(15, "You hear the sound of gears grinding");
       quest::forcedooropen(17);
	}

	#ZKP Door Enter - Closes when 98%. Open otherwise
	if ( (($doorid == 272) || ($doorid == 16) ) && (!defined($qglobals{ZKP_Door})) ) {
      	$client->Message(15, "You hear the sound of gears grinding");
       quest::forcedooropen(16);
	}

	#ZKP Door Exit - Open only if dead
	if ( (($doorid == 271) || ($doorid == 15) ) && (!defined($qglobals{ZKP_DoorExit})) ) {
      	$client->Message(15, "You hear the sound of gears grinding");
	quest::forcedooropen(15);
	}

	#ZYV Door Enter - Closes when 98%. Open otherwise
	if ( (($doorid == 277) || ($doorid == 21) ) && (!defined($qglobals{ZYV_Door})) ) {
      	$client->Message(15, "You hear the sound of gears grinding");
       quest::forcedooropen(21);
	}

	#ZYV Door Exit - Open only if dead
	if ( (($doorid == 276) || ($doorid == 20) ) && (!defined($qglobals{ZYV_DoorExit})) ) {
      	$client->Message(15, "You hear the sound of gears grinding");
	quest::forcedooropen(20);
	}

}
