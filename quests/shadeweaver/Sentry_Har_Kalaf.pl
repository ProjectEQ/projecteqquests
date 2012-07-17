sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Tread cautiously here. The road to the [paludal] caverns is a dangerous journey these days.");
}
if($text=~/what paludal?/i){
quest::say("The paludal caverns lie to the north, just beyond that copse of blue payala trees. Be careful if you decide to head that way, there are many [dangers] on the road to the north.");
}
if($text=~/what dangers?/i){
quest::say("The spirits have been restless in the northern region. The shak dratha have also been attacking travelers and merchants alike. I hear there is some good hunting within the Paludal caverns, however. The journey may be worth your while."); }
}
#END of FILE Zone:shadeweaver  ID:165170 -- Sentry_Har_Kalaf 

