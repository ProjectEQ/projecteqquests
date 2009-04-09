sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hail. young adventurer!  I'm the chief overseer o' the Shamans o' Justice. We serve the will o' the Tribunal. Justice is our way. Within Halas. there are none who are above the scales o' justice. There are still some who have defied our laws. We wish to [apprehend the fugitives].");
}
if($text=~/i will apprehend the fugitives/i){
quest::say("Maybe so. however. there are some who may be too much fer ye to handle.I'll need to know if ye're a [young shaman] or a [standin' member of the court].");
}
if($text=~/i am a young shaman/i){
quest::say("We seek a former member who dared to curse the righteousness of the Tribunal. We'll have his head for that remark. His name is Granin O'Gill and he has run to the wastelands of Everfrost seeking safe haven. Find him. Return his head to me. Do so. and earn the ninth circle spell. Spirit o' the Bear. Go at once!");
}
if($text=~/I am a standing member of the court/i){
quest::say("At the moment. I've no word o' heretics about for ye to hunt down. I pray that there will be no more. too!"); }
}
#END of FILE Zone:halas  ID:29059 -- Margyn_McCann 

