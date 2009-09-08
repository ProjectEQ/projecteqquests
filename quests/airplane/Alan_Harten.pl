sub EVENT_SPAWN {
  quest::settimer("depop",300);
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Greetings faithful. Your faith shall be tested this day.  Shall you take the test of courage, skill, or protection?");
    }
  if ($text=~/courage/i) { #cleric test of courage
    quest::say("You have come seeking the knowledge and treasures that I posses. I will impart such things to you, if you do a service to your god. It matters not who that god may be, but the service and the faith you must exemplify. Bring to me an Ochre Tessera, a Sky Emerald, and a Silver Hoop.");
    }
  if ($text=~/skill/i) { #cleric test of skill
    quest::say("The test of skill it will be. Bring to me, a Gold Disc, a Dark Wood, and a Small Shield. You shall be rewarded upon your return.");
    }
  if ($text=~/protection/i) { #cleric test of protection
    quest::say("So, you must be a great protector to have ventured this far. Bring for me an Adumbrate Globe, a Glowing Diamond, and some Shiny Pauldrons for your reward.");
    }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 20933 => 1, 20807 => 1, 20806 => 1)) { #cleric test of courage using ochre tessera, silver hoop, sky emerald
    quest::summonitem(14563); #truewind earring
    quest::exp(100000);
    quest::say("Wonderful! Take this as your reward!");
    quest::depop();
    }
  elsif(plugin::check_handin(\%itemcount, 20808 => 1, 20939 => 1, 20809 => 1)) { #cleric test of skill using dark wood, gold disc, small shield
    quest::summonitem(27716); #aegis of the wind
    quest::exp(100000);
    quest::say("Wonderful! Take this as your reward!");
    quest::depop();
    }
  elsif(plugin::check_handin(\%itemcount, 20946 => 1, 20829 => 1, 20811 => 1)) {#cleric test of protection using adumbrate globe, glowing diamond, shiny pauldrons
    quest::summonitem(27717); #pauldrons of piety
    quest::exp(100000);
    quest::say("Wonderful! Take this as your reward!");
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