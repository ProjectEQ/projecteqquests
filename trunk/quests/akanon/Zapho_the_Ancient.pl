###################################
#Zone: Ak`Anon                    #
#Short Name: akanon               #
#Zone ID: 55                      #
###################################
#NPC Name: Zapho_the_Ancient      #
#NPC ID: 55151                    #
#Quest Status: Complete           #
###################################

sub EVENT_SAY { 
  if($text=~/hail/i) {
    quest::say("Oh! Please excuse me. I was busy creating some new illusions for my collection. Hello there, $name! I am Zapho the Ancient. My return from the halls of the Realm of Heroes is the will of Bertoxxulous. I must watch over those who catch the eyes of the gods and recognize their heroic deeds.");
  }
}

sub EVENT_ITEM {
  quest::say("I do not want this.");
  plugin::return_items(\%itemcount);
}