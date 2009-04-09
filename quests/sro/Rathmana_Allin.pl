sub EVENT_SAY {
  if($text=~/hail/i){
    quest::say("Company?! Way out here in the desert of Ro? This is a pleasant surprise! Won't you stay for a while? I am sure the desert has dried your throat. I have supplies if necessary. At a price, of course. Are you [traveling] or are you here on [business]?");
  }
  if($text=~/business/i){
    quest::say("Of course. You do not look like a traveling merchant or a lost adventurer. Someone has sent you to Rathmana. Well then, let's not waste time. Give me the item, or items, and my fee of twenty gold coins. It must be gold. I have no use for any other metals.");
  }
  if($text=~/traveling/i){
    quest::say("Oh, wonderful! Then you must need water and rations for your long journey. Be sure to approach any camp you may find in Ro with caution. There are many bandits in the desert. If it were not for Ortallius, they would have gutted me and thieved all my merchandise by now. If you have any use of magic then I believe I may have an [offer] for you.");
  }
  if($text=~/offer/i){
    # Rathmana's Scroll Offer
    quest::say("My offer to you is this, you give me thirty gold and I allow you to reach into my scroll bag and retrieve one scroll and only one. It may be the spell of a wizard or maybe not. The school of magic will not be known beforehand. The only knowledge you will have is that Rathmana will not exchange the spell for another. You get what you take. Do you wish to reach into my bag? Then give Rathmana his thirty gold coins.");
  }
}

sub EVENT_ITEM {
  # Rathmana's Scroll Offer [END]
  if(($platinum == 3) || ($gold == 30) || ($silver == 300) || ($copper == 3000)){
    quest::say("Good luck, my friend. May Solusek Ro guide your hand.");
    quest::faction(320,15);   # +Temple of Solusek Ro
    quest::faction(291,-30);  # -Shadowed Men
    quest::exp(500);
    quest::ding();
    # Force Snap, Bind Affinity, Lightning Bolt, Quickness, Whirl Til You Hurl, Column of Fire, Engulfing Darkness, Banshee Aura, Lifedraw, Charm
    quest::summonitem(quest::ChooseRandom(15022,15035,15038,15039,15303,15328,15355,15364,15445,16425));
  }
}