#Zone: Great Divide
#Short Name: greatdivide
#Zone ID: 118
#
#NPC Name: Bloodmaw
#NPC ID: 118027
#Quest Status: finished
#

sub EVENT_ITEM {
  if ($itemcount{30264} == 4) {
    quest::exp(100);
    quest::depop();
    quest::spawn2(118026,0,0,3172,-5931,-107.2,80.5); #spawn the bloody gnome captive
  }
}

#END of FILE Zone:greatdivide  ID:118027 -- Bloodmaw

