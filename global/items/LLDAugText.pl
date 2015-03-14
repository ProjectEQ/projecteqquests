sub EVENT_SCALE_CALC
{
   # max power values
   # guk 7, mir 7, mmc 8, ruj 8, tak 8
   # each theme accounts for 20% of the charm stats
   # 1-5 are each 2% of the full stats of the charm
   # All the 6-? together make up the other 50% of the stats

   my $charge = 5;
   if (defined $qglobals{GUKpower}) {
      if ($qglobals{GUKpower} <= 5) {
         $charge += $qglobals{GUKpower} * 20;
      }
      elsif ($qglobals{GUKpower} >= 7) {
         $charge += 200;
      }
      else {
         $charge += 150;
      }
   }

   if (defined $qglobals{MIRpower}) {
      if ($qglobals{MIRpower} <= 5) {
         $charge += $qglobals{MIRpower} * 20;
      }
      elsif ($qglobals{MIRpower} >= 7) {
         $charge += 200;
      }
      else {
         $charge += 150;
      }
   }

   if (defined $qglobals{MMCpower}) {
      if ($qglobals{MMCpower} <= 5) {
         $charge += $qglobals{MMCpower} * 20;
      }
      elsif ($qglobals{MMCpower} >= 8) {
         $charge += 200;
      }
      else {
         # 6 or 7
         $charge += 100 + (($qglobals{MMCpower} - 5) * 40)
      }
   }

   if (defined $qglobals{RUJpower}) {
      if ($qglobals{RUJpower} <= 5) {
         $charge += $qglobals{RUJpower} * 20;
      }
      elsif ($qglobals{RUJpower} >= 8) {
         $charge += 200;
      }
      else {
         # 6 or 7
         $charge += 100 + (($qglobals{RUJpower} - 5) * 40)
      }
   }

   if (defined $qglobals{TAKpower}) {
      if ($qglobals{TAKpower} <= 5) {
         $charge += $qglobals{TAKpower} * 20;
      }
      elsif ($qglobals{TAKpower} >= 8) {
         $charge += 200;
      }
      else {
         # 6 or 7
         $charge += 100 + (($qglobals{TAKpower} - 5) * 40)
      }
   }

   $questitem->SetScale($charge/1000);
}