#BeginFile: warslikswood\a_frantic_goblin.pl (79129)
#Quest for Warsliks Wood - a frantic goblin: Berserker Epic 1.0 (Trial of Mastery)

sub EVENT_SPAWN {
  quest::settimer(1,60);
}

sub EVENT_TIMER {
  quest::stoptimer(1);
  quest::signalwith(79127,8,0);
}

sub EVENT_DEATH {
  quest::signalwith(79127,2,0);
}

sub EVENT_SIGNAL {
  quest::depop();
}

#EndFile: warslikswood\a_frantic_goblin.pl (79129)