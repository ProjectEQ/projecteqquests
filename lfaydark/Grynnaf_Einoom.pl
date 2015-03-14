sub EVENT_SAY { 
if($text=~/Who is the scalekeeper?/i){
quest::say("Ahh...Ye be lookin' for Nortlav then. Nortlav is a strong fella. Ye dunna want to mess with the likes of him. He's known as a dragonslayer. I heard that he keeps the scales of the dragons he's slain. Yer not impressed eh? All the dragons he's killed have died by the blade of a [rusty weapon].");
}
if($text=~/What rusty weapon?/i){
quest::say("Aye. I dunno know why he does what he does. But every dragon he's killed died by the likes of a rusty weapon. I dunno where he is now. but I heard he can be found in the depths of Norrath. surrounded by darkness."); }
}
#END of FILE Zone:lfaydark  ID:57080 -- Grynnaf_Einoom 

