# Rozzut's Whistler
#

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hello, $name. What brings you to this neck of the mountains? Do you have any work for me?");
  }
  if ($text=~/i have work for you/i) {
    quest::say("Very good. Very good. What I require, if it is the whistler ya seek, is 500 platinum and the two components necessary. Once I have all three, I will then commence ta doin that right away fer ya.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 12880 => 1, 6552 => 1) && ($platinum == 500)) {
    quest::say("I thank ya for ya patronage. Here is what ya came here for. Now be careful who ya point this at. 'Tis quite sharp, $race. Be off with ya now as I must get back ta workin here. Good day!");
    quest::summonitem(6551);
    quest::exp(25000);
  }
  else {
    plugin::return_items(\%itemcount);
  }
}

# EOF zone: butcher ID: 68089 NPC: Dapper_Blackhammer

