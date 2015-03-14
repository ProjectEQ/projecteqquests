# #a_spectral_shimmer
# Illusion: Guktan, good quest: http://everquest.allakhazam.com/db/quest.html?quest=2605
# added 2009 BWstripes - because we can!
#
# Pop by gukbottom/#a_corrupted_gnome_explorer.pl
# Model posted is old undead froglok: http://eqbeastiary.allakhazam.com/search.shtml?id=13045


sub EVENT_SPAWN {
  quest::emote("rises from the explorer's corpse.");
  quest::settimer(1,300); # 5 minute timer, then just depop
}

sub EVENT_SAY {
  if($text=~/Hail/i && ($class eq "Enchanter")) {
  quest::say("Thank you for releasing me, take this and find the rest if you truly wish to help me.");
  quest::summonitem(67013); # Fused sword blade
  quest::emote("fades away.");
  quest::stoptimer(1);
  quest::depop();
  }
  else {
  quest::emote("stares at you as if it does not understand.");
  }
}


sub EVENT_TIMER {
  if($timer == 1) {
   quest::depop();
    quest::stoptimer(1);
  }
}