#The purpose of this script is to cause Inlokhar the Warlord to depop after 8 minutes of inactivity. All credit to BWStripes for this one, he absolutely came through.

sub EVENT_SPAWN {
 quest::settimer("uptimer", 480); #Start a timer for 8 minutes.
}

sub EVENT_AGGRO {
 quest::stoptimer("uptimer"); #Stop timer so I don't despawn in the middle of combat
}

sub EVENT_COMBAT {
 if ($combat_state == 0) { #Combat aggro lost
  quest::stoptimer("uptimer"); #Stop timer
  quest::settimer("uptimer", 480); #Restart a timer for 8 minutes.
 }
}

sub EVENT_TIMER {
 quest::stoptimer("uptimer"); #Stop timer
 quest::depop(); #You had enough time to try and kill me, now I *really* need the toilet. Tata
}

#Submitted by Jim Mills, but all scripting (and humorous comments!) courtesy of BWStripes