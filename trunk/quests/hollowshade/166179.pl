#angelox
#Grimlin lookout
sub EVENT_SIGNAL {
 if (defined $qglobals{astate} && $qglobals{astate}==3){
 quest::shout("To arms! Sonic wolves are attacking the grimlin camp!");
}
 elsif (defined $qglobals{astate} && $qglobals{astate}==2){
quest::shout("To arms! Owlbears are attacking the grimlin camp!");
}
}
