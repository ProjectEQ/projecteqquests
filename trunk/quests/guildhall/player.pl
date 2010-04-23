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