# items: 14789, 14788, 14790, 14783, 3053, 4976, 14786, 3060, 4979, 3056, 4977
sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Begone unless you seek the armor of the [trooper]");
    }
  if ($text=~/trooper/i) {
    quest::say("I can provide [breastplate], [pauldrons], [helm], or [vambraces]");
  }
  if ($text=~/breastplate/i) {
    quest::say("The monk is the master of focus, the shaman of sacrifice and the shadowknight of righteousness. Lastly, our brothers of the dark know confidence. It is then our duty to know perseverance more than any other. When others fall from spear and sword, we must stand. When others are washed away by fire and ice, we must stand. When others are frustrated and confused, we must continue on. There is a warrior in the swamp near the city. He is an exile, like my brother and I. He knows more about than I.");
    quest::summonitem(14789); # Item: Illegible Note: Breastplate
     }
if ($text=~/helm/i) {
  quest::say("You must first learn focus before being awarded the legionnaire scale helm. The Swifttails are the masters of focus and as such you will learn from the Grand Master of the Court. It has been so long, I do not know who is Grand Master now. Whoever it is, give him this note and follow his instruction. Once you have learned, return to us and the helm will be yours.");
  quest::summonitem(14788); # Item: Illegible Note: Helm
}
if ($text=~/vambraces/i) {
  quest::say("Our arms carry more than the weapons of war and the hands that make use of them. We sacrifice the strength in our arms to carry our duties and obligations. Unless we can sacrifice our own bodies and abilities to carry these ideals, we will never be fit to protect the Chosen. Take this note to the master of the mystics in Cabilis, he will teach you a lesson in sacrifice.");
  quest::summonitem(14790); # Item: Illegible Note: Vambraces
 }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 14783 =>1, 3053 =>1  )) {
    quest::say("Well done");
    quest::summonitem(4976); # Item: Trooper Scale Helm
    quest::ding();
    quest::exp(10000);
  }
  if (plugin::check_handin(\%itemcount, 14786 =>1, 3060 =>1 )) {
    quest::say("Well done");
    quest::summonitem(4979); # Item: Trooper Scale Vambraces
    quest::ding();
    quest::exp(10000);
  }
  if (plugin::check_handin(\%itemcount, 14783 =>1, 3056 =>1 )) {
    quest::say("Well done");
    quest::summonitem(4977); # Item: Trooper Scale Breastplate
    quest::ding();
    quest::exp(10000);
  }
  plugin::return_items(\%itemcount);
}