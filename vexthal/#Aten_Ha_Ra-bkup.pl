sub EVENT_SPAWN {
quest::settimer("atenha",1);
  }

sub EVENT_TIMER {
if ($timer eq "atenha") {
if(defined $qglobals{aten}) { 
  quest::stoptimer("atenha");
  quest::depop_withtimer();
  $qglobals{aten} = undef;
  } 
   }
    }

sub EVENT_DEATH_COMPLETE {
my $variance = int(rand(720));
my $spawntime = 6480 + $variance;
quest::setglobal("aten",1,3,"M$spawntime");
}
