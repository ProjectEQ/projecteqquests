# items: 1155, 2045
sub EVENT_SAY {
  if($text=~/Hail/i) {
    quest::say("Errr?  What you say to Urrrkath?  Ah.  Hello to you as well. furrrless type person. Would you do Urrrkath a [favor]?");
  }
  if ($text=~/favor/i) {
    quest::say("Grrreatful I am that you would think to do this for me.  I am in need of a special leaf, called a [Sylvani Leaf], if you could brrrring this to me I would rrrrreward you verrrry well.");
  }
  if ($text=~/Sylvani Leaf/i) {
    quest::say("They say that the leaf only exists in a small forest farrrrr frrrrrom ourrrrrr island");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 1155 => 1)) {
    quest::say("Excellent! I can't believe you found it.  Here is the rrrreward that I promised you.");
    quest::summonitem(2045); # Item: Worn Leather Shoulderpads
  }
}
#END of FILE Zone:kerraridge  ID:74090 -- Urkath_Greyface *Text is not correct, need correct text if anyone has it.