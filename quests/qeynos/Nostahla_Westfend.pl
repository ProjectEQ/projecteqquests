sub EVENT_WAYPOINT_ARRIVE {
  if($wp == 3) {
	$npc->SetAppearance(1);
    	}
  if($wp == 4) {
    $npc->SetAppearance(0);
	}
  if($wp == 16) {
    quest::say("Gahlith, I'm going down to the docks to see if Ghul has anything new from overseas today. I'll be back in a little while.");
	}
}



sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings..  I am Nostahla Westfend, understudy of Gahlith, and Second Master Wizard of the Order of Three."); }
}
#END of FILE Zone:qeynos  ID:1129 -- Nostahla_Westfend 

$npc->SetAppearance(1);