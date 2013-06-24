#     #Trigger_Ikkinz_4.pl
sub EVENT_SPAWN {
  quest::set_proximity($x-50,$x+50,$y-70,$y+70);
}

sub EVENT_SIGNAL {
  if($signal == 1) {
      $counter += 1;
   }
  if($counter == 2) {
    quest::signalwith(294611,1,4);
    }
}

quest::enable_proximity_say();
sub EVENT_PROXIMITY_SAY {
  if ($text=~/return/i) {
   $InInstanceIkky7 = quest::GetInstanceID("ikkinz",6);
    quest::MovePCInstance(294,$InInstanceIkky7,500,-615,-50,186);
    }
  } 