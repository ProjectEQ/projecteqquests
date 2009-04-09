#Ramos_Jerwan.pl
#Fisherman's Companion


sub EVENT_SAY {
  if($text=~/Hail/i) {
    quest::say("Good day traveler... perhaps you have come to help me with my studies?");
  }
  if($text=~/studies/i) {
    quest::say("It's quite simple really. I'm interested in studying some aquatic specimens from around the planes... will you take up your pole and give me a hand?");
  }
  if($text=~/hand/i) {
    quest::say("There are some particularly interesting cichlid swimming about in the Plane of Nightmare. I also hear the discus in the Plane of Valor are quite plentiful. I need you to bring me two sets of bones from each for study. You do know how to extract them, yes? If not, I believe the lovely Peras Glickon may have something that can instruct you. Best of luck lad.");
  }
}
  
  
sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 29173 => 2, 29171 => 2)) {#Vallorian Discus Bones, Nightmare Cichlid Bones
    quest::say("Ah, you've done quite well. Take this, it's a special gift I recovered from a recent adventure, and I can think of no greater person to keep it than you. Remember if you're in need of fishing supplies, come see us any time.");
    quest::summonitem(29175); #Fisherman's Companion
  }  
  else {
   quest::say("I don't need this."); #text made up
   plugin::return_items(\%itemcount);
   return 1;
  }
    
}#END of FILE Zone:poknowledge  ID:202064 -- Ramos_Jerwan 

