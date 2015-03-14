#BeginFile: nadox\a_luggald_apprentice.pl
#Script for Crypt of Nadox - a luggald apprentice

sub EVENT_SIGNAL {
  quest::say("All praise Innoruk.");
}

sub EVENT_ATTACK {
  quest::signalwith(227073,1,0); #Signal priest about attack
}

sub EVENT_DEATH_COMPLETE {
  quest::signalwith(227073,2,0); #Signal priest about death
}
#EndFile nadox\a_luggald_apprentice.pl (227082)