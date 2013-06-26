# the Memory of Chalex
# Illusion: Guktan, good quest: http://everquest.allakhazam.com/db/quest.html?quest=2605
# added 2009 BWstripes - because we can!
#
# NPC is targettable, not attackable, not aggressive.
# Note: I am just guessing that it uses same model as the spirits in the froglok 'evil' temple. They just looked like a good thing to use.
#

sub EVENT_SPAWN {
  quest::settimer(1,180); # 3 minute timer, then just depop
}

sub EVENT_TIMER {
  if($timer == 1) {
   quest::depop();
    }
}