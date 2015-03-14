sub EVENT_SAY {
  if ($text=~/hail/i) {
  quest::say("It is amazing to find outlanders such as yourself this far into the Peak. What is your business here young one? Are you possibly here to [" . quest::saylink("see Phara Dar") . "]?");    
  }
  if ($text=~/see Phara Dar/i) {
      quest::say("Interesting, do you have business with her? This door behind me is sealed with a powerful ward, one which only Phara herself can remove. She has instructed me to assist servants of the Ring of Scale with passage into her lair, if they are loyal to us. At the very least you must be friendly with the inhabitants of this place, for you would not be here speaking to me as safely as you are. Are you a [" . quest::saylink("loyal servant") . "] of the Ring of Scale?");
  }
   if ($text=~/loyal servant/i && $faction == 1) {#require ally faction
    quest::say("I see now, yes, you are a loyal servant. I will translocate you into my master's lair when ready.");
   }

if ($text=~/ready/i) { 
  if ($faction == 1) { 
   quest::say("Very well."); 
   quest::movepc(108,-1163.2,-1047.9,283.0,127.8); 
   } 
  else { # less than ally faction 
   quest::say("You still need to prove your loyalty to us. I do not feel we can trust you yet, outlander."); 
   } 
} 
}
