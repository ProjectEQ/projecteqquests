sub EVENT_SAY { 
if($text=~/lion roast/i){
quest::say("Hello there. You are here to deliver the lion roast to Halas? Very well, here is the lion roast.");
quest::summonitem(12221);
}
}
#END of FILE Zone:qey2hh1  ID:3563 -- Misla_McMannus 

