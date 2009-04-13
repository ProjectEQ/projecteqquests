sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Begone unless you seek the armor of the [trooper]");
    }
  if ($text=~/trooper/i) {
    quest::say("I can provide [breastplate], [pauldrons], [helm], or [vambraces]");
  }
  if ($text=~/breastplate/i) {
    quest::say("The monk is the master of focus, the shaman of sacrifice and the shadowknight of righteousness. Lastly, our brothers of the dark know confidence. It is then our duty to know perseverance more than any other. When others fall from spear and sword, we must stand. When others are washed away by fire and ice, we must stand. When others are frustrated and confused, we must continue on. There is a warrior in the swamp near the city. He is an exile, like my brother and I. He knows more about than I.");
     }
if ($text=~/helm/i) {
  quest::say("You must first learn focus before being awarded the legionnaire scale helm. The Swifttails are the masters of focus and as such you will learn from the Grand Master of the Court. It has been so long, I do not know who is Grand Master now. Whoever it is, give him this note and follow his instruction. Once you have learned, return to us and the helm will be yours.");
}
if ($text=~/vambraces/i) {
  quest::say("Our arms carry more than the weapons of war and the hands that make use of them. We sacrifice the strength in our arms to carry our duties and obligations. Unless we can sacrifice our own bodies and abilities to carry these ideals, we will never be fit to protect the Chosen. Take this note to the master of the mystics in Cabilis, he will teach you a lesson in sacrifice.");
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}