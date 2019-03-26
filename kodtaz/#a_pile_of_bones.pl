sub EVENT_DEATH_COMPLETE {
if (defined $qglobals{ikky} && $qglobals{ikky} >= 5) {
   quest::spawn2(293177,0,0,-1392,704,-453,308); # NPC: Pixtt_Priest_Guardian
   quest::spawn2(293220,0,0,-1414,656,-453,382); # NPC: ##Pixtt_Priest_Summoner
   quest::spawn2(293179,0,0,-1391,608,-449,0); # NPC: Pixtt_Priest_Guardian
   quest::spawn2(293186,0,0,-1498,612,-453,72); # NPC: Pixtt_Priest_Guardian
   quest::spawn2(293187,0,0,-1512,700,-453,164); # NPC: Pixtt_Priest_Guardian
}
}
