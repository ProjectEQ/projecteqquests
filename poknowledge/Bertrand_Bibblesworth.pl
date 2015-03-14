#Bertrand_Bibblesworth.pl
#Discord Crystals
#Yeah, I realize this is an Omens era quest.  It's a quick
#thing to slap it in, however, and maybe one of the shards can/will
#be put on the bug points vendor for a point or something.  
#If so, this would enable exchanges.  Also did it just for the sake 
#of completeness. -Kilelen


sub EVENT_SAY {
  if($text=~/Hail/i) {
    quest::say("Yes, hello to you as well. I have recently come here in search of some more curious [crystals].");
  }
  if($text=~/crystals/i) {
    quest::say("These are no ordinary crystals. They are known as frozen crystal shards and burning crystal shards. I believe they are made by the gelidrans and pyrilens, chaotic elemental creatures composed of fire and ice. I encountered a couple of these fierce creatures in the Realm of Discord and managed to, um, procure quite a collection of crystals. Hey, if you would like to [trade], I might be interested.");
  }
  if($text=~/trade/i) {
    quest::say("I can trade you a frozen crystal for a burning crystal or vice versa. Just hand one to me if you are interested!");
  }
}
  
  
sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 59997 => 1)) {#Burning Crystal Shard
    quest::emote("Here you go, $name!");#text made up
    quest::summonitem(59996); #Frozen Crystal Shard
  }
  elsif(plugin::check_handin(\%itemcount, 59996 => 1)) {#Frozen Crystal Shard
    quest::emote("Here you go, $name!");#text made up
    quest::summonitem(59997); #Burning Crystal Shard
  }
   plugin::return_items(\%itemcount);
  }
    
#Done