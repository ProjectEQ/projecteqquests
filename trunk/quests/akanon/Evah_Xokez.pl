###################################
#Zone: Ak`Anon                    #
#Short Name: akanon               #
#Zone ID: 55                      #
###################################
#NPC Name: Evah_Xokez             #
#NPC ID: 55124                    #
#Quest Status: complete           #
###################################

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Be wary, $name, there are unseen powers within these mines that can destroy the strongest warriors or the wisest seers. Do you find the rust that corrodes the mechanisms around you and the decaying forms that wander [these tunnels pleasing]?");
  }
  if($text=~/these tunnels pleasing/i) {
    quest::say("Then perhaps you share the vision of we who have made these mines our home. We are the Dark Reflection and our perceptions have been refined to allow us to see the poisons and disease coursing through every creature's veins and the decay afflicting all forms of matter in Norrath. I can teach you to harness the powers of our divine benefactor if you are [willing to learn] through service to the Dark Reflection."); 
  }
  if($text=~/willing to learn/i) {
    quest::say("Then your first lesson shall be the fulfillment of spreading infection and disease. Some of the best carriers of infectious diseases are rodents. Take this vial containing a slow and painful infection and give it to one of the pregnant giant rodents that can be found outside in the Steamfont Mountains. This way you can spread the disease to not only those creatures which cross the mother's path but also to those who cross the paths of her future offspring. Bring me the empty vial when the task has been completed.");
    quest::summonitem(10262);  #vial of infectious disease
  }
  if($text=~/components/i) {
    quest::say("The recipe we use to make the plague rat disease is fairly simple. We could easily extract the fluids from the infected rat livers but that would be counterproductive to our cause since it would require the deaths of our rodent carriers. Instead, I need you to collect two parts diseased bone marrow, one sprig of wormwood and one part gnomish spirits to be used as a medium. When you have combined all the components in the container I have provided, return it to me so that we may continue to spread the disease!");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 10263 => 1)) { #empty infectious vial
    quest::say("I hope you enjoyed the thrill of your first lesson and the awakening of your vision. Now you must prove your utility to our society. Take this airtight container and gather the [components] for another dose of the plague rat disease.");
    quest::summonitem(17357); #airtight metal box
    quest::faction(71,3); #dark reflection
    quest::faction(322,3); #the dead
    quest::faction(91,-3); #eldritch collective
    quest::faction(115,-3); #gem choppers
    quest::faction(179,-3); #king ak'anon
    quest::exp(150);
  }
  elsif(plugin::check_handin(\%itemcount, 10266 => 1)) {
    quest::say("Ahhh good good. Thse will be put to fine use creating more disease to spread through the rodents. you have done excellent work in helping to spread the work of the Plague Bringer. Take this Symbol of Initiation as your reward.");
    quest::summonitem(1390); #Initiate symbol of Bertoxxulous
    quest::exp(200);
    quest::faction(91,-3); #eldritch collective
    quest::faction(115,-3); #gem choppers
    quest::faction(176,-3); #king ak'anon
    quest::faction(71,3); #Dark reflection
    quest::faction(322,3); #the dead
  }
  else {
    quest::say("why did you bring me these?");
    plugin::return_items(\%itemcount);
  }
}