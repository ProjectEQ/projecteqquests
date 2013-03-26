#Lobal_Postugger.pl
#Rogue Tomes/Rogue Master Sketch

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Hello. I am the guild master.");
  }
  if($text=~/dark assassin/i) {
    quest::say("You have heard of him? I had a nice conversation with him. Sharing some secrets of gnomish spirits if yah know what i mean! In return he gave me a sketch that looks quite interesting. Of course I am stuck in this place waiting youngsters to teach when I would rather be out with you making poisons. Perhaps you are willing to make a trade with me for the sketch?");
  }
  if($text=~/trade/i) {
    quest::say("Fantastic! If you combine Rage of Incapacitation, Wasted Flesh and Dreams of Drusella within a coffin bottle you can make me a nice bundle of poisons to play with. Then I will have no need for the sketch.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 9470 => 1)){ #Bundle of Poisons
    quest::emote("laughs. 'Here, take this then!'"); #text made up
    quest::summonitem(24096); #Dip Resist Sketch
  }
  #Moved for preservation, should still work -Kilelen
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
  plugin::return_items(\%itemcount);
}
#Done