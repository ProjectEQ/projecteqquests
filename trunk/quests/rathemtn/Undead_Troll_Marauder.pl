# Undead Troll Marauders
# Illusion: Guktan, good quest: http://everquest.allakhazam.com/db/quest.html?quest=2605
# added 2009 BWstripes - because we can!
# Spawned and signalled by rathemtn/Troll_Captain_Krignok.pl
#
#
sub EVENT_SPAWN {
  quest::moveto(-2027.9, 2568.6, 17.7);  # Move roughly toward player's last know locale.
}

sub EVENT_SIGNAL {
   quest::depop();
}