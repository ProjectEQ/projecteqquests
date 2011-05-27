sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Welcome to the holy Temple of Life. Your presence shows an interest in our ways. We are the followers of the [Prime Healer] and would gladly open our arms to any who [serve Rodcet Nife]. Do we not all owe our lives to the sustaining force of the Prime Healer?");
  }
  if($text=~/prime healer/i) {
    quest::say("The Prime Healer is Rodcet Nife. The one whose power flows through your body. He is the air that you breathe. To serve Him is to serve every living creature. Do you wish to [serve the Prime Healer] or do you [need more time for contemplation]?");
  }
  if($text=~/serve rodcet nife/i) {
    quest::say("The Prime Healer is Rodcet Nife. The one whose power flows through your body. He is the air that you breathe. To serve Him is to serve every living creature. Do you wish to [serve the Prime Healer] or do you [need more time for contemplation]?");
  }
  if($text=~/serve the prime healer/i) {
    if($faction < 3) {
      quest::say("Excellent. Please look into the occurrence of rabid wolves and rabid bears in the area. Return with a diseased wolf pelt or a putrid bear hide to prove your loyalty. You will be rewarded well."); #Text made up
    }
    else {
      quest::say("The Temple of Life smiles upon you, friend.. but such a delicate matter can only be entrusted to our most loyal members.");
    }
  }
  if($text=~/need more time for contemplation/i) {
    quest::say("I understand. Sometimes a person can be filled with the lies of so many other false deities that he cannot see the truth when it lies in front of him.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 13949 => 1)) { #Diseased Wolf Pelt
    if($faction < 3) {
      quest::say("I see you have rid our land of a beast tainted with the blood of Bertoxxulous. The Prime Healer shall look favorably upon your soul. Here is our thanks and just in case the beast may have bitten you...");
      $npc->CastSpell(213,$userid); #Cure Disease
      quest::exp(1000);
      quest::givecash(1,0,1,2);
      quest::faction(9,5);    #Antonius Bayle
      quest::faction(135,5);  #Guards of Qeynos
      quest::faction(183,5);  #Knights of Thunder
      quest::faction(257,5);  #Priests of Life
      quest::faction(21,-10); #Bloodsabers
    }
    else {
      quest::say("The Temple of Life smiles upon you, friend.. but such a delicate matter can only be entrusted to our most loyal members.");
      quest::summonitem(13949); #Diseased Wolf Pelt
    }
  }
  elsif(plugin::check_handin(\%itemcount, 13298 => 1)) { #Putrid Bear Hide
    if($faction < 3) {
      quest::say("Oh dear. The disease has spread to the realm of the Treefolk. It must have been difficult to kill such a large and rabid beast. Here. Take one of my personal scrolls as thanks for such a brave act of devotion. I pray you can use it. If not, then perhaps one of your fellow adventurers can.");
      quest::summonitem(15226,1); #Spell: Endure Disease
      $npc->CastSpell(213,$userid); #Cure Disease
      quest::exp(1000);
      quest::givecash(1,0,1,2);
      quest::faction(9,5);    #Antonius Bayle
      quest::faction(135,5);  #Guards of Qeynos
      quest::faction(183,5);  #Knights of Thunder
      quest::faction(257,5);  #Priests of Life
      quest::faction(21,-10); #Bloodsabers
    }
    else {
      quest::say("The Temple of Life smiles upon you, friend.. but such a delicate matter can only be entrusted to our most loyal members.");
      quest::summonitem(13298); #Putrid Bear Hide
    }
  }
   elsif(plugin::check_handin(\%itemcount, 13950 => 1)) { #Fleshy Orb
      quest::say("This is odd. This could explain the increase in the number of beasts within the lands surrounding Qeynos. You must take this to Freeport. Here. You must speak with Lorme Tredore. Show him this pellet. You had best gear up for the trip. Freeport is very far away. Here is some gold. Outfit yourself at our expense."); 
      quest::givecash(0,6,0,0);
      quest::faction(9,5);    #Antonius Bayle
      quest::faction(135,5);  #Guards of Qeynos
      quest::faction(183,5);  #Knights of Thunder
      quest::faction(257,5);  #Priests of Life
      quest::faction(21,-10); #Bloodsabers
      quest::summonitem(13951);
      
  }
  else {
    quest::say("I have no use for this, $name.");
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:qeynos2  ID:2082 -- Priestess_Caulria