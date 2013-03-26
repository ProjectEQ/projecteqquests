# Jracol Brestiage
# Rogue Errands

my $proof = 0;

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("You'd better run along, if ya know what's best for ya!");
  }
  if($text=~/lovely night for a stroll/i) {
    quest::say("Yes, it is a lovely night for a walk, especially with a good friend. Tell me, are you a [friend]?");
    $proof = 1;
  }
  if(($text=~/friend/i) && ($proof == 1)) {
    quest::say("My memory is a bit fuzzy. If you are a friend, prove it to me.");
    $proof = 2;
  }
}

sub EVENT_ITEM {
  if(($proof == 2) && plugin::check_handin(\%itemcount, 13903 => 1)) { #Bent Card
    quest::say("Ah, good, it seems we have much in common after all. Take this back to the Circle, before the city guards come nosing around over here.");
    quest::summonitem(18722); #Sealed Note For Knargon
    quest::faction(31,5);    #Carson McCabe
    quest::faction(149,5);   #Highpass Guards
    quest::faction(214,5);   #Merchants of Highpass
    quest::faction(48,5);    #Coalition of Tradefolk Underground
    quest::faction(273,-10); #Ring of Scale
    $proof = 0;
  }
  plugin::return_items(\%itemcount);
}