sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Greetings. I can sell you supplies, if you have need or, I can even help you fix up that old Jeweler's [Kit] of yours. Additionally if you like I can convert the various grades of raw Nihilite for you. I will keep a small amount for our use. I will convert raw amber nihilite, raw crimson nihilite, raw indigo nihilite and raw shimmering nihilite.");
  }
  if ($text=~/kit/i) {
     quest::say("We've been working on improving our ability to work with liquid precious metals. To do that, we've had to improve our kits. We've made them a bit larger, and added some reinforcements to help them resist the heat. I can make one for you, just find a turepta shell and two shimmering steel threads and hand them to me along with your Jeweler's Kit and I'll make you a new one.");    
}
 }

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 63838 => 2, 62481 => 1, 17912 => 1)) { #Shimmering Steel Thread x 2, Turepta Shell, Jeweler's Kit
    quest::say("Good work! Here is your new kit.");
    quest::summonitem(62480); #Reinforced Jeweler's Kit
  }
  plugin::return_items(\%itemcount);
}