sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("Hi $name. Did [Bordag send you]?");
}
if($text=~/bordag sent me/i){
quest::say("So you want learn about how to fight like bear and to crush enemy with bare hand? That good. Best way to start is just go out and do it. Biggest enemy around here lizard men. You go practice. Fight against lizard men. Bring me their tasty meat. You bring four."); }
}
#END of FILE Zone:oggok  ID:Not_Found -- #Bordag 

