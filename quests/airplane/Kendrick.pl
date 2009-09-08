sub EVENT_SPAWN {
  quest::settimer("depop",300);
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Great, let us waste no more time! Do you wish to begin your test of Thievery, Silence, or Trickery?");
    }
  if ($text=~/thievery/i) { #rogue test of thievery
    quest::say("Thievery is absolute. Travel beyond and bring forth an Ivory Tessera, a gem of invigoration, and an inlaid choker to complete the test of thievery and earn the wispy choker of vigor!");
    }
  if ($text=~/silence/i) { #rogue test of silence
    quest::say("Silence makes us deadly. Proceed upward and bring to me a spiroc sky totem, a pearlescent globe, and a black griffon feather. Griffon Wing Spauldors shall be yours if you complete this.");
    }
  if ($text=~/trickery/i) { #rogue test of trickery
    quest::say("Trickery, ahh how Fizzlethorpe blesses us! Adventure and return a mottled spiroc feather, a cracked leather belt, and a sphinxian circlet to complete the test of trickery and earn Renards Belt of Quickness.");
    }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 20928 => 1, 20984 => 1, 20985 => 1)) { #rogue test of thievery using ivory tessera, gem of invigoration, inlaid choker
    quest::summonitem(14552); #wispy choker of vigor
    quest::exp(100000);
    quest::say("Excellent! Fizzlethorpe blesses you with this gift.");
    quest::depop();
    }
  elsif(plugin::check_handin(\%itemcount, 20989 => 1, 20942 => 1, 20988 => 1)) { #rogue test of silence using spiroc sky totem, pearlescent globe, black griffon feather
    quest::summonitem(2703); #griffon wing spauldors
    quest::exp(100000);
    quest::say("Excellent! Fizzlethorpe blesses you with this gift.");
    quest::depop();
    }
  elsif(plugin::check_handin(\%itemcount, 20956 => 1, 20992 => 1, 20993 => 1)) { #rogue test of trickery using mottled spiroc feather, cracked leather belt, sphinxian circlet
    quest::summonitem(11676); #renard's belt of quickness
    quest::exp(100000);
    quest::say("Excellent! Fizzlethorpe blesses you with this gift.");
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