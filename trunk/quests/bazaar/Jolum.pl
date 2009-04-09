#Jolum.pl
#Grandmaster's Carry-All


sub EVENT_SAY {
 if($text =~ /Hail/i) {
	quest::say("Hail! Nice to see ya, friend. I've got a fine selection of spankin' good spells, perhaps you'd be interested? Or maybe you'd like to learn how to [upgrade] your Grandmaster Trade items? Still yet, maybe you would like to know how to create a [Grandmaster's Medicine Bag]?");
 }
 elsif($text =~ /upgrade/i) {
 	quest::say("What Grandmaster Trade item would you like to know how to upgrade? I can tell you how to upgrade your [Grandmaster Baker's Spoon], [Grandmaster Brewer's Corker], [Grandmaster Fletcher's Knife], [Grandmaster Jeweler's Eyeglass], [Grandmaster Potter's Sculpter], [Grandmaster Smith's Hammer], [Grandmaster Tailor's Needle], or your [Grandmaster Tinker's Spanner]. While you can't have more than one of the new items, they will summon a [bag] for you. Very useful for carrying heavy items about and such.");
 }
 elsif($text =~ /bag/i) {
 	quest::say("Its a very sturdy bag, but I'm afraid that it's only temporary. If you'd like to get a more permanent bag, just hand me your summoned one and I'll trade it out you.");
 }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 17900 => 1)) {#Grandmaster's Satchel
    quest::say("Here's a more permanent bag.");#Text made up, no reference
    quest::summonitem(17138);#Grandmaster's Carry-all
  }
  else {
    quest::say("I don't need this."); #text made up
    plugin::return_items(\%itemcount);
    return 1;
  }
  
}
