#BeginFile nightmareb\#Terris_Thule.pl
#Quest file for Lair of Terris Thule - Terris Thule: Planar Progression

#Terris Thule will spawn 15 x a dream defiler at 75% health, cast Direption of Dreams at 50% health, and spawn 3 x a grotesque statue at 35% health. Upon death a Planar Projection will spawn to give flags. The timer is used to continuously check to make sure that she is not pulled from her lair. If so, she will shout a curse and despawn.

sub EVENT_SPAWN {
  quest::setnexthpevent(76);
  quest::settimer(1,5);
}

sub EVENT_HP {
  if($hpevent == 76) {
    quest::spawn2(221006,0,0,-1858,-25,134,5); #a dream defiler
    quest::spawn2(221006,0,0,-1780,-59,134,193); #a dream defiler
    quest::spawn2(221006,0,0,-1833,102,134,165); #a dream defiler
    quest::spawn2(221006,0,0,-1852,48,134,157); #a dream defiler
    quest::spawn2(221006,0,0,-1876,-63,134,228); #a dream defiler
    quest::spawn2(221006,0,0,-1933,49,134,156); #a dream defiler
    quest::spawn2(221006,0,0,-1984,-61,134,148); #a dream defiler
    quest::spawn2(221006,0,0,-1896,-108,134,230); #a dream defiler
    quest::spawn2(221006,0,0,-1899,-65,134,243); #a dream defiler
    quest::spawn2(221006,0,0,-1732,3,134,190); #a dream defiler
    quest::spawn2(221006,0,0,-1773,-39,134,187); #a dream defiler
    quest::spawn2(221006,0,0,-2005,85,134,99); #a dream defiler
    quest::spawn2(221006,0,0,-2031,-3,134,142); #a dream defiler
    quest::spawn2(221006,0,0,-1954,-29,134,71); #a dream defiler
    quest::spawn2(221006,0,0,-1887,33,134,113); #a dream defiler
    quest::setnexthpevent(51);
  }
  elsif($hpevent == 51) {
    $npc->CastSpell(3150,0); #Direption of Dreams
    quest::setnexthpevent(36);
  }
  elsif($hpevent == 36) {
    quest::spawn2(221007,0,0,-1808,-120,134,239); #a grotesque statue
    quest::spawn2(221007,0,0,-1774,-7,134,191); #a grotesque statue
    quest::spawn2(221007,0,0,-1837,91,134,159); #a grotesque statue
  }
}

sub EVENT_DEATH {
  quest::spawn2(202368,0,0,$x,$y,$z,$h); #A Planar Projection
  quest::stoptimer(1);
}

sub EVENT_TIMER {
  if(($x <= -2100) || ($y >= 230) || ($y <= -265) || ($x >= -1600)) {
    quest::shout("Never shall I be removed from nightmares!");
    quest::depop();
  }
}

#EndFile: nightmareb\#Terris_Thule.pl (221008)