# Part of Coldain Ring 6 Quest
# items: 30268

sub EVENT_SAY { 
  if($text=~/Hail/i) {
    quest::say("Who dares disturb my rest? If ye be a friend of the mighty Coldain, then show me proof and I shall tell you of my plight. If not, then be on your way.");
  }
}

sub EVENT_ITEM { 
  if (plugin::check_handin(\%itemcount, 30268 => 1)) {
    quest::summonitem("30268");


    my $mobid = $entity_list->GetMobByNpcTypeID(116110);
    if ($mobid) {
      my $mobnpc = $mobid->CastToNPC();
      $mobnpc->SignalNPC(1161101);
    }
    else {
      $mobid = quest::spawn2(116110, 0, 0, 3244, -8102, 147, 0); # NPC: Icefang
      $mob = $entity_list->GetMobID($mobid);
      $mobnpc = $mob->CastToNPC();
      $mobnpc->SignalNPC(1161101);
    }
  

    quest::say("Many seasons ago I stood here in life with my comrades, the best warriors Thurgadin had to offer. Along with our faithful wolven army we were poised to eliminate the Kromrif presence in the region. Somehow, the enemy was made aware of our plans and just before our attack, a group of Ry'Gorr oracles charmed our wolves, forcing them to tear down their own masters. We were caught by surprise and died a savage death.");
  }
}

sub EVENT_SIGNAL {
  if ($signal == 116567) {
    quest::say("All that remains from that battle is my loyal Icefang. He will not rest until I am avenged. Follow and watch after him. He alone knows where our attackers lie and he cannot overcome them by himself. May Brell bless you with success, farewell.");
    quest::signalwith(116110, 1161102, 100); # NPC: Icefang
  }
}

# Quest by mystic414