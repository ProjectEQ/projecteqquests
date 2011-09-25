sub EVENT_SAY {
  if(($text=~/hail/i) && ($maiden == undef)) {
    quest::say("Weakling! How dare you approach me. Access to Lord Marrs temple is reserved only for the honorable! You will never be [ready]...");
  }
  if(($text=~/ready/i) && ($maiden == undef)) {
    quest::say("Be warned, $name. If you believe you are ready, you will fail, even if you can kill Lord Marr's servants!");
    $maiden = 1;
    quest::settimer(1,7200);
    quest::spawn2(211076,0,0,($x - 50),$y,$z,$h);
    quest::signalwith(211081,4,1);
  }
}

sub EVENT_TIMER {
  if($timer == 1) {
    $maiden = 1; #What's the point of this? It should already be 1 as it never changes after getting set. Perhaps 0? If so, the variable should be initialized at 0 and the checks above should be for 0. Then you could do the event again after the timer expires.
    quest::stoptimer(1);
  }
}