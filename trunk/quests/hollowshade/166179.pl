#angelox
#Grimling lookout

sub EVENT_SIGNAL {
  if (defined($qglobals{astate}) && ($qglobals{astate} == 3)) {
    quest::shout("To arms! The Sonic wolves are attacking the Grimling camp!");
  }
  elsif (defined($qglobals{astate}) && ($qglobals{astate} == 2)) {
    quest::shout("To arms! The Owlbears are attacking the Grimling camp!");
  }
}