sub EVENT_SPAWN {
  quest::settimer("depop",300);
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Great, let us waste no more time! I have three tests from which you can choose from. They are Disillusion, Memorization, and Incapacitation.");
    }
  if ($text=~/disillusion/i) {  #enchanter test of disillusion
    quest::say("Disillusion it is. Proceed upward through the sky and return to me a Harpy Statuette, a Nebulous Sapphire, and an Adamintium Earring. This will prove your abilities to me and I will reward you with an Earring of Displacement.");
    }
  if ($text=~/memorization/i) { #enchanter test of memorization
    quest::say("Memorization it is. Proceed upward through the sky and return to me a Carmine Spiroc Feather, a Ganoric Poison, and a Glowing Necklace. This will prove your abilities to me and I will reward you with a Necklace of Whispering Winds.");
    }
  if ($text=~/incapacitation/i) { #enchanter test of incapacitation
    quest::say("Incapacitation it is. Proceed upward through the sky and return to me an Efreeti Wind Staff, some Sweet Nectar, a Black Sky Diamond, and a Large Sky Sapphire. This will prove your abilities to me and I will reward you with the Staff of Warding Winds.");
    }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 20774 => 1, 20952 => 1, 20802 => 1)) { #enchanter test of disillusion using adamantium earring, harpy statuette, nebulous sapphire
    quest::summonitem(14559);  #earring of displacement
    quest::exp(100000);
    quest::say("Good. Take this as your reward.");
    quest::depop();
    }
  elsif(plugin::check_handin(\%itemcount, 20959 => 1, 20775 => 1, 20776 => 1)) { #enchanter test of memorization using carmine spiroc feather, ganoric poison, glowing necklace
    quest::summonitem(14558);  #necklace of whispering winds
    quest::exp(100000);
    quest::say("Good. Take this as your reward.");
    quest::depop();
    }
  elsif(plugin::check_handin(\%itemcount, 20777 => 1, 20779 => 1, 20778 => 1, 20966 => 1)) { #enchanter test of incapacitation using black sky diamond, efreeti wind staff, large sky sapphire, sweet nectar
    quest::summonitem(27711); #rod of protecting winds
    quest::exp(100000);
    quest::say("Good. Take this as your reward.");
    quest::depop();
    }
  else {
    quest::say("What am I supposed to do with these?");
    plugin::return_items(\%itemcount);
    }
}

sub EVENT_TIMER {
  quest::stoptimer("depop");
  quest::depop();
} 