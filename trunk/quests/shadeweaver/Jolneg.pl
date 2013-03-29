sub EVENT_SAY { 
  if($text=~/hail/i){
    quest::say("Hello there, young one, has the Captain sent you to speak with me about the [Deathmaw Club]?");
  }
  if($text=~/deathmaw club/i){
    quest::say("Ahh, well, since you do not know of the Deathmaw club, then I will tell you about it. Captain Alim has taught me how to make this club. In order to make one, I will require three deathmaw claws, and a wooden practice flail. Return to me these components, and I will craft a Deathmaw Club for you.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 7808 => 3, 30579 => 1)) {
    quest::say("Well done $name.  Use your new weapon well.");
	quest::ding();
    quest::summonitem(7815);
  }
  plugin::return_items(\%itemcount);
}
