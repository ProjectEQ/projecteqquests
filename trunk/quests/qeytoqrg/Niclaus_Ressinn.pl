sub EVENT_WAYPOINT_ARRIVE {
	if($wp eq 4) {
	$npc->SetAppearance(4);
	$npc->SetAppearance(0);
	}
	if($wp eq 5) {
	quest::SetRunning(1);
	}
	if($wp eq 6) {
	plugin::DoAnim(wave);
	}
	if($wp eq 7) {
	quest::say("Guard! Come quick! The undead gather near the ruins of Geupal!");
	quest::SetRunning(0);
	}
	if($wp eq 8) {
	$npc->SetAppearance(4);
	$npc->SetAppearance(0);
	}
	if($wp eq 9) {
	plugin::DoAnim(bash);
	}
	if($wp eq 10) {
	quest::say("Shh.. The fiends seems to dwell amongst the ruins. They wander off but eventually congregate back here. Shh.. OK NOW! RODCET PROTECT US!");
	quest::SetRunning(1);
	}
	if($wp eq 11) {
	quest::SetRunning(0);
	}
}

sub EVENT_COMBAT {
	if($combat_state == 1){
	quest::say("Guards!! Guards!!");
	}
}

sub EVENT_AGGRO {
   quest::say("Guards!! Guards!!");
}




sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hail. $name.  I am Niclaus Ressinn. loyal Paladin of Life. I am scouting the Qeynos Hills on orders from High Priestess Jahnda.  We have received reports of undead prowling these hills of late."); }
}
#END of FILE Zone:qeytoqrg  ID:4112 -- Niclaus_Ressinn 

