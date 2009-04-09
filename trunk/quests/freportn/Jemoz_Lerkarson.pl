sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Bless you. my friend!  We always welcome new converts into our Hall of Truth.  The righteous army of the twin deities must assemble.  The battle draws near.  The blessings of the Truthbringer are passed to all who are [devoted to truth].");
}
if($text=~/i am devoted to truth/i){
quest::say("Work on the ways of valor before we discuss such things. You are on the righteous path of the Truthbringer. but there is more work to do."); }
}
#END of FILE Zone:freportn  ID:8044 -- Jemoz_Lerkarson 

