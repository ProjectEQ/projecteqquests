sub EVENT_SAY {
   if($text=~/butcherblock/i){
     quest::say("Safe travels");
     quest::selfcast(4179);
 }
   if($text=~/east commons/i){
     quest::say("Safe travels");
     quest::selfcast(4176);
 }
   if($text=~/everfrost/i){
     quest::say("Safe travels");
     quest::selfcast(4180);
 }
   if($text=~/north ro/i){
     quest::say("Safe travels");
     quest::selfcast(4177);
 }
   if($text=~/south ro/i){
     quest::say("Safe travels");
     quest::selfcast(4178);
 }
   if($text=~/abysmal/i){
     quest::say("Safe travels");
     quest::movepc(279,-199,0,140); 
 }
}