sub EVENT_SAY {
  if($text=~/Hail/i) {
    quest::say("What are you doing here?!! Get out before you find yourself mining for these wretched beasts!");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 12184 => 1)) {
    quest::say("You were sent by Geeda!! Here. Take the information. Maybe next you shall earn your [Scout Blade] from Laren. Quickly!! Leave at once!!");
    quest::summonitem(67702);
  }
  plugin::return_items(\%itemcount);
}