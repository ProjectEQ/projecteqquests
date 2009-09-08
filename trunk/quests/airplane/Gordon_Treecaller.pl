sub EVENT_SPAWN {
  quest::settimer("depop",300);
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hello $name, I can only hope that my disturbance was necessary. Ahh, you seem to be decently adept with a blade. Would you like to be tested in the element of thunder, the blade, or the art of ranged attack?");
    }
  if ($text=~/element of thunder/i) { #ranger test of the element of thunder
    quest::say("One of my greatest allies indeed. Thunder can be very powerful if used properly. Bring me a djinni statuette, a spiroc thunder totem, and a white gold earring. Then you will know the true power of nature.");
    }
  if ($text=~/blade/i) { #ranger test of the blade
    quest::say("Very good choice, my blade is my best friend and yours will be as well if you can complete this task. Retrieve an efreeti long sword, an emerald spiroc feather, some bitter honey, and a circlet of thorns. Be careful with the honey, if it is tainted the blade will not come to life.");
    }
  if ($text=~/art of ranged attack/i) { #ranger test of the art of ranged attack
    quest::say("Many of the fools on Norrath don’t realize how powerful a good bow can be. Many dread wolves have met their fate from my bow and you can have the same power if you can bring me back these items. Efreeti war bow, thickened nectar, a sphinx tallow, and a shimmering pearl.");
    }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 20955 => 1, 20856 => 1, 20857 => 1)) { #ranger test of the element of thunder using djinni statuette, spiroc thunder totem, white gold earring
    quest::summonitem(14568); #thunderforged earring
    quest::exp(100000);
    quest::say("Take this as your reward.");
    quest::depop();
    }
  elsif(plugin::check_handin(\%itemcount, 20859 => 1, 20860 => 1, 20858 => 1, 20962 => 1)) { #ranger test of the blade using bitter honey, circlet of brambles, efreeti long sword, emerald spiroc feather
    quest::summonitem(27732); #arydryidriyorn
    quest::exp(100000);
    quest::say("Take this as your reward.");
    quest::depop();
    }
  elsif(plugin::check_handin(\%itemcount, 20861 => 1, 20969 => 1, 20862 => 1, 20863 => 1)) { #ranger test of the art of ranged attack using efreeti war bow, thickened nectar, sphinx tallow, shimmering pearl
    quest::summonitem(11696); #windstriker
    quest::exp(100000);
    quest::say("Take this as your reward.");
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