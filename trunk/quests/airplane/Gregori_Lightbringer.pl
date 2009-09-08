sub EVENT_SPAWN {
  quest::settimer("depop",300);
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("As I said before, the test of the heart is in three parts.  Compassion, Sacrifice and Love. Choose one and we will begin.");
    }
  if ($text=~/compassion/i) { #paladin test of compassion
    quest::say("Compassion is of great importance to us. Without it, we do not feel empathy, and cannot truly follow the path we claim to travel. Return to me an Efreeti zweihander, dulcet nectar, a golden hilt, and a large sky diamond. If you present these to me, I will award you Truvinan, the divine wind.");
    }
  if ($text=~/sacrifice/i) { #paladin test of sacrifice
    quest::say("You have sacrificed much to come so far Erudite. Sacrifice this one last time and the sword of ocean breeze shall be yours. Retrieve a griffon statuette, a spiroc peace totem, and a bixie sword blade.");
    }
  if ($text=~/love/i) { #paladin test of love
    quest::say("Love is what makes us close to the gods we follow. Without it, we could not truly worship them, and would be lost. Prove yourself to me and return with a dark spiroc feather, ethereal topaz, and a sphinx claw.  In return I will give you Zephyrwind.");
    }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 20725 => 1, 20964 => 1, 20726 => 1, 20727 => 1)) { #paladin test of compassion using efreeti zweihander, dulcet nectar, golden hilt, large sky diamond
    quest::summonitem(11682); #Truvinan, the divine wind
    quest::exp(100000);
    quest::say("");
    quest::depop();
    }
  elsif(plugin::check_handin(\%itemcount, 20950 => 1, 20721 => 1, 20722 => 1)) { #paladin test of sacrifice using griffon statuette, spiroc peace totem, bixie sword blade
    quest::summonitem(27708); #Aldryn, blade of the ocean
    quest::exp(100000);
    quest::say("");
    quest::depop();
    }
  elsif(plugin::check_handin(\%itemcount, 20957 => 1, 20723 => 1, 20724 => 1)) { #paladin test of love using dark spiroc feather, ethereal topaz, sphinx claw
    quest::summonitem(11681); #Zephyrwind
    quest::exp(100000);
    quest::say("");
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