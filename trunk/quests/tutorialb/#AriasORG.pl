#zone: tutorialb
#Revised Angelox

sub EVENT_SAY {
  if ($text=~/hail/i){
  quest::say("Thank you for helping our rebellion. If you wish to [escape] at any time simply let me know.");
 }
  elsif ($text=~/escape/i) {
  quest::say("Here I'll show you how to get out. But remember once you leave you can't get back in, or you jepordize our whole operation.");
  quest::delglobal("$name");
  quest::movepc(202,337.91,335.60,-126.50);
 }
}
