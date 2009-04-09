#####################################################
#  NPC:  Bren Treeclimber
#  Zone:  Qrg
#  Author: Andrew80k
#####################################################
sub EVENT_SAY { 
if($text=~/Hail/i){
     quest::say("Hello, $name.  My name is Bren Treeclimber and I am a Protector of the Pine.  We have sworn our lives to protecting all the animals of Surefall Glade.  [Poachers], beware!");
}
if($text=~/poachers/i){
    quest::say("Heh?  Oh.  Poachers are constantly after our bears for their valuable skins.  I wish those darn [Millers] would move on. Then, maybe, our bears would be left alone.  I have seen far too many of my friends die.  I will kill anyone I see harming my bears.");
}
if($text=~/millers/i){
   quest::say("The Millers?!  Those butchers!  We have caught that Baobob and his sister trying to poach more than once.  And to think we took them in and gave them shelter when they were in need.  All the while, they were just trying to get to our bears.");
}
 }
#END of FILE Zone:qrg  ID:391 -- Bren_Treeclimber

