sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Blast!!  Hundreds of goblins to slay and [great treasure] to be had and I am stuck at my post!");
}
if($text=~/what great treasure?/i){
quest::say("A fellow paladin who was a member of an expedition into the jungles of Kunark returned with a jade green broadsword.  He said he came across it while they were fighting their way out of some ancient city filled with golems.  They lost many strong troops on that expedition."); }
}
#END of FILE Zone:firiona  ID:84147 -- Guard_Ivak 

