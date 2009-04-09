sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hello. $name. I am Felodius Sworddancer.  A travelling historian and storyteller.  Would you care to hear a [story]?");
}
if($text=~/story/i){
quest::say("I could treat you to a story about an ogre legend!  Or perhaps you would like to hear a story about the [gnome] who cried kobold?");
}
if($text=~/gnome/i){
quest::say("Once upon a time. there was a young gnome boy.   His job was to repair the clockworks outside Ak'Anon and tell the guards if there was any trouble from kobolds.  Well. one day. the boy decided to play a prank on the guards.  He decided it would be fun to watch the guards. in full plate armor. run from the gates of Ak'Anon to the valley that led to the Faydark [forest].");
}
if($text=~/forest/i){
quest::say("The boy cried out as loud as he could. running to the guard.  Kobolds!  Kobolds!  They are dragging off a girl into the forest!  The guard sprinted off in the direction of the forest. looking to destroy the kobold menace.  The boy jogged after him. laughing the whole time.  When the guard arrived there were. of course. no kobolds.  He trudged back to Ak'Anon waiting for some [excitement].");
}
if($text=~/excitement/i){
quest::say("The next day. the boy claimed that kobolds were attacking one of the local farms.  The guards all ran to save the farm and of course. no kobolds. and no sign of a battle.  Angered by another prank the guards cursed the boy and went back to their stations at the [entrance] to Ak'Anon.");
}
if($text=~/entrance/i){
quest::say("The following day. the boy was fixing a small clockwork just out of view of the guards.  A vicious kobold sprang at him and ripped into him with its big claws.  The boy screamed and cried!  Kobolds!  Kobolds!  But the guards did not come. they had grown tired of the boy's pranks the kobolds had a fine meal that night.  The end."); }
}
#END of FILE Zone:qeynos2  ID:15057 -- Felodius_Sworddancer 

