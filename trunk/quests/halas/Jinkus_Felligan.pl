sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Welcome! Welcome to the Church o' the Tribunal! Do ye require healing or are ye [new to the Shamans o' Justice]. then. eh?");
}
if($text=~/i am new to the shamans of justice/i){
quest::say("Then I welcome ye into our noble order. Ye'll serve us well or spend an eternity in the dungeons o' the Tribunal. Are ye ready to [contribute to yer church] or do ye [wish to meditate] within our walls?"); }
}
#END of FILE Zone:halas  ID:29025 -- Jinkus_Felligan 

