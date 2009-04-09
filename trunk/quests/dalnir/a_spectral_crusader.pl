#The spectral crusader is part of the Greenmist quest line, and gives some flavor to the sixth quest in the series. Though he isn't essential to any turn-ins or anything, I thought it proper to add him.

sub EVENT_SAY {
 if($text=~/greenmist/i){ #Test of the Hero (Greenmist Quest 6/8)
  quest::say("Mighty was the mist which covered the land. Mighty is the blade wielded by a crusader.");
  }
 elsif($text=~/golin/i){ #Test of the Hero (Greenmist Quest 6/8)
  quest::emote("swipes his hand toward his own head in a chopping motion. 'Stuck between crypt and dust.'");
  }
 elsif($text=~/visceral dagger/i){ #Test of the Hero (Greenmist Quest 6/8)
  quest::say("Shattered!! Three within the crypt. A master must go. To the [grand forge] they must go. Three become one with the spirit hammer.");
  }
 elsif($text=~/grand forge/i){ #Test of the Hero (Greenmist Quest 6/8)
  quest::emote("points to the ground. 'Beyond the doors lies a forge unlike any other.'");
  }
}

#Submitted by: Jim Mills