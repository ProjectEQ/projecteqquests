#Giang Yin

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::emote("looks down upon the creature standing beneath him and speaks. 'You are brave to approach a titan such as Giang Yin. I pray that the spirits have granted you honor and respect as well as courage.'");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 6981 => 1)) { #Kejekan Smithy Hammer
    quest::say("Freeing long imprisoned spirits is a noble cause. Your hammer has our blessing to free the souls from their crystalline shadow tombs.");
    quest::summonitem(6979); #Soulforge Hammer
    quest::exp(10000);
  }
  plugin::return_items(\%itemcount);
}