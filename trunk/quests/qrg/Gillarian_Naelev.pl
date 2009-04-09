sub EVENT_SAY {
  if($text =~ /Hail/i) {
    quest::say("Welcome, friend. Welcome to Surefall Glade. I need not remind you about [poaching], I hope");
  }
  if($text =~ /poaching/) {
    quest::say("Poaching is illegal. We here are the Protectors of the Pine, rangers sworn to protect our land and all its inhabitants. This includes the wildlife. We spend a lot of time hunting poachers. If you want to [join the hunt], just let me know.");
 }
  if($text =~ /join the hunt/) {
    quest::say("Very good, friend. Be on the lookout for poachers in Surefall Glade or Qeynos Hills, especially in the nearby caves. The poachers are not always human. Often times we find ourselves a Blackburrow gnoll or two. Bring me back their heads. Let's see how they look mounted above the mantle! Be on your way, then.");
  }
}

sub EVENT_ITEM {
  #do all other handins first, then let it do disciplines
  if (plugin::check_handin(\%itemcount, 13813 => 1)) {
    #need text.
    quest::say("Good job, $name.");
    quest::summonitem(8803); #Rough Elm Recurve Bow
    quest::givecash(0, 2, 0, 0);
    quest::faction(159,3); #jaggedpine treefolk
    quest::faction(265,3); #protectors of pine
    quest::faction(279,-3); #Sabertooths of Blackburrow
    quest::faction(135,3); #guards of qeynos
    quest::exp(6000);
    quest::ding();
  }
  elsif (plugin::check_handin(\%itemcount, 13825 => 1)) {
    # need text.
    quest::say("Good job, $name.");
    quest::givecash(0, 2, 0, 0);
    quest::faction(159,3); #jaggedpine treefolk
    quest::faction(265,3); #protectors of pine
    quest::faction(279,-3); #Sabertooths of Blackburrow
    quest::faction(135,3); #guards of qeynos
    quest::exp(6000);
    quest::ding();
  }
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Ranger');
  plugin::return_items(\%itemcount);
}

