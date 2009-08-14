#zone: gunthak NPC: Millius_Darkwater (224194)
#Revision1 Angelox
#note; I did this quest as per the original, "Titanium" version

sub EVENT_SAY {
  if ($text=~/hail/i) {
    if(plugin::check_hasitem($client, 59028)) { #Glowing Black Skull Necklace
      quest::emote("looks somewhat startled as you approach him. 'Oh hello, $name. The tides of Prexus shift angrily these days.  Be careful as you explore the island, this is a most accursed place.'");
    }
    else {
      quest::emote("lifts his sword out of the water at his feet and scans his eyes across you. 'Hello, $name. The waters stir angrily today. Prexus is not pleased at the tarnishing of his waters by the spawn of Innoruuk. The Deepwater Knights have been trying to locate this [place] for many years.'");
    }
  }
  if ($text=~/place/i) {
    quest::say("The legends of Broken Skull Rock have been whispered for years. Indeed several of our greatest vessels were lost while in search of this island. Many of our [knights] died trying to clease Prexus' waters of this great Evil.");
  }
  if ($text=~/knights/i) {
    quest::say("Most recently a Cavalier named Chester Steelblade went in search of the legend. He was gone at sea for months before we recieved word from him. The letter we received spoke of a map that he'd found as well as a somewhat cryptic reference to having found the [key] to Broken Skull Rock. One of our [clerics] took a small group out in search of him, but we have received no news from either group.");
  }
  if ($text=~/clerics/i) {
    quest::say("The cleric that went in search of Chester's crew is called Alina Crystalia and she was barely more than a student when she left. We didn't want to let her go, but ultimately we had little say in the matter. She was always very fond of Chester. She may have in fact found him, although I suspect too late to save either of them. Clerics of Prexus are required to carry with them a Deepwater Emblem to identify them, if nothing else I hope to find Alina's Emblem to return it to Erudin.");
  }
  if ($text=~/key/i) {
    quest::say("He didn't give any more information about the key, but we're sure that he must have found something that led him here. We have found no sign of him or his crew yet. Truthfully it would be a miracle if he were still alive. I follow his path in hopes that I can continue his work where he left off. If he is dead then his spirit may yet linger here. Tied to this world by his unfinished task.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 59029 => 1)) { #Deepwater Emblem
    quest::emote("bows his head quietly as his eyes bring recognition to his mind. 'Alina at least has met a bitter end. Her spirit surely lingers nearby. Find her and free her from her burden, $name. Her quest goes unfinished.'");
    quest::summonitem(59030); #Alina's Emblem
        if (!(defined $qglobals{Alina}))
        {
                quest::delglobal("Alina");
                quest::setglobal("Alina", 2, 3, "F");
                $qglobals{Alina}=undef;
        }
  }
  # Loot A Black Medallion (59026)  off a Troll Plunderer and turn it in to Millius Darkwater.
  elsif (plugin::check_handin(\%itemcount, 59026 => 1)) { #Black Medallion
    quest::say("Taken for one of the pirates you said? Interesting. This medallion does seem to resemble what Chester described in his last letter to Eurdin. I can sense the spirit of one of our order nearby. It is in terrible torment, I suspect Chester's spirit has been bound here by the dark curse of Innoruuk. You must find him and set him free. If you find him, show him this necklace to remind him of this unfinished errand. Perhanps he can help you complete what he could not do alone.");
    quest::summonitem(59027); #Black Skull Necklace - for male erudite spirit
}
  # Give Millius the Glowing Black Skull Necklace and he'll tell you that you still haven't found Chester.
  elsif (plugin::check_handin(\%itemcount, 59028 => 1)) { #Glowing Black Skull Necklace
    quest::say("You still haven't found Chester.");
    quest::summonitem(59028); #Glowing Black Skull Necklace
  }
  else {
    quest::say("I don't need this."); #Text made up
    plugin::return_items(\%itemcount);
  }
}

# What he says now   quest::emote("looks somewhat startled as you approach him. 'Oh hello, $name. The tides of Prexus shift angrily these days.  Be careful as you explore the island, this is a most accursed place.'");
