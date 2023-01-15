# items: 4494, 4675, 4676, 4677, 3697, 4488, 4678, 4679, 4680, 3698, 4489, 4681, 4682, 4683, 3699, 4490, 4684, 4685, 4686, 3700, 4491, 4687, 4688, 3701, 4492, 4689, 4690, 3702
sub EVENT_SAY {
 if($text =~ /Hail/i) {
   quest::say("Hey there!");
 }
 if($text =~ /armor/i) {
   quest::emote("Lara Trueseer grimaces in pain. 'The visions are so strong they hurt...please make them stop..'");
 }
 if($text =~ /I am an enchanter/i) {
   quest::say("Very good. I have a cap, robe, sleeves, pants, shawl, and bracer. My friend Xavier has the rest just ask him about armor. ");
 }
 if($text =~ /cap/i) {
   quest::say("For the cap I will need an astral jewel, a golden flower, a grail of enchantment, and a mark of beauty.");
 }
 if($text =~ /robe/i) {
   quest::say("For the robe I will need a sun jewel, the eye of the enraptured, a mark of affection, and a book of inspiration.");
 }
 if($text =~ /sleeves/i) {
   quest::say("For the sleeves I will need a moon jewel, a page of prose, a mark of reality, and a truncated ring.");
 }
 if($text =~ /pants/i) {
   quest::say("For the pants I will need a star jewel, a mark of passion, an adamantium quill, and pristine shik-nar claws.");
 }
 if($text =~ /shawl/i) {
   quest::say("For the shawl I will need a cloud jewel, a mark of understanding, and a hope emerald.");
 }
 if($text =~ /bracer/i) {
   quest::say("For the bracer I will need a sky jewel, a mark of elegance, and a hope sapphire.");
 }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 4494 => 1, 4675 => 1, 4676 => 1, 4677 => 1)) { #cap
    quest::summonitem(3697); # Item: Cap of Enrapturement
    quest::exp(10000);   
  }
  if(plugin::check_handin(\%itemcount, 4488 => 1, 4678 => 1, 4679 => 1, 4680 => 1)) { #robe
    quest::summonitem(3698); # Item: Robe of Enrapturement
    quest::exp(10000);
  }
  if (plugin::check_handin(\%itemcount, 4489 => 1, 4681 => 1, 4682 => 1, 4683 => 1)) { #sleeves
    quest::summonitem(3699); # Item: Sleeves of Enrapturement
    quest::exp(10000);
  }
  if (plugin::check_handin(\%itemcount, 4490 => 1, 4684 => 1, 4685 => 1, 4686 => 1)) { #pants
    quest::summonitem(3700); # Item: Pants of Enrapturement
    quest::exp(10000);
  }
  if (plugin::check_handin(\%itemcount, 4491 => 1, 4687 => 1, 4688 => 1)) { #shawl
    quest::summonitem(3701); # Item: Shawl of Enrapturement
    quest::exp(10000);
  }
  if (plugin::check_handin(\%itemcount, 4492 => 1, 4689 => 1, 4690 => 1)) { #bracer
    quest::summonitem(3702); # Item: Bracer of Enrapturement
    quest::exp(10000);
  }
  plugin::return_items(\%itemcount);
}