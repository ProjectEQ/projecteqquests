sub EVENT_SPAWN {
  quest::settimer("depop",300);
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Great, let us waste no more time! I have three tests from which you can choose from. They are Illusion, Metamorphism, and Deception.");
    }
  if ($text=~/illusion/i) { #enchanter test of illusion
    quest::say("Illusion it is. Proceed upward through the sky and return to me a Crimson Tessera, a Darkstone Emerald, and a Finely Woven Gold Cord. This will prove your abilities to me and I will reward you with a Cord of Sphinx Hair.");
    }
  if ($text=~/metamorphism/i) { #enchanter test of metamorphism
    quest::say("Metamorphism it is. Proceed upward through the sky and return to me a Silver Disk, a Bluish Stone, and a Light Cloth Mantle. This will prove your abilities to me and I will reward you with the Wind Walker's Mantle.");
    }
  if ($text=~/deception/i) { #enchanter test of deception
    quest::say("Deception it is. Proceed upward through the sky and return to me a Rugous Globe, a Sky Pearl, and a Silken Mask. This will prove your abilities to me and I will reward you with an Ivory Mask.");
    }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 20931 => 1, 20767 => 1, 20768 => 1)) { #enchanter test of illusion using crimson tessera, darkstone emerald, finely woven cloth cord
    quest::summonitem(1277); #sphinx hair cord
    quest::exp(100000);
    quest::say("Excellent work!");
    quest::depop();
    }
  elsif(plugin::check_handin(\%itemcount, 20769 => 1, 20770 => 1, 20938 => 1)) { #enchanter test of metamorphism using bluish stone, light cloth mantle, silver disc
    quest::summonitem(1276);  #wind walker's mantle
    quest::exp(100000);
    quest::say("Excellent work!");
    quest::depop();
    }
  elsif(plugin::check_handin(\%itemcount, 20945 => 1, 20772 => 1, 20771 => 1)) { #enchanter test of deception using rugous globe, silken mask, sky pearl
    quest::summonitem(1275);  #ivory mask
    quest::exp(100000);
    quest::say("Excellent work!");
    quest::depop();
    }
    plugin::return_items(\%itemcount);
}

sub EVENT_TIMER {
  quest::stoptimer("depop");
  quest::depop();
} 