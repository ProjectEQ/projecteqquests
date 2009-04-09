sub EVENT_SAY {
  if ($EarringVeracity3 eq "1") {
    if ($text=~/hail/i) {
      quest::say("Greetings $name. I am Magistrate Elnerick Augustleaf of Katta Castellum and the Loyalist Empire. If it is arcane knowledge that you seek you have come to an excellent place to study. Not only do we have wondrous magical resources available at the Magus Conlegium but the teachings of Tsaph Katta are well known to all of our citizens and aid in preparing the mind for the freedom of thought and mental and emotional discipline needed to become a great wizard.");
    }
    if ($text=~/serve.*katta/i) {
      quest::say("Ah, I was told you would come. I hope that you have retrieved the shards from each Praesertum Leader? Please show them to me.");
    }
  }
}

sub EVENT_ITEM {
  if ($EarringVeracity3 eq "1") {
    # 29881 :  Shard of the Shoulder
    # 29882 :  Shard of the Eye
    # 29883 :  Shard of the Hand
    # 29884 :  Shard of the Heart
    if (plugin::check_handin(\%itemcount,29881=>1,29882=>1,29883=>1,29884=>1)) {
      quest::summonitem(3650); # 3650  Arx Key
      quest::summonitem(7096); # 7096  Seal of Katta
      quest::emote("takes the four shards and places them on the table. Slow incantations and streams of mana flow from him. The shards begin to move across the table towards each other until they fuse into one.");
      quest::say("I have focused each shard into one single key. The magic holding it together is strong but the enchantment will fade over time. You will must use it wisely for it will deteriorate with use. Lcea has requested I give you this seal to prove your service to this city. Take the seal and the Arx Key, I hope that you can accomplish what you are about to be asked. May your service to this town never be forgotten.");
      quest::faction(52,10); #concillium universus
      quest::faction(284,-30); #seru
      quest::faction(142,-30); #heart of seru
      quest::exp(600000);
    }
  }
  plugin::return_items(\%itemcount); # return unused items
}

#End of File, Zone:katta  NPC:160153 -- Elnerick_Augustleaf

