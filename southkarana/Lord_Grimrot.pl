# items: 12137, 2137, 2148
sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Welcome to my field of decay. Won't you be so kind as to attack me? I have need of more bodies to join my diseased legion. Try it, maybe you shall win and gain my trusty [Pestilence].");
  }
  if($text=~/pestilence/i) {
    quest::say("My beloved scythe. Upon my death, my soul shall live withn her. Such is the pact.");
  }
  if($text=~/Arlena/i) {
    quest::say("My beloved Arlena is my most perfect creation. A bit of flesh here, a bit of bone there and I created her. She left my arms while I was away. Find her and stop her. Return her bones to me so that I may restore her. She has no doubt returned to where I first met.. most.. of her, [Mistmoore Castle].");
  }
  if($text=~/mistmoore/i) {
    quest::say("It stands on the continent of Faydwer. That is all you need to know.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 12137 => 1)) {
    quest::say("The head for my commander. Let us see. I have a body ready for it. There. Hahahaha!! As for your fine work, take this. Also, I believe you can help me find my beloved [Arlena].");
    quest::faction(221, 15); # Faction: Bloodsabers
    quest::faction(262, -2); # Faction: Guards of Qeynos
    quest::faction(296, 1); # Faction: Opal Darkbriar
    quest::faction(341, -3); # Faction: Priests of Life
    quest::faction(230, 1); # Faction: Corrupt Qeynos Guards
    quest::givecash(0, 0, 7, 0);
    quest::summonitem(plugin::RandomRange(2137, 2148)); # Item: Raw-hide Skullcap
  }
}
#END of FILE Zone:southkarana  ID:3312 -- Lord_Grimrot
