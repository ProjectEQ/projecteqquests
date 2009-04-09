sub EVENT_SPAWN {
  quest::settimer("depop",300);
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Greetings Warrior of mind and body. To prove your worth to

me, you must complete a test. Which test do you wish to take? I will permit

you to take the test of Tears, Fists, or Tranquility.");
    }
  if ($text=~/tears/i) { #monk test of tears
    quest::say("The test of tears involves knowing when to release, and when

to provide a shoulder for another. Bring me a Spiroc Statuette, a Spiroc

Talon, and a Silken Wrap. I will teach you the way.");
    }
  if ($text=~/fists/i) { #monk test of fists
    quest::say("A monk must know when to use his or her fists, and when to

use ones mind. You must decide in this endevour, which you shall use. Return

to me, once you have found them, a pair of Brass Knuckles, a White Spiroc

Feather, an Emerald Amethyst, and a Nebulous Sapphire.");
    }
  if ($text=~/tranquility/i) { #monk test of tranquility
    quest::say("Ah, the test of tranquility. Only the tranquil monk can

achieve enlightenment. Are you such an individual? Time shall tell. Retrieve

these items for me. Bring an Aged Nectar, a Writ of Quellious, and a Glowing

Diamond and we shall asses your ability.");
    }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 20800 => 1, 20954 => 1, 20799 => 1)) { #monk test of tears using silken wrap, spiroc statuette, spiroc talon
    quest::summonitem(1283); #ton po's shoulder wraps
    quest::exp(100000);
    quest::say("You have moved closer to enlightenment.");
    quest::depop();
    }
  elsif(plugin::check_handin(\%itemcount, 20803 => 1, 20801 => 1, 20802 => 1,

20960 => 1)) { #monk test of fists using brass knuckles, ethereal amethyst, nebulous sapphire, white spiroc feather
    quest::summonitem(11690); #wu's tranquil fist
    quest::exp(100000);
    quest::say("You have moved closer to enlightenment.");
    quest::depop();
    }
  elsif(plugin::check_handin(\%itemcount, 20967 => 1, 20804 => 1, 20805 =>

1)) { #monk test of tranquility using aged nectar, degree of quellious, tear of quellious
    quest::summonitem(11698); #golden sash of tranquility
    quest::exp(100000);
    quest::say("You have moved closer to enlightenment.");
    quest::depop();
    }
  else {
    quest::say("These will not bring you enlightenment.");
    plugin::return_items(\%itemcount);
    }
}

sub EVENT_TIMER {
  quest::depop();
  quest::stoptimer("depop");
} 