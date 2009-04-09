#zone: tutorialb
#Revised Angelox
#This is a custom quest, intended mainly for the players to try out newly revised LoY zones.

sub EVENT_SAY {
 if ($text=~/hail/i){
  quest::say("Thank you for helping our rebellion. If you wish to [escape] at any time simply let me know.");
  quest::emote("sighs...");
  quest::say("Or perhaps you have become bored with the same adventures and prefer something [different].");
 }
  elsif ($text=~/escape/i) {
  quest::say("Here, I'll show you how to get out. But remember, once you leave you can't get back in, or you jepordize our whole operation.");
  quest::say("Are you [sure] you want to leave?");
 }
  elsif ($text=~/different/i) {
  quest::say("Aye, different; a world of [pirates] and [treasure] ... ");
 }
  elsif ($text=~/pirates/i) {
  quest::say("There are many evil pirates there, nasty place to be. I could [send] you there, with proper [status], although you'd never be able to return here");
 }
  elsif ($text=~/treasure/i) {
  quest::say("Many riches those pirates carry, you could attain an impressive [status] if you weren't killed first");
 }
  elsif ($text=~/status/i) {
  quest::say("I can give you a compatible starting-level, with a few extra spells, once you ge there.");
 }
  elsif ($text=~/prove/i) {
  quest::say("Bring me a part of Krenshin's bones, and I'll know you have mastered these mines, send you on your way...");
 }
  elsif ($text=~/sure/i) {
  quest::say("Good luck!");
  quest::delglobal("$name");
  quest::rebind(202,337.91,335.60,-126.50);
  quest::movepc(202,337.91,335.60,-126.50);
 }
  elsif(($text=~/send/i)&&(${$name}==3)){
  quest::say("Good luck my friend ....");
  quest::delglobal("$name");
  quest::level(35);
  quest::rebind(224,-978.10,1717.51,42.37);
  quest::movepc(224,-978.10,1717.51,42.37);
 }
  elsif ($text=~/send/i) {
  quest::say("I can send you, but I worry you might not survive, due to lack of skills. You'd have to [prove] yourself to me first");
 }
}

sub EVENT_ITEM{
  if ($itemcount{56001} == 1){
    quest::delglobal("$name");
    quest::setglobal("$name",3,3,"F");
    $name=undef;
    quest::level(25);
    quest::scribespells();
    quest::say("You have done well! I can now [send] you to The Gulf of Gunthak at your request"); 
  }
}
