sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings, $name. Welcome to the fishing village of Clan McMannus. We sell what we can here.  Have a look around but, please do not buy too much. We must save most of our stock for delivery to our home.");
}
if($text=~/pick up the lion meat shipment for Halas/i){
quest::say("Aye, good. Talk to Misla, she will get you the [Lion Roast]."); }
}
#END of FILE Zone:qey2hh1  ID:1199 -- Einhorst_McMannus 

