my $count = 0;

sub EVENT_SPAWN {
  quest::settimer("themoor",5);
}

sub EVENT_TIMER {
  $count++;
  if($count == 1) {
    quest::say("So mate, are you just in from a patrol?");
  }
  if($count == 2) {
    quest::signalwith(155122,1,1); # NPC: Taruun_Jaur
  }
  if($count == 3) {
    quest::signalwith(155259,1,1); # NPC: Erat_Almar General Supplies
  }
  if($count == 4) {
    quest::signalwith(155122,2,1); # NPC: Taruun_Jaur
  }
  if($count == 5) {
    quest::say("Sure thing, mate. You know I'm sucker for good gossip.");
  }
  if($count == 6) {
    quest::signalwith(155122,3,1); # NPC: Taruun_Jaur
  }
  if($count == 7) {
    quest::say("Oh my! Did ya kill 'em!");
    quest::signalwith(155259,2,1); # NPC: Erat_Almar General Supplies
  }
  if($count == 8) {
    quest::signalwith(155122,4,1); # NPC: Taruun_Jaur
  }
  if($count == 9) {
    quest::say("Bah! It couldn't get weirder. That's weird enough! Take a moment to finish your drink and then tell me what happened.");
    quest::settimer("themoor",300);
  }
  if($count == 10) {
    $count = 0;
    quest::settimer("themoor",5); 
  }
}