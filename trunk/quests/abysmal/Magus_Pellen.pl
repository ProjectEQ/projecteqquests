sub EVENT_SAY {
   if($text=~/Nedaria/i){
     quest::say("Safe travels");
     quest::selfcast(4580);
 }
}