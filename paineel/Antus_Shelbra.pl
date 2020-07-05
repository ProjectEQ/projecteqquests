# items: 9968, 9969, 13697, 9967
sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Greetings, $name. You have come to me searching for tasks and tasks I have. Would you judge yourself an [experienced heretic] or one who has [much to learn]?");
  }
  if($text=~/much to learn/i) {
    quest::say("Very well, $name. I do have a task for you. There is an old and frail Erudite male who now lives in Toxxulia named Aglthin Dasmore. He has left the ways of Cazic-Thule and no longer practices our craft. He has been stripped of his power and wealth, so he spends his time fishing by the river. Our great Lord of Fear has decreed that his life is forfeit. Slay him, and bring me proof of the deed.");
  }
  if($text=~/experienced heretic/i) {
    quest::say("Ah. Excellent. I have just the task for you, $name. In Kerra Ridge, there is a particular cat named Kirran Mirrah that we have been using to gather information about, well, certain aspects of cat society. He is no longer providing information for us and we have something for him that may encourage him to assist again. Ha! Hand him this sealed bag for us. It may just change his point of view. Hahaha!");
    quest::summonitem(9968); #Smelly Sealed Bag
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 9969 => 1)) { #Aglthin's Fishing Pole
    quest::say("Yes, this will do.");
    quest::summonitem(13697); #Staff of the Abattoir Initiate
    quest::faction(265,10);  #Heretics
    quest::faction(254,-30); #Gate Callers
    quest::faction(242,-30);  #Deepwater Knights
    quest::faction(231,-30);  #Craftkeepers
    quest::faction(233,-30);  #Crimson Hands
  }
  if(plugin::check_handin(\%itemcount, 9967 => 1)) { #Karran's Head
    quest::say("I take it he got the message... Excellent work!");
    quest::faction(265,10);  #Heretics
    quest::faction(254,-30); #Gate Callers
    quest::faction(242,-30);  #Deepwater Knights
    quest::faction(231,-30);  #Craftkeepers
    quest::faction(233,-30);  #Crimson Hands
    quest::givecash(5,4,6,1);
    quest::exp(1000);
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:paineel  ID:75089 -- Antus_Shelbra
