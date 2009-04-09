
sub EVENT_SPAWN {
  quest::settimer("depop",300);
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Great, let us waste no more time! Do you wish to begin your test

of concentration, focus, or meditation?");
    }
  if ($text=~/concentration/i) { #wizard test of concentration
    quest::say("Concentration it is. Proceed upward through the sky and return to

me an Azure Tessera, an Augmentor’s Gem, and a Grey Damask Cloak. This will prove

your ability to concentrate and I will reward you with an Augmentors Mask.");
    }
  if ($text=~/focus/i) { #wizard test of focus
    quest::say("Focus is a must. Travel among the residents of the sky and bring

to me an Iron Disc, an Ethereal Opal, and a Woven Skull Cap. This will prove your

ability to focus and I will reward you with Al`Kabors Cap.");
    }
  if ($text=~/meditation/i) { #wizard test of meditation
    quest::say("Meditation, the fix for all. Fly to those above and return to me a

Hyaline Globe, a Sky Topaz, and a High Quality Raiment. If you are successful, I

will reward you with the Raiment of Thunder.");
    }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 20930 => 1, 20741 => 1, 20742 => 1)) {

#wizard test of concentration using azure tessera, augmentor's gem, grey damask

cloak
    quest::summonitem(1272); #augmentor's mask
    quest::exp(100000);
    quest::say("Ah good. Take this as your reward.");
    quest::depop();
    }
  elsif(plugin::check_handin(\%itemcount, 20937 => 1, 20743 => 1, 20744 => 1)) {

#wizard test of focus using iron disc, ethereal opal, woven skull cap
    quest::summonitem(1271); #Al`kabor's cap of binding
    quest::exp(100000);
    quest::say("Ah good. Take this as your reward.");
    quest::depop();
    }
  elsif(plugin::check_handin(\%itemcount, 20944 => 1, 20745 => 1, 20746 => 1)) {

#wizard test of meditation using hyaline globe, sky topaz, high quality raiment
    quest::summonitem(1273); #raiment of thunder
    quest::exp(100000);
    quest::say("Ah good. Take this as your reward.");
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