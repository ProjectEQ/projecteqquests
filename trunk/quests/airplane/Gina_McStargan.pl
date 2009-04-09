sub EVENT_SPAWN {
  quest::settimer("depop",300);
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Greetings, $name. I will test you in the tests of might, health,

and sight. Which will it be?");
    }
  if ($text=~/might/i) { #shaman test of might
    quest::say("The test of might It Is. Go find an Auburn Tessera, a Drake Fang

and a Leather Chord. Bring them to me when you have them all and I shall reward

you.");
    }
  if ($text=~/health/i) { #shaman test of health
    quest::say("The test of health Is difficult. I am sure that you will find It a

challenge. Bring to me a Platinum Disc, some Ethereal Amber, a Shimmering Amber

and finally a Ceremonial Belt. Return them all to me at once and you shall have

your just reward.");
    }
  if ($text=~/sight/i) { #shaman test of sight
    quest::say("So you wish to take the test of sight do you? Get me a Phosphoric

Globe, a Sphinx Hide and a Light Damask Mantle. Give them all to me at the same

time and I shall reward you well.");
    }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 20934 => 1, 20834 => 1, 20835 => 1)) {

#shaman test of might using auburn tessera, drake fang, leather cord
    quest::summonitem(14566); #drake fang amulet
    quest::exp(100000);
    quest::say("Excellent! Take this as your reward.");
    quest::depop();
    }
  elsif(plugin::check_handin(\%itemcount, 20940 => 1, 20836 => 1, 20837 => 1,

20838 => 1)) { #shaman test of health using platinum disc, ethereal amber,

shimmering amber, ceremonial belt
    quest::summonitem(27727); #bracelet of the spirits
    quest::exp(100000);
    quest::say("Excellent! Take this as your reward.");
    quest::depop();
    }
  elsif(plugin::check_handin(\%itemcount, 20947 => 1, 20839 => 1, 20840 => 1)) {

#shaman test of sight using phosphoric globe, sphinx hide, light damask mantle
    quest::summonitem(27728); #fairy-hide mantle
    quest::exp(100000);
    quest::say("Excellent! Take this as your reward.");
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