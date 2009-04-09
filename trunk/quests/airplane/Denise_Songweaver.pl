sub EVENT_SPAWN {
  quest::settimer("depop",300);
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hi there $name! I give three sections of the test of songs, Denise does the rest. Do you wish to take the test of pitch, voice, or tone?");
    }
  if ($text=~/pitch/i) { #Bard test of pitch
    quest::say("The pitch that we sing and play has a great affect on those that listen.  Keep this in mind Gendal, and you shall always be welcome in taverns and inns.  Now if you return to me Phosphoric Globe, a Shimmering Diamond, and crude wooden flute I will give to you Ervaj's Flute of Flight.");
    }
  if ($text=~/voice/i) { #bard test of voice
    quest::say("The sweet sound rising forth from our throats are what makes us truly great.  Go forth and give voice to your songs, and return to me a platinum disc, a music box, and a light woolen mantle. If you do this I shall give you the Songweaver's Mantle. Good luck!");
    }
  if ($text=~/tone/i) { #bard test of tone
    quest::say("Tone is important to all singers. Prove to me that you can keep your tone even and pure by bringing me an Ochre Tessera, a songbird statuette, and a light woolen cloak. If you do this I will give you the Mask of the Songbird.");
    }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 20947 => 1, 20824 => 1, 20825 => 1)) { #bard test of pitch using crude wooden flute, phosphoric globe, and shimmering diamond
    quest::summonitem(27722); #Ervaj's flute of flight
    quest::exp(100000);
    quest::say("Excellent! Take this as your reward.");
    quest::depop();
    }
  elsif(plugin::check_handin(\%itemcount, 20940 => 1, 20822 => 1, 20823 => 1)) { #bard test of voice using light woolen mantle, music box, platinum disc
    quest::summonitem(27721); #mantle of the songweaver
    quest::exp(100000);
    quest::say("Excellent! Take this as your reward.");
    quest::depop();
    }
  elsif(plugin::check_handin(\%itemcount, 20933 => 1, 20823 => 1, 20820 => 1)) { #bard test of tone using ochre tessera, songbird statuette, light wooden cloak
    quest::summonitem(27720); #mask of song
    quest::exp(100000);
    quest::say("Excellent! Take this as your reward.");
    quest::depop();
    }
  else {
    quest::say("What am I supposed to do with these?");
    plugin::return_items(\%itemcount);
    }
}

sub EVENT_TIMER {
  quest::depop();
  quest::stoptimer("depop");
} 