#Zone: Iceclad Ocean
#Short Name: iceclad
#Zone ID: 110
#
#NPC Name: enraged walrus
#NPC ID: 110093
#Quest Status: finished
#

sub EVENT_DEATH {
  quest::spawn2(110091,0,0,2049,852,-31.80,132); #spawn the agitated snowfang
}

#END of FILE Zone: iceclad ID:110093 -- enraged_walrus

