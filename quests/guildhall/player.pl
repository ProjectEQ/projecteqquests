# Guild Hall Regen Pool Script - Player Portion

sub EVENT_SIGNAL {

   if ($signal == 1)
   {
      quest::settimer("DoRegen", 6);
   }
   
   if ($signal == 2)
   {
      quest::stoptimer("DoRegen");
   }
   
}

sub EVENT_ZONE {

   #Stop the timer if they zone
   quest::stoptimer("DoRegen");

}



sub EVENT_TIMER {

   if ($timer eq "DoRegen")
   {
      quest::stoptimer("DoRegen");
      
      # Set Regen Percent per tic here
      my $RegenPercent = 10;
      
      if ($client) {
         my $HPRatio = $client->GetHPRatio();
         if ($HPRatio < 100) {
            my $HPMax = $client->GetMaxHP();
            my $HPNew = (($HPRatio + $RegenPercent) / 100) * $HPMax;
            $client->SetHP($HPNew);
         }
         my $ManaRatio = $client->GetManaRatio();
         if ($ManaRatio < 100) {
            my $ManaMax = $client->GetMaxMana();
            my $ManaNew = (($ManaRatio + $RegenPercent) / 100) * $ManaMax;
            $client->SetMana($ManaNew);
         }
         my $EnduranceRatio = $client->GetEnduranceRatio();
         if ($EnduranceRatio < 100) {
            my $EnduranceMax = $client->GetMaxEndurance();
            my $EnduranceNew = (($EnduranceRatio + $RegenPercent) / 100) * $EnduranceMax;
            $client->SetEndurance($EnduranceNew);
         }
         quest::settimer("DoRegen", 6);
      }
   }

}

sub EVENT_POPUPRESPONSE {
	if($popupid == 666) {
		quest::selfcast(666);
	}
	if($popupid == 674) {
		quest::selfcast(674);
	}
	if($popupid == 15891) {
		#quest::selfcast(15891);
	}
	if($popupid == 2708) {
		quest::selfcast(2708);
	}
	if($popupid == 4176) {
		quest::selfcast(4176);
	}
	if($popupid == 534) {
		quest::selfcast(534);
	}
	if($popupid == 2707) {
		quest::selfcast(2707);
	}
	if($popupid == 2706) {
		quest::selfcast(2706);
	}
	if($popupid == 2709) {
		quest::selfcast(2709);
	}
	if($popupid == 2284) {
		quest::selfcast(2284);
	}
	if($popupid == 2031) {
		quest::selfcast(2031);
	}
	if($popupid == 3615) {
		quest::selfcast(3615);
	}
	if($popupid == 3794) {
		quest::selfcast(3794);
	}
	if($popupid == 6180) {
		#quest::selfcast(6180);
	}
	if($popupid == 5733) {
		quest::selfcast(5733);
	}
	if($popupid == 8237) {
		#quest::selfcast(8237);
	}
	if($popupid == 8967) {
		#quest::selfcast(8967);
	}
	if($popupid == 999) {
		#quest::selfcast();
	}
	if($popupid == 1000) {
		#quest::selfcast();
	}
	if($popupid == 160) {
		quest::movepc(160,-545,645,1,0);
	}
	if($popupid == 20543) {
		quest::selfcast(20543);
	}
	if($popupid == 21986) {
		#quest::selfcast(21986);
	}
}