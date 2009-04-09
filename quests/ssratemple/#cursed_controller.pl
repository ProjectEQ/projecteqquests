# vyzh`dra the cursed event controller
# Re-Written by Reno

my $counter;

sub EVENT_SPAWN {
  $counter = 0;
}

sub EVENT_SIGNAL {

  if ($signal == 1) {
    quest::settimer("one",21600);
    $counter += 1;
    if ($counter == 10 && defined $qglobals{glyphed_dead}) {
         quest::stoptimer("one");
         quest::settimer("one",21600);
         quest::spawn2(162253,0,0,-51,-9,-218.1,63);#runed
         $counter = 0;
         }
      elsif ($counter == 10 && !defined $qglobals{glyphed_dead}) {
         quest::stoptimer("one");
         quest::settimer("one",21600);
         quest::spawn2(162261,0,0,-51,-9,-218.1,63);#glyphed
         $counter = 0;
     }
  }
  if ($signal == 2 && defined $qglobals{exiled_dead}) {
      quest::stoptimer("one");
      quest::settimer("one",21600);
      quest::spawn2(162214,0,0,-51,-9,-218.1,63);#banished
      }
    elsif ($signal == 2 && !defined $qglobals{exiled_dead}) {
      quest::stoptimer("one");
      quest::settimer("one",21600);
      quest::spawn2(162232,0,0,-51,-9,-218.1,63);#exiled
      }
  if ($signal == 3 && !defined $qglobals{cursed_dead}) {
    quest::stoptimer("one");
    quest::settimer("one",21600);
    quest::spawn2(162206,0,0,-51,-9,-218.1,63);#cursed
  }
  if ($signal == 4) {
    quest::depop();
  }
}

sub EVENT_TIMER {
  if ($timer eq "one" && !defined $qglobals{cursed_dead}) {
    quest::stoptimer("one");
    quest::spawn2(162258,0,0,-212,130,-184,127); #ssrakezh
    $counter = 0;
    #quest::depop();
  }
}

# EOF zone: ssratemple ID: 162255 NPC: #Trigger_one

