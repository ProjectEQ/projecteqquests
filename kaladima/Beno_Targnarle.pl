sub EVENT_SAY {
   if ($text=~/hail/i) {
      quest::say("Step forth, young $name! I heard that you have come of age! The spirit of adventure has entered your body. That is good. Go and speak with the others. They shall help you. I am afraid I have no time to spend conversing. There is much I have to [ponder].");
   }
   elsif ($text=~/ponder/i) {
      if ($faction <= 4) {
         quest::say("Must you know everyone's business? Hmm.. Maybe you can be of assistance. You see, I have been instructed by Furtog to tend to a matter of extreme urgency, which is keeping me from clearing the mines of rats. Will you assist and [exterminate the rats]?");
      }
      elsif ($faction <= 5) {
         quest::say("Prove yourself to the Stormguard and then we shall talk. Perhaps you may assist Master Canloe and show your worth to us.");
      }
      else {
         quest::say("Your shifty eyes tell me that you are no ally of the Stormguard.");
      }
   }
   elsif ($text=~/exterminate the rats/i) {
      if ($faction <= 4) {
         quest::say("Very good! I shall reward you for every four giant rat pelts returned to me. And be on the lookout for a [metal rat]!");
      }
      elsif ($faction <= 5) {
         quest::say("Prove yourself to the Stormguard and then we shall talk. Perhaps you may assist Master Canloe and show your worth to us.");
      }
      else {
         quest::say("Your shifty eyes tell me that you are no ally of the Stormguard.");
      }
   }
   elsif ($text=~/metal rat/i) {
      if ($faction <= 4) {
         quest::say("I cannot tell you how many reports I have heard of metal rats in Kaladim. I first thought it was a vision obtained from having too many Tumpy Tonics, but Furtog himself is said to have seen them. If you ever catch sight of the little metal beast, give chase!! Return its metal carcass to me and I shall reward you.");
      }
      elsif ($faction <= 5) {
         quest::say("Prove yourself to the Stormguard and then we shall talk. Perhaps you may assist Master Canloe and show your worth to us.");
      }
      else {
         quest::say("Your shifty eyes tell me that you are no ally of the Stormguard.");
      }
   }
   elsif ($text=~/important stormguard matter/i) {
      if ($faction <= 4) {
         quest::say("I am apprehensive about sending one who is so young out into the world, but I have a good feeling about you, $name. Someone has stolen the [Eye of Stormhammer]. You must journey to Antonica and go to a place called Highpass Hold. The rogue who has it is locked up in the prison. We have arranged for his extradition to Kaladim. Please give the jail clerk this note of release.");
         quest::summonitem(18935); # Sealed Note
      }
      elsif ($faction <= 5) {
         quest::say("Prove yourself to the Stormguard and then we shall talk. Perhaps you may assist Master Canloe and show your worth to us.");
      }
      else {
         quest::say("Your shifty eyes tell me that you are no ally of the Stormguard.");
      }
   }
   elsif ($text=~/eye of stormhammer/i) {
      if ($faction <= 5) {
         quest::say("The great statue of Kazon Stormhammer was once encrusted with two great gems from the mines of Butcherblock. So big were they that it took the magic of the high elves to assist us in lifting them to the statue's face. In the year 2995, somehow, someone stole one of the eyes. We decided to keep the remaining eye in the vault. Now, even that has been stolen from us! Only the most trusted warriors may be involved in this [important Stormguard matter].");
      }
      else {
         quest::say("Your shifty eyes tell me that you are no ally of the Stormguard.");
      }
   }
   elsif ($text=~/doran vargnus/i) {
      if ($faction <= 5) {
         quest::say("Doran resides on an island in the Ocean of Tears. The island is filled with beautiful maidens. I could think of worse places to live.");
      }
      else {
         quest::say("Your shifty eyes tell me that you are no ally of the Stormguard.");
      }
   }
}

sub EVENT_ITEM {
   if (($faction <= 4) && (plugin::check_handin(\%itemcount, 13054 => 4))) { # Giant Rat Pelt
      quest::say("Great work, young one! We shall soon rid our mines of these pests. Keep a lookout for that [metal rat]. Here is a small reward for such fine work. Soon, you shall be know as Kaladim's resident exterminator.");
      quest::ding();
      quest::faction(314, 10); # Storm Guard
      quest::faction(169, 10); # Kazon Stormhammer
      quest::faction(219, 10); # Miner's Guild 249
      quest::faction(215, 10); # Merchants of Kaladim
      quest::faction(57, -10); # Craknek Warriors
      quest::exp(500);
      quest::givecash(0,3,0,0);
   }
   elsif (($faction <= 4) && (plugin::check_handin(\%itemcount, 13282 => 1))) { # Scrap Metal
      quest::say("I thank you, my friend. I was to destroy this metal monster months ago. I could never find him. Please accept this reward for such good service. Oh yes.. And take this card to a man named [Doran Vargnus]. He is a fine blacksmith. I am sure he will reward you with one of his finest suits of armor. Perhaps you may now assist in an [important Stormguard matter].");
      quest::ding();
      quest::faction(314, 10); # Storm Guard
      quest::faction(169, 10); # Kazon Stormhammer
      quest::faction(219, 10); # Miner's Guild 249
      quest::faction(215, 10); # Merchants of Kaladim
      quest::faction(57, -10); # Craknek Warriors
      quest::exp(500);
      quest::givecash(4, 0, 0, 0);
      quest::summonitem(13995); # Knight (Card)
   }
   elsif (($faction <= 4) && (plugin::check_handin(\%itemcount, 13321 => 1))) { # Eye of Stormhammer
      #Quest text, exp, cash, factions made up
      quest::say("You've found it! I'm glad you managed to hunt down and return the stolen eye for us, $name. Such effort requires a similar reward so take this and use it well.");
      quest::faction(314, 20); # Storm Guard
      quest::faction(169, 20); # Kazon Stormhammer
      quest::faction(219, 20); # Miner's Guild 249
      quest::faction(215, 20); # Merchants of Kaladim
      quest::faction(57, -10); # Craknek Warriors
      quest::exp(5000);
      quest::givecash(4, 0, 0, 0);
      quest::summonitem(5415); # Avenger Battle Axe
   }
   
   #do all other handins first with plugin, then let it do disciplines
   plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
   plugin::return_items(\%itemcount);
}

#END of FILE Zone:kaladima  ID:60007 -- Beno_Targnarle