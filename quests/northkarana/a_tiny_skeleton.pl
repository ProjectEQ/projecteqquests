#NPC: a_tiny_skeleton (13118)  Zone: northkarana
#Quest: Tiny Skeletons
#Involves:  Watchman_Dexlin (northkarana)
#           Narron_Jenork (akanon)
#           a_tiny_skeleton (northkarana)
#                
#by Qadar

sub EVENT_SIGNAL{
  if($signal == 1){                  # Attack player $skelatk when Watchman Dexlin says to
    quest::attack("$skelatk");
  }
  if($signal == 2){                  # spawn check triggered by Watchman Dexlin - Set $skelup = 1 if any tiny skeletons are currently spawned
    quest::setglobal("skelup","1","3","F");
  }
}
