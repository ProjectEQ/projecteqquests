#BEGIN File: ssratemple\#Emperor_Ssraeshza_.pl (Real)

my $engaged = 0;

sub EVENT_SPAWN {
  quest::settimer("EmpDepop", 600);
}

sub EVENT_TIMER {
  quest::stoptimer("EmpDepop");
  quest::signalwith(162260,3,0); #EmpCycle
  quest::depop();
}

sub EVENT_COMBAT {
  if (($combat_state == 1) && ($engaged == 0)) {
    quest::settimer("EmpDepop", 2400);
    $engaged = 1;
  }
}
  
sub EVENT_DEATH {
  quest::emote("'s corpse says 'How...did...ugh...'");
  quest::spawn2(162210,0,0,953,-332,403.1,190); #Shissar Wraith
  quest::spawn2(162210,0,0,953,-324,403.1,190);
  quest::spawn2(162210,0,0,953,-316,403.1,190);
  quest::spawn2(162210,0,0,937,-332,403.1,190);
  quest::spawn2(162210,0,0,937,-324,403.1,190);
  quest::spawn2(162210,0,0,937,-316,403.1,190);
  quest::signalwith(162260,2,0); #EmpCycle
}

sub EVENT_SLAY {
  quest::say("Your god has found you lacking.");
}

# EOF zone: ssratemple ID: 162227 NPC: #Emperor_Ssraeshza_ (Real)