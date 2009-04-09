sub EVENT_SPAWN {
  quest::settimer("depop",300);
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Great, let us waste no more time! Do you wish to begin your

test of Deception, Stealth, or Cunning?");
    }
  if ($text=~/deception/i) { #rogue test of deception
    quest::say("Deception it is. Proceed upward through the sky and return to

me the honeyed nectar, a bixie stinger, a lightning rod, and a bloodsky

sapphire for the test of deception and earn Ebonsting, caller of

lightning.");
    }
  if ($text=~/stealth/i) { #rogue test of stealth
    quest::say("Stealth is a must. Travel among the residents of the sky and

bring to me a Pegasus Statuette, a Prismatic Sphere, and a Fine Wool Cloak. 

In return, The Scintillating Bracer of Protection shall be yours.");
    }
  if ($text=~/cunning/i) { #rogue test of cunning
    quest::say("Cunning, the true source of all rogue power. Plan and succeed

above us and return to me a bronze disc, a jester's mask, and some red face

paint to compelte the test of cunning. The transparent mask shall be yours if

you do so.");
    }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 20963 => 1, 20994 => 1, 20995 => 1,

20996 => 1)) {  #rogue test of deception using honeyed nectar, bixie stinger,

lightning rod, bloodsky sapphire   
    quest::summonitem(11677); #ebonsting
    quest::exp(100000);
    quest::say("Very good. Here's your reward.");
    quest::depop();
    }
  elsif(plugin::check_handin(\%itemcount, 20949 => 1, 20990 => 1, 20991 =>

1)) { #rogue test of stealth using pegasus statuette, prismatic sphere, fine

wool cloak
    quest::summonitem(2701); #scintillating bracer of protection
    quest::exp(100000);
    quest::say("Very good. Here's your reward.");
    quest::depop();
    }
  elsif(plugin::check_handin(\%itemcount, 20935 => 1, 20987 => 1, 20986 =>

1)) { #rogue test of cunning using bronze disc, jester's mask, red face paint
    quest::summonitem(2702); #transparent mask
    quest::exp(100000);
    quest::say("Very good. Here's your reward.");
    quest::depop();
    }
  else {
    quest::say("What am I supposed to do with these?");
    plugin::return_items(\%itemcount);
    }
}

sub EVENT_TIMER {
  quest::depop();
  quest::stoptimer("depop");
} 