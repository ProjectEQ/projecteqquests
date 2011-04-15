my $counter;
$keeper=undef;

sub EVENT_SPAWN {
  $counter = 0;
}

sub EVENT_SIGNAL {

  if ($signal == 1) { #azarack
    $counter += 1;
    if ($counter == 9) {
      quest::spawn2(71059,0,0,-602.2,-254.4,-333.5,201.5);
      $counter = 0;
    }
  }
  if($signal == 2 && !defined $qglobals{keeper}) { #KoS
    quest::settimer(13,300);
    quest::setglobal("keeper",1,3,"H2");
    quest::settimer(87,4800);
    }
}

sub EVENT_SAY { 

if($text=~/Hail/i){

quest::say("Hello there, brave traveller. I sell keys that take you to other islands in this here Plane of Sky. My prices are the best around. Heh, heh."); }

}
sub EVENT_TIMER {
  if($timer == 87) {
      quest::spawn2(71075,0,0,-996.3,910.5,192.3,18.0);
      }
}

#END of FILE Zone:airplane  ID:2977 -- Key_Master 




