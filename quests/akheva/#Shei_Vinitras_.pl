#This version of Shei is a simple non-aggro merchant. When killed, the true version of Shei will spawn.

sub EVENT_DEATH_COMPLETE {
 quest::spawn2(179032,0,0,-1736,1082,22.6,63);
}

#Submitted by Jim Mills
#Modified by Reno