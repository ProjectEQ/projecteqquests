sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hail $name. You can just call me Banum. Just [exploring] are you?");
}
if($text=~/i am exploring/i){
quest::say("Be careful out there. I have heard of the glass playing tricks on people's eyes.");
}
if($text=~/what exploring/i){
quest::say("Be careful out there. I have heard of the glass playing tricks on people's eyes."); }
}
#END of FILE Zone:povalor  ID:208056 -- Katizm_Banum 

