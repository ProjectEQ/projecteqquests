sub EVENT_DEATH {
if (defined $qglobals{ikky} && $qglobals{ikky} == 5) {
   quest::spawn2(293177,0,0,-1392,704,-453,154);
   quest::spawn2(293220,0,0,-1414,656,-453,191);
   quest::spawn2(293179,0,0,-1391,608,-449,0);
   quest::spawn2(293186,0,0,-1498,612,-453,36);
   quest::spawn2(293187,0,0,-1512,700,-453,82);
}
}