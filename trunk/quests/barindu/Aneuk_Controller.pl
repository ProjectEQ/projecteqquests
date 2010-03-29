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
     }
  if($signal == 4) {
     quest::emote("raises its scepter and calls out");
     quest::say("Finally, a chance to practice our tactics. Constructs, destroy their support troops!");
     quest::attack($name);
     quest::signalwith(283046,5,1);
     }
     }