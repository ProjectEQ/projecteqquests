sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings adventurer. Pay no heed to Captain Koldar should you see him. Our true enemy are the Gor Taku. It is very apparent that they are in league with the Loda Kai Brigands. We need to show the Shak Dratha that we are not their enemy. Help me destroy the Gor Taku clan, return to me with four of their earthcaller stones and I will help supply you."); }
}

sub EVENT_ITEM {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:shadeweaver  ID:165163 -- Captain_Karim 
