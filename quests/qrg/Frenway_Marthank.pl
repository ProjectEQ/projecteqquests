sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings. stranger. Please excuse my melancholy state.  I have had some bad news that has brought me great sorrow.");
}
if($text=~/what bad news/i){
quest::say("My youngest son was devoured by a grizzly bear while playing near the caves. It was an unfortunate accident. The great bear was just protecting its territory. Now. could you please just leave me be? <sniff>"); }
}
#END of FILE Zone:qrg  ID:1454 -- Frenway_Marthank 

