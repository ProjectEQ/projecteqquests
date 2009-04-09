sub EVENT_SPAWN {
  quest::settimer("depop",300);
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("So, I have been called upon to test you, and test you I
shall. I will give you the option of choosing your test though enlightened
one. Shall you take the test of Strength, Sight, or Speed?");
    }
  if ($text=~/strength/i) { #monk test of strength
    quest::say("So be it, the test of Strenth you shall have. Bring to me a
Verdant Tessera, some Finely Woven Gold Mesh,  and some Silken Strands. The
task will not be easy, but it should serve as an adequate test of Strengh,
for one of your abilities.");
    }
  if ($text=~/sight/i) { #monk test of sight
    quest::say("The test of sight is both a test of body and mind. The mind
will allow you to see beyond that which is usually, invisible. Bring me a
Gold Disc, a Tiny Ruby, and a Cracked Leather Eyepatch and I will assist you
in seeing what should not be seen.");
    }
  if ($text=~/speed/i) { #monk test of speed
    quest::say("The test of speed. Every Monk must be swift if he is to best
his opponent. Speed in both mind and body is essential in many facets of
life. Return to me an Adumbrate Globe, a Shimmering Opal,  and some Dove
Slippers and I shall aid your speed of mind.");
    }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 20793 => 1, 20794 => 1, 20932 => 1)) { #monk test of strength using finely woven gold mesh, silken strands, verdant tessera
    quest::summonitem(1282); #mystical back straps
    quest::exp(100000);
    quest::say("You have done well, $name.");
    quest::depop();
    }
  elsif(plugin::check_handin(\%itemcount, 20796 => 1, 20939 => 1, 20795 =>
1)) { #monk test of sight using cracked leather eyepatch, gold disc, tiny ruby
    quest::summonitem(1281); #ton po's eyepatch
    quest::exp(100000);
    quest::say("You have done well, $name.");
    quest::depop();
    }
  elsif(plugin::check_handin(\%itemcount, 20946 => 1, 20798 => 1, 20797 =>
1)) { #monk test of speed using adumbrate globe, dove slippers, shimmering opal
    quest::summonitem(1280); #sandals of alacrity
    quest::exp(100000);
    quest::say("You have done well, $name.");
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