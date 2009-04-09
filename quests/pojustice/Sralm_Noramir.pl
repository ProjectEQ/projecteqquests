###############################################
# Name:  Sralm Noramir
# Zone:  Plane of Justice
# Author:  Andrew80k
###############################################
sub EVENT_SAY {
  if ($text =~ /Hail/i ) {
     quest::emote("pounces at you, grabbing you by your throat.");
     quest::say("What are you doing here? Who sent you?");
  }  
}