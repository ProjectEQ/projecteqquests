#This version of Hero Goxnok spawns after the Drachnid Spy is killed. Once confronted by hailing him, he will attack. Both versions of Hero Goxnok are for the fifth quest in the Greenmist line.

sub EVENT_SAY {
 if($text=~/hail/i){
  quest::emote("sighs slowly, seeing the confusion on your face. He says, 'Yes, $name, I am the traitor. What I can gain by giving up this tome outweighs any patriotic obligations I may have once had. That city is dead, it is now time for us to grasp at our own destinies. I now give you two choices, $race. You can walk away and never speak of this to anyone......or you can die. What will it be?'");
  }
}

sub EVENT_AGGRO {  
  quest::say("Die by the power of Greenmist!!");
}

sub EVENT_DEATH {
  quest::say("You shall now be a wanted man.. The Union of Vie shall punish you.");
}

#Submitted by Jim Mills