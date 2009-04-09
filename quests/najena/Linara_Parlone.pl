sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Please [help] me out of this horrid place! My family must be terribly worried!");
}
if($text=~/how how can I help you?/i){
quest::say("If you can find the [key] to my restraints. I should be able to escape.");
}
if($text=~/where is the key/i){
quest::say("Last I knew. Najena's priest had the key.  I fear he has left this place though.  I heard talk of traveling to some estate.  I know not where.  Oh dear. oh dear!  I shall never leave this place!"); }
}
#END of FILE Zone:najena  ID:44020 -- Linara_Parlone 

