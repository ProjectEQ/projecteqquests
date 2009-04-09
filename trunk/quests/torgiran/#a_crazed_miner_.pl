#BeginFile: torgiran\#a_crazed_miner_.pl
#Quest for Torgiran Mines - a crazed miner (KOS)

sub EVENT_SPAWN {
  quest::settimer(1,360); #Despawn after 6 minutes
}

sub EVENT_TIMER {
  quest::depop();
}
#EndFile: torgiran\#a_crazed_miner_.pl (226021)