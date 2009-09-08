sub EVENT_SPAWN {
  quest::settimer("depop",300);
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Great, let us waste no more time! I offer to you three challenges. Clarification, Empowerment, Gesticulation, and Shielding. Please choose one of these.");
    }
  if ($text=~/clarification/i) { #magician test of clarification
    quest::say("Clarification it is. Proceed upward through the sky and return to me a Crimson Tessera, an Ethereal Sapphire, and Feathered Cape.  This will prove your abilities to me and I will reward you with the Bracelet of Clarification.");
    }
  if ($text=~/empowerment/i) { #magician test of empowerment
    quest::say("Empowerment it is. Proceed upward through the sky and return to me an Iron Disc, a Gem of Empowerment, and a Ceramic Mask. This will prove your abilities to me and I will reward you with the Mask of Empowerment.");
    }
if ($text=~/gesticulation/i) { #magician test of gesticulation
quest::say("Gesticulation it is. Proceed upward through the sky and return to me an Efreeti Magi Staff, Sweet Nectar, a Sphinx Crown, and a Hazy Opal.  This will prove your abilities to me and I will reward you with the staff of the Magister");
}
  if ($text=~/shielding/i) { #magician test of shielding
    quest::say("Shielding it is. Proceed upward through the sky and return to me a Hyaline Globe, an Ivory Pendant, and a Golden Coffer. This will prove your abilities to me and I will reward you with an Gold White Pendant.");
    }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 20931 => 1, 20754 => 1, 20755 => 1)) { #magician test of clarification using crimson tessera, ethereal sapphire, feathered cape
    quest::summonitem(1274); #bracelet of clarification
    quest::exp(100000);
    quest::say("Take this as your reward.");
    quest::depop();
    }
  elsif(plugin::check_handin(\%itemcount, 20937 => 1, 20756 => 1, 20757 => 1)) { #magician test of empowerment using iron disc, gem of empowerment, ceramic mask
    quest::summonitem(2707); #mask of empowerment
    quest::exp(100000);
    quest::say("Take this as your reward.");
    quest::depop();
    }
  elsif(plugin::check_handin(\%itemcount, 20870 => 1, 20966 => 1, 20871 => 1, 20872 => 1)) { #magician test of gesticulationt Efreeti Magi Staff, Sweet Nectar, Sphinx Crown, Hazy Opal
    quest::summonitem(11650); #Staff of the Magister
    quest::exp(100000);
    quest::say("Take this as your reward.");
    quest::depop();
    }
  elsif(plugin::check_handin(\%itemcount, 20944 => 1, 20758 => 1, 20759 => 1)) { #magician test of shielding using hyaline globe, ivory pendant, golden coffer
    quest::summonitem(14557); #gold white pendant
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