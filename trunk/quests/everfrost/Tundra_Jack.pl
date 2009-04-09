sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings $race.");
}
if($text=~/sweaty shirt/i){
quest::say("I would give it to you, but I'm afraid Iceberg here is using it as a collar now. I think you might be able to distract him with some [Lion Roast] if you give it to him.");
}
if($text=~/lion roast/i){
quest::say("Yes, that is Iceberg's favorite snack. I think Teria O'Danos in Halas gets a shipment every month. You might want to talk to her."); }
}
#END of FILE Zone:everfrost  ID:30069 -- Tundra_Jack 

