sub EVENT_SPAWN {
     quest::settimer("depop",172800);
}

sub EVENT_TIMER {
  if ($timer eq "depop") {
     quest::stoptimer("depop");
     quest::depop();

   }

}

sub EVENT_DEATH {
my $variance = int(rand(720));
my $spawntime = 6480 + $variance;
quest::setglobal("aten",1,3,"M$spawntime");
}
