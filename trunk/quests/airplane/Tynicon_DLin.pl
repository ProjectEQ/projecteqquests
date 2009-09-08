sub EVENT_SPAWN {
  quest::settimer("depop",300);
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Great, let us waste no more time! I offer to you four challenges. Disempowement, Envenoming, Raising of the Dead, or Necropotence. Choose one to be tested on.");
    }
  if ($text=~/disempowerment/i) { #shadowknight test of disempowerment
    quest::say("Disempowerment, destroying good magic. Proceed upward through the sky and return to me a Griffon Statuette, a Blood Sky Emerald, and Rusted Pauldrons. This will prove your abilities to me and I will reward you with Blood Sky Face plate.");
    }
  if ($text=~/envenoming/i) { #shadowknight test of envenoming
    quest::say("Venom and hate permeates us more than our dumber, larger brohers. Return to me a Efreeti War Shield, a Dark Spiroc Feather, and an Obsidian shard and prove that your soul is envenomed with hatred. If you do so the Obtenebrate Mithril Guard shall be yours.");
    }
  if ($text=~/raising of the dead/i) { #shadowknight test of raising of the dead
    quest::say("The dead are our allies against those that would oppose us. Proceed upward through the sky and return to me a Large Sky Pearl, a Jar of Honey, a Sphinxian Ring, and Fae Pauldrons. This will prove your abilities to me and I will reward you with an Pearlescent Pauldrons.");
    }
  if ($text=~/necropotence/i) { #shadowknight test of necropotence
    quest::say("Only the most powerful and vile of shadow knights manage to complete this test. Return to me an Efreeti War Axe, some Dulcet Nectar, a Bloodstained Hilt, and a Blood Sky Ruby. Doing so will earn you the right to wield the Drinker of Blood.");
    }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 20950 => 1, 20703 => 1, 20704 => 1)) { #shadowknight test of disempowerment using griffon statuette, blood sky emerald, rusted pauldrons
    quest::summonitem(4322); #blood sky face plate
    quest::exp(100000);
    quest::say("You have learned the ways of Disempowerment.");
    quest::depop();
    }
  elsif(plugin::check_handin(\%itemcount, 20705 => 1, 20957 => 1, 20706 => 1)) { #shadowknight test of envenoming using efreeti war shield, dark spiroc feather, obsidian shard
    quest::summonitem(11678); #obtenebrate mithril guard
    quest::exp(100000);
    quest::say("You soul is truly envenomed with hate.");
    quest::depop();
    }
  elsif(plugin::check_handin(\%itemcount, 20707 => 1, 20708 => 1, 20709 => 1, 20710 => 1)) { #shadowknight test of raising of the dead using large sky pearl, jar of honey, sphinxian ring, fae pauldrons
    quest::summonitem(11699); #pearlescent pauldrons
    quest::exp(100000);
    quest::say("You have proven your abilities.");
    quest::depop();
    }
  elsif(plugin::check_handin(%itemcount, 20711 => 1, 20964 => 1, 20713 => 1, 20712 => 1)) { #shadowknight test of necropotence using efreeti war axe, dulcet nectar, bloodstained hilt, blood sky ruby
    quest::summonitem(11679); #rheumguls
    quest::exp(100000);
    quest::say("You have truly earned this.");
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