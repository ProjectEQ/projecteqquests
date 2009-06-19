##Custom script  for GM event, created by Shadowblade

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Quickly, $name!  Give me the shoes so that you may finish the race!");
  }

}

  sub EVENT_ITEM {
    if (plugin::check_handin(\%itemcount, 2300 => 1)) {
    quest::say("Here, take this to Eldarian over there as fast as you can!");     
      quest::summonitem(59970);
    }
  }