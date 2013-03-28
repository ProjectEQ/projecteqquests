#Ysanna_MacGibbon.pl
#Rogue Tome Handin/Rogue Master Sketch

#Added faction requirement of Indifferent or better as per allakhazams

sub EVENT_SIGNAL {
  if ($signal == 1001) {
    quest::say("The mammoth calf hides are used to shield our beasts of burden from the icy wind. You are probably now asking what shields us Northmen from that same icy wind eh? Well, along with many other furs and leathers, we have come to find that [gnoll fur] of all things is a good insulator against the cold. Look at their tiny bodies and it's obvious their fur does something good.");
  }
}


sub EVENT_SAY {
  if($faction < 6)
  {
  if($text=~/gnoll fur/i){
    quest::say("You should not be asking where or what a gnoll is, but asking how I make use of that patch fur I find on their corpse. It is quite simple, take four pieces of gnoll fur and sew them together. Take the result and sew four of them together. And again with that product. In the end you will have a bundle of tailored gnoll fur. You can either return it to me or keep it for yourself.");
  }
  if($text=~/dark assassin/i){
    quest::say("That poor lad! I saw him in the tundra being chased by that big bear of Tundra Jack. I never liked that bear of his since the day he ate my poor dog Thunderpaw. Anyways i say Iceberg chasing the assassin and grabbed my trusty ahlspiess and threw it, aiming right for his big head. Can you believe I missed?? I hit his side instead. Iceberg ripped my ahlspiess out and ripped it into pieces and then went whining of to Tundra Jack. Serves that bear right! He ate my dog!");
  }
  if($text=~/ahlspiess/i){
    quest::say("Ahhhh my beloved shrieking ahlspiess, it was nice i was able to help a fellow assassin out but i really do miss it. The dark assassin gave me a sketch of paper he said was very valueable but it still pains me to be without my favourite throwing weapon. If you go get me another I would gladly part with this sketch.");
  }
 }
}

sub EVENT_ITEM {
	#I changed this statement to use the plugin now.  Maybe I shouldn't have, but I wanted things to be uniform. -Kilelen
  if($faction < 6) {
    if(plugin::check_handin(\%itemcount, 1330 => 1)) { # Patched Gnoll Fur Bundle
      quest::say("You have done well. Here is a small reward for your effort.");
      quest::exp("125");
      quest::ding();
      quest::givecash(0,2,2,1);
      quest::faction("275","10"); # 275 : Faction Rogue's of the White Rose
      quest::summonitem(1349); #Fang of the Wolf
    }
  }
  elsif(plugin::check_handin(\%itemcount, 7507 => 1)) { #Shrieking Ahlspiess
    quest::emote("beams 'Thank you, take this.'"); #text made up
    quest::summonitem(24097); #Sluggish Sketch
  }
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:halas  ID:29070 -- Ysanna_MacGibbon