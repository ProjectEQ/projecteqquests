sub EVENT_COMBAT {
 if($combat_state == 1){
 quest::say("Fear the blades of the Iksar!!");
 }
 if($combat_state == 0) {
 quest::say("Another victory for the Legion of Cabilis.");
 }
}
