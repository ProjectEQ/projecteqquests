#Note: All text contained herein is non-Live. Need to acquire original

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Greetings, youngling. Are you here seeking wisdom or are you here to [work]?");
  }
  if($text=~/work/i) {
    quest::say("Ah! Excellent! Than you shall acquire wisdom THROUGH work! As a mystic, you will need to learn [arts of creation], and you can learn that by watching me work.");
  }
  if($text=~/arts of creation/i) {
    quest::say("Yes yes... the arts of creation. You'll need to do some leg work in the fields to gather the materials for me to show you how to create [boots], [bracers], a [cloak], or [vambraces].");
  }
  if($text=~/boots/i) {
    quest::say("I'll need you to bring me some banded boots, a fire emerald, some spirit caller beads, and a rhino hoof. Come back to me when you have all the components and then give them to me, then I'll show you how to make boots.");
  }
  if($text=~/bracers/i) {
    quest::say("I'll need you to bring me a banded bracer, a ruby, a coercion implant, and some gooey adhesive. Bring all that back to me and I'll show you how to make a bracer.");
  }
  if($text=~/cloak/i) {
    quest::say("To make a cloak for you, I'll need a banded cloak, a star ruby, a forest giant hammer, and some worn charbone. Good luck getting all those components together. Bring them back when you have them and I'll show you how to make your cloak.");
  }
  if($text=~/vambraces/i) {
    quest::say("Ah! You want arm coverings? Well fetch me some banded sleeves, a sapphire, a frenzied gnawer tail, and some froglok treated planks.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 3064 => 1, 10033 => 1, 14767 => 1, 14768 => 1)) {
    quest::say("Ah! Excellent! Now just watch... and... here! Now you know how to make your own boots! Take this pair in case you didn't actually learn anything.");
    quest::exp(1000);
    quest::summonitem(4984); #scaled mystic boots
    quest::faction(282,10);
    quest::faction(193,5);
    quest::faction(30,5);
    quest::ding();
  }
  if(plugin::check_handin(\%itemcount, 3061 => 1, 10035 => 1, 14769 => 1, 14770 => 1)) {
    quest::say("What's this? Oh the parts for your bracer. Well just watch me work... and... done! Take these as an example of what a skilled craftsman can do. Strive for this perfection.");
    quest::summonitem(4988); #scaled mystic bracers
    quest::exp(1000);
    quest::faction(282,10);
    quest::faction(193,5);
    quest::faction(30,5);
    quest::ding();
  }
  if(plugin::check_handin(\%itemcount, 3058 => 1, 10032 => 1, 14765 => 1, 14766 => 1)) {
    quest::say("Well you finally brought the parts to learn how to make your cloak. Just watch this... and... all done. It's not the best I've ever made, but it's fitting for a novice.");
    quest::summonitem(4991); #scaled mystic cloak
    quest::exp(1000);
    quest::faction(282,10);
    quest::faction(193,5);
    quest::faction(30,5);
    quest::ding();
  }
  if(plugin::check_handin(\%itemcount, 3060 => 1, 10034 => 1, 14763 => 1, 14764 => 1)) {
    quest::exp(1000);
    quest::summonitem(4986); #scaled mystic vambraces
    quest::faction(282,10);
    quest::faction(193,5);
    quest::faction(30,5);
    quest::ding();
  }
  plugin::return_items(\%itemcount);
}