#Quest: Chialle's Friendship Ring

#NPC: Chialle
#Zone: Shar Vahl


sub EVENT_SAY {

  if($text=~/Hail/i){
  quest::say("Hello there traveler.  Please take a moment to look at my goods.  I have delicious meals perfect for traveling conditions.");
  }
}


sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 30625 => 4)){
  quest::say("Oh wow! This is just what I was hoping for. Thank you so much! You must be a real good friend to Saren to have her make you these, she never makes freshly squeezed nectar unless she really likes someone. You have a kind heart Khatzhana. Please take this with you as a token of my friendship.");
  quest::summonitem(30609);
  quest::exp(10000);
  quest::ding();
  quest::faction(132,20);
  }

}


#Submitted by DeSelminator

#END of FILE 