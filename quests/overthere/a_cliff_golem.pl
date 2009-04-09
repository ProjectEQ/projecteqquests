#This simple script will depop the cliff golem when someone is spawning the glowing cliff golem for the Greenmist quest line. See Alchemist Granika's quest file for more details.

sub EVENT_SIGNAL {
 if($signal == 0) {
   quest::depop();
 }
}

#Submitted by Jim Mills