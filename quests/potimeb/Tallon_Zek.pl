sub EVENT_SPAWN {
   quest::settimer("tzek",1);
}

sub EVENT_AGGRO {
   quest::say("I hope you have lived your life with no regrets, for now it shall come to an end!");
}

sub EVENT_SIGNAL {
  if ($signal == 66) {
    quest::depop();
} 
 }

sub EVENT_DEATH {
        quest::signalwith(223157,12010,0);
        quest::say("Foolish mortals, you know not what you do. Continue on this path and you shall lead us all to destruction!");
        quest::stoptimer("tzek");
}

sub EVENT_TIMER {
 my $x = $npc->GetX();
 my $y = $npc->GetY();
 if($timer eq "tzek") { 
 if($x < 260) {
    $npc->GMMove(405,-84,358,192);
  }
 }
}
