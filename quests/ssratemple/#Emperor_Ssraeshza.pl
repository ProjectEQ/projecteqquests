# no-target emperor to depop when blood/blood golem killed
#

sub EVENT_SIGNAL {
  if ($signal == 99) {
    quest::settimer("spawnemp",350);
  }
}

sub EVENT_TIMER {
my $variance = int(rand(720));
my $spawntime = 5760 + $variance;

  if ($timer eq "spawnemp" && $qglobals{emperor} == 1) {
  }
  elsif ($timer eq "spawnemp" && $qglobals{emperor} != 1) {
    quest::spawn2(162227,0,0,993.3,-325.0,415.0,192.5);
    quest::stoptimer("spawnemp");
    quest::setglobal("emperor",1,3,"M$spawntime");
    quest::depop();
  }
quest::delglobal("emperor");
}

# EOF zone: ssratemple ID: 162065 NPC: #Emperor_Ssraeshza

