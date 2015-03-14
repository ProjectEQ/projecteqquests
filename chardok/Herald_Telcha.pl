# Herald Telcha, Chardok
# quest for sarnak faction (give salts or gobling skins)
# quest for Di'zok Signet of Service
# which is the beginning of Regal Band of Bathezid

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hail to you, lesser being! It is good to see you seeking the enlightenment and satisfaction that can only come from serving the Sarnak! Experience for yourself the joy of fealty to our Lord the Overking Bathezid Di'zok! I am Telcha, lesser apprentice sub-herald in training to the Court of Di'zok and I stand ready to welcome those who would serve our noble Overking. Are you here to [aid] us?");
  } elsif ($text=~/aid/i) {
    quest::say("Ah, so good of you to strive to improve yourself! So often members of your pathetic lesser races plod along in ignorance, unaware of the most Noble empire of the Di'zok. Enough though of the chit-chat, as I'm sure you are most eager to make yourself useful! Before you may enter our worthy city and be looked upon as a valuable servant, you must prove your worth to our [cause].");
  } elsif ($text=~/cause/i) {
    quest::say("The first task I shall set you is the slaying of goblins! Ooh, how very heroic you must feel to finally have a worthy goal guiding your previously menial existance! Yes, go forth from here and journey to Droga, stronghold of our enemies. Slay the warriors and menials of the Mountain Death Clan, bring havoc to their homes. Return to me with proof of your deeds, to raise in your standing with the Dizok. Bring me [tokens] of many dead goblins, and one day you shall walk among us.");
  } elsif ($text=~/token/i) {
    quest::say("As proof of your deeds I shall require either 2 Mountain Death mineral salts, or a patch of green goblin skin. Bring me many of these, as you bring destruction on the goblin city, and I shall speak to my superiors of your efforts on our behalf. Do enough for our cause, and I shall reward you directly. Return to me later and remind me that you serve the Sarnak, and I may have a ring for you if you are worthy.");
  } elsif ($text=~/serve the sarnak/i) {
    if ($faction >= 4) { # amiably or lower 
      quest::say("Away with you! I am the herald of the Dizok Overking, here to greet the servants of my master. If you would walk within our city, go forth and prove yourself our ally by slaying our goblin enemies! Advance into our city at your own peril, as our soldiers regard you as a foe!");
    } elsif ($faction == 3) { # Kindly
      quest::say("You have not yet done enough service for the Sarnak Collective, and my Dizok Masters. Return to me when you have done more, and I may reward you with a ring of service.");
    } elsif (($faction < 3) && ($ulevel < 50)) { # Warmly and lvl<50
      quest::say("What to do, what to do.. You've served the Di'zok well, young one but you are not yet experienced enough to wear the Signet of the Di'zok. Come back when you've seen a bit more of the world, and the ring shall be yours.");
    } elsif (($faction < 3) && ($ulevel>=50)) { # Warmly and lvl>50
      quest::say("Indeed you do my friend, indeed you do! Walk among us in safety, wear this ring as a symbol of your service to our cause. Continue your efforts in our war on the goblins, and your rewards shall increase. Return to me your ring, along with the head of the Drogan Warlord Skargus, and I'll give you an even greater badge of honor. Good day to you, servant of the Sarnak.");
      quest::summonitem(5728); # Di'zok Signet of Service 
    }
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount,16972=>2)) { #  Mt. Death Mineral Salts
    quest::say("Ah, most excellent! You are sure to be more highly valued as our servant once I speak to my masters of this! Mountain Death Mineral Salts, they shall grace the Overkings table this very night! Be off, minion! Fetch us some more salts to prove your value!");
    quest::faction(23,10);
    quest::faction(384,-30);
    quest::exp(8000);
  }
  if (plugin::check_handin(\%itemcount,22135=>1)) { # Green Goblin Skin
    quest::say("Green Goblin Skin! You have indeed been busy! I shall speak to my masters of this, continue your good work and return to me with more skins.");
    quest::faction(23,10);
    quest::faction(384,-30);
    quest::exp(8000);
  } 
  if (plugin::check_handin(\%itemcount,6476=>1,5728=>1)) { # Head of Skargus & Di'Zok Signet of Service
    quest::say("Ah hah! You are notworthy indeed amongst the servants of the Sarnak! Perhaps I should have you killed, before your deeds outdo mine.. Hmm..");
    quest::say("Guards! Guards! Haha, do not panic menial being, in fact I am most impressed with your service. Here is the ring I promised you in exchange for your efforts.");
    quest::faction(23,50);
    quest::faction(384,-30);
    quest::exp(50000);
    quest::summonitem(5727); # 5727  Regal Band of Bathezid
    quest::delglobal("RegalBandBathezid");
  }

  if (($faction==1) && plugin::check_handin(\%itemcount,5727=>1)) { # Regal band of Bathezid
    quest::summonitem(5727); # 5727  Regal Band of Bathezid
  }
  
  plugin::return_items(\%itemcount);
}

