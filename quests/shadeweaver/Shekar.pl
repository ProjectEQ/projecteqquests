sub EVENT_SAY { 
  if($text=~/hail/i){
    quest::say("I suppose you are here to ask me how to create a Claw Beast Talon Club? Yes, yes, I thought you might be. So many young ones looking for these, my poor claws are sore from all the assembly. Of course, I will make one for you, so long as you return to me with the correct [items].");
  }
  if($text=~/items/i){
    quest::say("To assemble this club, I require only two things. The first is a wooden practice flail. The second is a talon from the great claw beasts. They are quite rare, and large, and might be a difficult kill.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 7811 => 1, 30579 => 1)) {
    quest::say("You have killed the Claw Beast!  Well done $name, you have shown a great ability to fight. I have not seen the like since the mightly Yalpeelor and Zunaloo!");
    quest::ding();
    quest::summonitem(7812);
  }
  plugin::return_items(\%itemcount);
}
