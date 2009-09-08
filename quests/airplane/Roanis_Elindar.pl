sub EVENT_SPAWN {
  quest::settimer("depop",300);
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Great, let us waste no more time! I offer to you three challenges. Summoning, Interpretation, and Displacement.  Please choose one of these.");
    }
  if ($text=~/summoning/i) { #magician test of summoning
    quest::say("Summoning it is. Proceed upward through the sky and return to me a Harpy Statuette, a Finely Woven Cloth Amice, and a Large Diamond. This will prove your abilities to me and I will reward you with a Drake Hide Amice.");
    }
  if ($text=~/interpretation/i) { #magician test of interpretation
    quest::say("Interpretation it is. Proceed upward through the sky and return to me a Carmine Spiroc Feather, a Blood Sky Amethyst, and a Golden Efreeti Ring. This will prove your abilities to me and I will reward you with the Duennan Shielding Ring.");
    }
  if ($text=~/displacement/i) { #magician test of displacement
    quest::say("Displacement it is. Proceed upward through the sky and return to me some Sweet Nectar, the Crown of Elemental Mastery, a Large Opal, and Djinni's Stave. This will prove your abilities to me and I will reward you with the Staff of Elemental Mastery.");
    }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 20952 => 1, 20760 => 1, 20761 => 1)) { #magician test of summoning using harpy statuette, finely woven cloth amice, large diamond   quest::summonitem(2708); #Drake-hide amice
    quest::exp(100000);
    quest::say("Take this.");
    quest::depop();
    }
  elsif(plugin::check_handin(\%itemcount, 20959 => 1, 20762 => 1, 20763 => 1)) { #magician test of interpretation using carmine spiroc feather, blood sky amethyst, golden efreeti ring
    quest::summonitem(11687); #duennan shielding ring
    quest::exp(100000);
    quest::say("Take this.");
    quest::depop();
    }
  elsif(plugin::check_handin(\%itemcount, 20966 => 1, 20764 => 1, 20766 => 1, 20765 => 1)) { #magician test of displacement using sweet nectar, crown of elemental mastery, large opal, djinni stave
    quest::summonitem(11568); #staff of elemental mastery
    quest::exp(100000);
    quest::say("Take this.");
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