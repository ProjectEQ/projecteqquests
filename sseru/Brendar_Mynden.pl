# Poisoning Brendar
#

sub EVENT_SAY {
  if ($text=~/compromise/i) {
    quest::say("A compromise? Zabaltin has fought me in every request asking for help protecting the delivery caravans! I will never work with him. Say what is that in your hand? The label looks like it is a bottle of my favorite ale. It's from Zabaltin you say? Maybe he really is trying to work things out. Well then let's open the bottle and have a drink!");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 67010 => 1)) {
    quest::emote("open the bottle and takes a large drink right from it. Immediately his eyes roll back into their sockets and he falls to the ground. You look around to make sure no one has seen and then take the ring from his finger.");
    quest::doanim(15);
    $npc->SetAppearance(3);
    quest::depop_withtimer();
    quest::summonitem(29863);
  }
  plugin::return_items(\%itemcount);
}

# EOF zone: sseru ID: 159408 NPC: Brendar_Mynden

