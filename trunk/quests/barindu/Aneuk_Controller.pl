sub EVENT_ATTACK {
    quest::emote("raises its scepter and calls out");
    quest::say("Finally, a chance to practice our tactics. Constructs, destroy their support troops!");

}

sub EVENT_SIGNAL {
  if($signal == 1) {
    quest::say("Bring that tray here, girl! I'm famished.");
    quest::say("Don't keep that all to yourself. Bring some of that fruit over here too!");
    quest::emote("quickly gorge themselves on the fruit. After a few moments, they both double over and cry out in pain.");
    quest::signalwith(283050,2,10);
}
  if($signal == 3) {
     quest::emote("raises its scepter and calls out");
     quest::say("Finally, a chance to practice our tactics. Constructs, destroy their support troops!");
     quest::emote("doubles over in pain, losing its concentration as the poison burns through its body.");
     quest::attacknpctype(283081);
     quest::depopall(283046);
     quest::spawn2(283154,0,0,-457,672,-97,156);
     quest::spawn2(283154,0,0,-471,602,-97,32);
     quest::spawn2(283154,0,0,-533,631,-97,240);
     quest::spawn2(283154,0,0,-523,500,-97,56);
     quest::spawn2(283154,0,0,-490,500,-97,208);
     quest::spawn2(283154,0,0,-469,563,-97,32);
   }
  }