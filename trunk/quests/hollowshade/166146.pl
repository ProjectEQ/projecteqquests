#angelox
#Sonic Guardian

sub EVENT_SIGNAL {
  if (defined($qglobals{astate}) && ($qglobals{astate} == 1)) {
    quest::shout("To arms! The Grimlings are attacking the Sonic camp!");
  }
  elsif (defined($qglobals{astate}) && ($qglobals{astate} == 2)) {
    quest::shout("To arms! The Owlbears are attacking the Sonic camp!");
  }
}