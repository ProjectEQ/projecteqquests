#Zone - mirb - Miragul's Menagerie - The Frozen Nightmare, zone ID 50, instanced raid
#NPC 237789
#Name: an icy bonewalker

#send signal to Durgin_Skell(237743) that an icy bonewalker has spawned

sub EVENT_SPAWN {
  quest::signalwith(237743,2,1);
}

sub EVENT_DEATH_COMPLETE {
  quest::spawn2(237756, 0, 0, $x, $y, $z, $h); #spawn a gray chromatic bonewalker
}