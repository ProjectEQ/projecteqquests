# nesiff's statue
#

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hail, Kajigger. I am Vesteri Namanoi. I provide training to the Jaggedpine Treefolk and their allies. If you are not busy, I would like to ask a small [favor] of you.");
  }
  if ($text=~/favor/i) {
    quest::say("I need you to take this claim check to Qeynos for me. Nesiff Talaherd is a woodcarver who owns a shop in South Qeynos. I am having him carve a small statue of Tunare for Te'Anara. With my training schedule, I can not make the journey to Qeynos. Please give this claim check to Nesiff and bring the statue to me. It is a surprise, so please do not say anything to Te'Anara about it.");
    quest::summonitem(18012);
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 13864 => 1)) {
    quest::say("Oh thank you so much! Here. Take this reward for your time. I will also tell Te'Anara of you.");
    quest::exp(250);
    quest::givecash(10,2,0,0);
    quest::faction(159,10); #jaggedpine treefolk
    quest::faction(265,10); #protectors of pine
    quest::faction(267,10); #qrg protected animals
    quest::faction(347,-30); #unkempt druids
    quest::faction(135,10); #guards of qeynos
  }
  else {
    plugin::return_items(\%itemcount);
  }
}

# EOF zone: qrg ID: 3038 NPC: Vesteri_Nomanoi

