#############
#Quest Name: Crown of Deceit
#Author: Shadestrike
#NPCs Involved: Sage Balic, an_old_froglok
#Zone: Upper Guk
##############

sub EVENT_AGGRO {
quest::say("Frrroooaaakkk!");
}

sub EVENT_SAY {
  if ($text=~/Hail/i) {
    quest::say("Frroooaaaaaakkkk!");
  }
  if ($text=~/mask/i) {
    quest::say("Frroooaaaaaakkkk! Speciaaal maaask I maaake for sneaky types! Lost long ago! Baaad frogs taaake! I too old to maaake more! Frroooaaaaaakkkk! Maaagic aaalmost used up! So cold! You help me! I help you!");
  }
  if ($text=~/help/i) {
    quest::say("Frroooaaaaaakkkk! So cold! You bring me waaarm velium mastodon fur cloaaak! I need supplies! You bring me maaana juice! You bring me elf essence! You bring me sturdy froglock crown those naaasty big frogs stole! Frroooaaaaaakkkk! I maaake you something nice! So cold! You bring me all those things, don't forget cloaaak!");
  }
  }
  sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 11275 => 1)) {
    quest::say("Frroooaaaaaakkkk! I'm in this book! You see me! Owww that flip hurt my old bones! Frroooaaaaaakkkk! Look there is a picture of my maaask from long ago! Frroooaaaaaakkkk! I keep book! You taaake this recipe! Maaaybe more! I'm in book! Frroooaaaaaakkkk!");
    quest::summonitem(18499);
  }
  if (plugin::check_handin(\%itemcount, 11274 => 1, 11276 => 1, 10254 => 1, 26999 => 1)) {
    quest::say("Frroooaaaaaakkkk!!! This cloaaak so waaarm! Here let me work! Frroooaaaaaakkkk!' The old froglok goes to work on the crown and after uttering a few froaks, a small cloud of smoke rises from the crown. You reach over and pick it up. 'Frroooaaaaaakkkk! Maaagic haaat! Taaake good care of it aaand staay away from baaad frogs! Frroooaaaaaakkkk!");
    quest::summonitem(11277);
  }
  } 