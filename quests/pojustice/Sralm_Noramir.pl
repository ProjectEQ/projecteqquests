###############################################
# Name:  Sralm Noramir
# Zone:  Plane of Justice
# Author:  Andrew80k
###############################################
sub EVENT_SAY {
  if ($text=~/hail/i) {
     quest::emote("pounces at you, grabbing you by your throat.");
     quest::say("What are you doing here? Who sent you?");
  }
  if ($text=~/sent me/i) {
     quest::say("I hope you are not here to free a prisoner. The Tribunal punishes such actions harshly. Once here there is no hope of escape. Even for one such as I.");
  }
  if ($text=~/who are you/i) {
     quest::say("Ahh, how rude of me. Allow me to introduce myself. I am Sralm Noramir, warrior by birth thief by choice.");
  }
  if ($text=~/thief/i) {
     quest::say("Aye, I could steal the sword from a warriors hands or a kiss from a ladys lips. Ever hear of Emperor Sllanar?");
  }
  if ($text=~/never heard/i) {
     quest::say("You see, generally thieves were imprisoned, or at worst executed, but banishment here was usually reserved to those that committed heinous crimes. I guess you should be careful when you rob the person who gets to decide on the definition of heinous. Have you any news of Sebilis?");
  }
  if ($text=~/trakanon/i) {
     quest::say("What in the name of Thule is a Trakanon?");
  }
  if ($text=~/dragon/i) {
     quest::say("A dragon in Sebilis! Stop your foul lies, your humor does not suit my tastes.");
  }
  if ($text=~/froglok/i) {
     quest::say("This can't be real! Frogloks in Sebilis, my ancestral home. My how the mighty has fallen. I guess I was better off here after all.");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}