sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Salutations. $name! I am here as a favor to my brother. High Priest Perrir. We seek loyal followers of Innoruuk to earn their place among the hierarchy of the Spires. Are you [devoted to Innoruuk]?");
}
if($text=~/i am devoted to innoruuk/i){
quest::say("My brother requests your presence in Neriak at the Spires of Innoruuk. Take this note with you. $name. It will inform Perrir of who sent you."); }
}
#END of FILE Zone:grobb  ID:4311 -- Savarixsa_Zexus 

