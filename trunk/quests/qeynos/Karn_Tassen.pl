sub EVENT_SIGNAL {
    quest::say("Ooh yeah! So would I, honey.");
    quest::signal(1066,1);
 }
  


sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hello $name! Welcome to our humble little bakery. We just got a fresh shipment of supplies in, have a look around!"); }
}
#END of FILE Zone:qeynos  ID:1118 -- Karn_Tassen 

