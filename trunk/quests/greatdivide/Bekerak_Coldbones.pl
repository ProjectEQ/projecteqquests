sub EVENT_ITEM {
  # Handin: Bekerak's New Spear 
  if(plugin::check_handin(\%itemcount, 25106 => 1)){
    # Spear Delivery (kael)
    quest::say("Well, well, I see Wenglawks finally got around to sending me my new spear. I hope it's not as shoddy as the last one. Your payment? Bahaha, did Wenglawks not tell you? Payment was to be a giant icewurm tooth carved into an amulet. Come now, little one. I will find an ice wurm for us to slay together. 
Then you can pull one of its teeth out for me and I will fashion the talisman for that greedy merchant.");
    # Spawn: #an_angry_shardwurm (x:-2776 y:-3011 z:255.5 heading:65.5)
    quest::spawn2(118164,0,0,-2776,-3011,255.5,65.5);
  }
  # Handin: Giant Shard Wurm Tooth
  elsif(plugin::check_handin(\%itemcount, 25191 => 1)){
    # Spear Delivery (kael)
    quest::emote("pulls out a large knife and begins to carve at the tooth.
After a few minutes he pulls out a length of rope and fashions it into a very large necklace. 'Here is his payment. Tell him the spear is fine, and that I might reconsider his last offer to me. He will know what I mean.'");
    # Summon: Giant Icewurm Talisman
    quest::summonitem(25130);
  }
}


#EOF 