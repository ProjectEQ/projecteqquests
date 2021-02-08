# items: 31781, 31782, 32170
sub EVENT_SAY { 
if($text=~/forest ravagers/i){
quest::say("I can't  believe Jon mentioned that to you. I'll deal with him myself. If you want to help us kill the forest ravagers then you must first find Carre Harger. Bring this note to him. He'll get you started.'");
quest::summonitem(31781); # Item: Note to Carre
 }
}
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 31782 => 1)) {
quest::say("We've been hunting those wolves for a long time now. They killed many of my men. I'm glad to see that they are gone. Take this Hunter's Pike and get some good use out of it.");
quest::exp(1000);
quest::summonitem(32170); # Item: Hunter's Pike
}
 }
sub EVENT_SIGNAL {
quest::say("Quiet yourself little brother!");
}
#END of FILE Zone:dawnshroud  ID:174073 -- Wils_Otton 

