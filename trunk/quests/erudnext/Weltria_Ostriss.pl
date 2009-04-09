sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Good day. $name. I assist in maintaining an accurate collection of historical tomes here in the great library of Erudin. One of our citizens recently escaped the dungeons of the Kobold warrens and tells of a Kobold lore keeper who keeps a collection of scrolls detailing the history of their kind. Are you capable of obtaining those scrolls for our library?");

if ($text=~/I am capable/i) {
  quest::say("Take this case and return it to me when you have collected all of the scrolls.");
  quest::summonitem(17058);
   } 
  }
 }
  
  sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 31825 => 1)) {
    quest::say("You have my gratitude, $name! This will make a valuable addition to our historical volumes and perhaps offer some insight into the workings of Kobold society.");
    quest::faction( 211, 10);
    quest::faction( 145, 10);
    quest::faction( 147, 10);
    quest::exp(1500);
    quest::givecash(50,0,0,0);
  }  
 }
#END of FILE Zone:erudnext  ID:98015 -- Weltria_Ostriss 

