sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hello $name. Don't mind us. We're just passing through. We decided to rest before we head on.  My brother Wils may have something you're interested in. Ask him about [forest ravagers]."); 
quest::signalwith(174073,150,0);
}
 }
#END of FILE Zone:dawnshroud  ID:174094 -- Jon_Otton 

