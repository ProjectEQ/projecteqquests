sub EVENT_SAY { 
  if($text=~/hail/i){
    quest::say("Greetings, young one, what is it that you [seek]?");
  }
  if($text=~/seek a club/i){
    quest::say("Ahh, so you seek the Shredder Claw Club, aye? Indeed, I am the apprentice to Captain Alim who was trained to make that item. I will craft one for you if you wish to gather the [components].");
  }
  if($text=~/components/i){
    quest::say("Return to me with three Shredder Claws, and a wooden practice flail, and I will attach the claws to the flail and create a Shredder Claw Club for you to use out here in the Thicket.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 7809 => 3, 30579 => 1)) {
    quest::say("Well done $name.  Use your new weapon well.");
	quest::ding();
    quest::summonitem(7814);
  }
  plugin::return_items(\%itemcount);
}
