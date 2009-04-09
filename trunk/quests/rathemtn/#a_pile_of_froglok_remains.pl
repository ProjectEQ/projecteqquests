# rathemtn/#a_pile_of_froglok_remains.pl
# Illusion: Guktan, good quest: http://everquest.allakhazam.com/db/quest.html?quest=2605
# added 2009 BWstripes - because we can!
#
# 2585, -2040
# Attackable, targettable, 3h respawn timer L65. Was 3 day respawn on live.

sub EVENT_SPAWN {
   quest::settimer(1,10);
}

sub EVENT_TIMER {
   if ($timer == 1) {
      $npc->SetAppearance(3);
      quest::stoptimer(1);
   }
}

sub EVENT_SAY {
  if (($text=~/I wish to recover what is lost/i) && ($class eq "Enchanter")){
  quest::emote("seems to stir briefly and a spectral pommel appears in your hands."); # Slight improvisation
  quest::summonitem(67015);  # A tarnished pommel
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount,67012 => 1)) {
    quest::spawn2(50329,0,0,$x,$y,$z,$h+90); # Spawn Warrior Spirit Chalex
    quest::summonitem(67020); # He gives you back Marr's retribution.
    quest::depop;
    }
    else {
      plugin::return_items(\%itemcount); # return unused items
    }
}