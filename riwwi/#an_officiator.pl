sub EVENT_SPAWN {
  quest::shout("We'll see how defiant they are after they have been crushed for our amusement. Send in one of our trained hynids!");
  quest::signalwith(282097,1,5);  #signal to enslaved yunjo
  quest::settimer(1,25);
}

sub EVENT_TIMER {
  quest::stoptimer(1);
  quest::spawn2(282099,0,0,37,540,3,189);  #Frothing Hynid
}

sub EVENT_SIGNAL {
    if($signal == 1) { 
  quest::emote("sneers");
  quest::say("Then let's have a demonstration, shall we? How to be slaughtered by a rabid animal in front of a captivated audience.");
  quest::spawn2(282100,0,0,37,540,3,189);  #Gibbering Hynid
}
    if($signal == 2) {
    quest::shout("You've proven amusing so far, but how long can you last? Handlers, send in the cragbeast!");
      quest::spawn2(282101,0,0,37,540,3,189);  #Handler Bvekh
        quest::spawn2(282102,0,0,-340,535,3,58);  #Highest Hills Cragbeast
}
    if($signal == 3) {
       quest::emote("gloats");
       quest::say("Your little stand is at an end, $name. Prepare to be slaughtered. I will enjoy this thoroughly.");
       quest::spawn2(282103,0,0,37,540,3,189);  #Pfaaxle
}
    if($signal == 4) {
    quest::shout("'Enough of this, let $name deal with one of the stoneservants.");
      quest::spawn2(282104,0,0,37,540,3,189);  #Manipulate Stoneworker
}
    if($signal == 5) {
    quest::shout("Graargh! Bring in two stoneservants.");
      quest::spawn2(282075,0,0,37,540,3,189);  #Misguided stoneworker
      quest::spawn2(282071,0,0,-340,535,3,58);  #Controlled earthworker
}
    if($signal == 6) {
    quest::shout("This should prove to be very entertaining. How will you manage against controlled stoneservants? I don't think you will manage at all. Farewell, $name.");
      quest::spawn2(282083,0,0,37,540,3,189);  #Pixxt Master Hviqu
      quest::spawn2(282086,0,0,-340,535,3,58);  #Directed Destroyer
      quest::spawn2(282078,0,0,-169,637,3,129);  #Dominated Bonecrusher
}
    if($signal == 7) {
    quest::emote("laughs");
    quest::say("Here come the Kyv. It's over now $name");
      quest::spawn2(282085,0,0,37,540,3,189);  #Drax
      quest::spawn2(282082,0,0,-340,535,3,58);  #Qiz
      quest::spawn2(282074,0,0,-169,637,3,129);  #Xnoz
}
    if($signal == 8) {
    quest::emote("roars");
    quest::say("'GAH! Why won't you die?! $name, your time has come to an end. Send in the SLAYER!");
      quest::spawn2(282076,0,0,37,540,3,189);  #Kizki the Slayer
}
    if($signal == 9) {
      quest::shout("I tire of toying with you, $name. Men, kill them. Now.");
      quest::spawn2(282087,0,0,37,540,3,189);  #Hexxt Lixx
      quest::spawn2(282084,0,0,-340,535,3,58);  #Hexxt Nheki
      quest::spawn2(282070,0,0,-169,637,3,129);  #Hexxt Skazm
      quest::spawn2(282072,0,0,-337,612,3,71);  #Pixxt Khark
      quest::spawn2(282077,0,0,-178,631,3,174);  #Pixxt Kirq
      quest::spawn2(282080,0,0,37,595,3,169);  #Pixxt Mik
}
}