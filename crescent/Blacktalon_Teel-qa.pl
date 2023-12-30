sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("May the shadows always guard you!  Darkness is where I find the most comfort and strength. I am fed by it.");
  }
}

sub EVENT_ITEM {
  if (($class eq "Shadowknight") && (plugin::check_handin(\%itemcount, 58648 => 1))) { #Crescent Reach Guild Summons
    #quest::say(""); Doesn't give text on Live...
    quest::faction(1129, 100); #Circle of the Crystalwing
    quest::summonitem(58752); #Bloodknight's Apprentic Tunic*
  }
  plugin::return_items(\%itemcount);
}