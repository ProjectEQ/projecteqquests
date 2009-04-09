sub EVENT_SPAWN {
  quest::settimer("depop",300);
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Greetings $name. I can only assume my reasons for being

summoned is that you wish to take the tests. Would you like to be tested in

the body, in defense, or in the element of earth?");
    }
  if ($text=~/body/i) { #ranger test of body
    quest::say("Very well. You must scour this plane and bring back to me

these components: an auburn tessera, a ysgaril root, and a griffon talon.

Make haste, and good luck.");
    }
  if ($text=~/defense/i) { #ranger test of defense
    quest::say("Defense it is. You must prove yourself worthy enough for the

Spiroc spirits to guard you. Bring back to me a mithril disc, a harpy tongue,

and a fine velvet cloak. Good luck to you $name.");
    }
  if ($text=~/element of earth/i) { #ranger test of the element of earth
    quest::say("Elemental earth you say? When honed, the elements can be

among our best allies. Retrieve a gridelin globe, a dragon hide mantle, and a

spiroc earth totem. Only with these items can you master the element of

earth.");
    }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 20934 => 1, 20850 => 1, 20849 => 1)) { #ranger test of body using auburn tessera, griffon talon, ysgaril root
    quest::summonitem(2715); #griffon talon
    quest::exp(100000);
    quest::say("Good work, ranger.");
    quest::depop();
    }
  elsif(plugin::check_handin(\%itemcount, 20853 => 1, 20852 => 1, 20851 =>

1)) { #ranger test of defense using fine velvet cloak, harpy tongue, mithril disc
    quest::summonitem(27731); #dark cloak of the sky
    quest::exp(100000);
    quest::say("Good work, ranger.");
    quest::depop();
    }
  elsif(plugin::check_handin(\%itemcount, 20854 => 1, 20948 => 1, 20855 =>

1)) { #ranger test of the element of earth using dragon-hide mantle, gridelin globe, spiroc earth totem
    quest::summonitem(2714); #earthshaker's mantle
    quest::exp(100000);
    quest::say("Good work, ranger.");
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