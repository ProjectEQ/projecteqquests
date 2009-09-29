# #a_spectral_shimmer - neriakc
# Illusion: Guktan, good quest: http://everquest.allakhazam.com/db/quest.html?quest=2605
# added 2009 BWstripes - because we can!
#
# Pop only on death by  neriakc/#Gribnor_the_Small.pl
# Model is old undead froglok.


sub EVENT_SPAWN {
  quest::settimer(1,300); # 5 minute timer, then just depop
}

sub EVENT_SAY {
  if($text=~/hail/i && ($class eq "Enchanter")) {
    quest::say("Take this final piece and hurry, my power gets weaker by the moment.");
    quest::summonitem(67014); # Tarnished Cross-Guard
    quest::emote("fades away.");
    quest::stoptimer(1);
    quest::depop();
  }
  else {
    quest::emote("stares at you as if it does not understand.");
  }
}

sub EVENT_TIMER {
  quest::stoptimer(1);
  quest::depop();
}

sub EVENT_ITEM {
  quest::emote("stares at you as if it does not understand.");
  plugin::return_items(\%itemcount);
}