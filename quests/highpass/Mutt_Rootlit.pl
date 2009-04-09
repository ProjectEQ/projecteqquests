sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hello. stranger. I would talk to thee. but [Barn] has instructed me not to converse with strangers.");
}
if($text=~/what barn/i){
quest::say("Barn is my hero. He saved me from a life on the evil streets in Freeport."); }
}
#END of FILE Zone:highpass  ID:5020 -- Mutt_Rootlit 

