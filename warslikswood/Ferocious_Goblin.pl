#BeginFile: warslikswood\Ferocious_Goblin.pl (79128)
#Quest for Warsliks Wood - Ferocious Goblin: Berserker Epic 1.0 (Trial of Mastery)

sub EVENT_SPAWN {
  quest::settimer(1,60);
}

sub EVENT_TIMER {
  quest::stoptimer(1);
  quest::signalwith(79127,1,0); # NPC: Raving_Goblinmaster
}

sub EVENT_DEATH_COMPLETE {
  quest::signalwith(79127,2,0); # NPC: Raving_Goblinmaster
}

sub EVENT_SIGNAL {
  quest::depop();
}

#EndFile: warslikswood\Ferocious_Goblin.pl (79128)