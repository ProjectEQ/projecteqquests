##NEEDS WORK!!!
#Not all timers stopped before depop()
#Timer 2 not used. Maybe final_path is supposed to use 2?

sub EVENT_SPAWN {
  if(defined($ring_seven_start) && $ring_seven_start == 1) { #timer for turnin
    quest::settimer(1,1);
  }
  if(defined($final_path) && $final_path == 1) { #timer for final respawn and signal for turnin
    quest::settimer(1,1);
  }
  if(defined($turnin) && $turnin == 1) {
    quest::settimer(3, 600);
  }
}

sub EVENT_SAY { 
  if($text=~/hail/i && !defined($event_spawn) && !defined($ring_seven_start)) {
    quest::say("Hurry! There's not much time. Give me the key and show me proof that you are a friend sent to rescue me...");
  }
}

sub EVENT_TIMER {
  if($timer == 1 && $x == -2012 && $y == 197 && !defined($event_spawn) && !defined($final_path)) {
    quest::stoptimer(1);
    $event_spawn=1;			
    $ring_seven_start=undef;
    quest::say("Uh oh, looks like they were tipped off somehow... I hope you can handle them.");
    quest::spawn2(116119, 0,0, $x, $y, $z, $h);
    quest::spawn2(116569, 0,0, -2139, 168, 150, 57);
    quest::depop_withtimer();
  }
  if($timer == 1 && $x == -3183 && $y == -586 && defined($final_path) && $final_path == 1) {
    quest::stoptimer(1);
    $event_spawn=undef;
    $ring_seven_start=undef;
    $final_path=undef;
    $turnin=1;
    quest::spawn2(116119, 0, 0, $x, $y, $z, 9);
    quest::say("I have escaped! With the help of our friends here I was saved from certain death. We are in their debt.");
    quest::signalwith(116118, 1, 1000);
    quest::depop_withtimer();
  }
  if($timer == 2) { #Not sure why this is here. Timer 2 is not defined/declared
    $event_spawn=undef;
    quest::stoptimer(1);
    $ring_seven_start=undef;
    quest::depop_withtimer();
  }
  if($timer == 3) {
    $event_spawn=undef;
    $ring_seven_start=undef;
    $final_path=undef;
    $turnin=undef;
    quest::signalwith(116118, 2, 0);
    quest::depop_withtimer();
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 1046 => 1, 30162 => 1) && !defined($ring_seven_start) && !defined($final_path)) {
    quest::say("I thought I was a dwarfskin rug there for a minute! Thank Brell for your help stranger! Now cover me while I make good my escape. I am weakened and cannot endure much more.");
    quest::summonitem(30162);
    $ring_seven_start=1;
    $event_spawn=undef;
    quest::spawn2(116119,234, 0, $x, $y, $z, $h);
    quest::depop_withtimer();
  }
  plugin::return_items(\%itemcount);
}

sub EVENT_SIGNAL {
  $event_spawn=undef;
  $final_path=1;
  quest::spawn2(116119, 235, 0, $x, $y, $z, $h);
  quest::depop_withtimer();
}

sub EVENT_DEATH {
  $event_spawn=undef;
  $ring_seven_start=undef;
  $final_path=undef;
  $turnin=undef;
}

#END of FILE Zone:eastwastes  ID:116145 -- Corbin_Blackwell