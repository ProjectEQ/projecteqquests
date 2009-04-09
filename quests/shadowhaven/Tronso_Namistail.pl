sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hail dere to you as well $name. me name is Tronso Namistail. I am a carpenter in this here Shadowhaven and responsible for many of the fine structures that we have here. I have lived in this city for quite some time. and know me way around pretty well I would say. So I thought I would help out the new folks a bit. Are you a [newcomer] to the Haven?");
}
if($text=~/I am a newcomer/i){
quest::say("Ah excellent to hear dat. Well it sure is great to have ye here. we have many places to see and so many different merchants with such an assortment of goods that you are sure to find what ya need here or in the Bazaar. I can also give you a tour of the Haven if you would like to learn yer way around!"); }
}
#END of FILE Zone:shadowhaven  ID:150079 -- Tronso_Namistail 

