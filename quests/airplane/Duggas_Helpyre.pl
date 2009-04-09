sub EVENT_SPAWN {
  quest::settimer("depop",300);
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("So, you dare be seen in my precense. Truly a brave fool you
are. You come seeking fame and glory here do you? Well fool, perhaps you will
get what you seek. Shall you take the test of the Heart, the Hands, or the
Finger?");
    }
  if ($text=~/heart/i) { #necromancer test of heart
    quest::say("So the heart it be. Bring me, foolish one, an Imp Statuette,
an Obsidian Amulet, and a Pulsating Ruby. Perhaps then, you shall find your
reward.");
    }
  if ($text=~/hands/i) { #necromancer test of hands
    quest::say("The test of the Hands it shall be. Bring me a Gorgon's Head,
some Aged Nectar, a Glowing Black Pearl, and an Efreeti's Great Staff. When
you return, I shall reward you for your deeds, assuming you live through the
experience. Hahaha!");
    }
  if ($text=~/finger/i) { #necromancer test of the finger
    quest::say("The finger. Needed for nearly every casting you shall ever
hope to produce, it truly is the most powerful creation. Should you bring me
a White Spiroc Feather, a Nebulous Ring, and the Ring of Veeshan, I shall
reward you with power that you can just now begin to comprehend.");
    }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 20953 => 1, 20786 => 1, 20787 => 1)) { #necromancer test of heart using imp statuette, obsidian amulet, pulsating ruby
    quest::summonitem(14560); #sphinx heart amulet
    quest::exp(100000);
    quest::say("Haha! So you lived! Take this and be gone!");
    quest::depop();
    }
  elsif(plugin::check_handin(\%itemcount, 20790 => 1, 20967 => 1, 20791 => 1,
20792 => 1)) { #necromancer test of hands using gorgon's head, aged nectar, glowing black pearl, efreeti's great staff
    quest::summonitem(11689); #gorgon head staff
    quest::exp(100000);
    quest::say("Haha! So you lived! Take this and be gone!");
    quest::depop();
    }
  elsif(plugin::check_handin(\%itemcount, 20960 => 1, 20788 => 1, 20789 => 1)) { #necromancer test of the finger using white spiroc feather, nebulous ruby, ring of veeshan
    quest::summonitem(27713); #band of wailing winds
    quest::exp(100000);
    quest::say("Haha! So you lived! Take this and be gone!");
    quest::depop();
    }
  else {
    quest::say("What? What are these for? Go Away!");
    plugin::return_item(\%itemcount);
  }
}

sub EVENT_TIMER {
    quest::depop();
    quest::stoptimer("depop");
}