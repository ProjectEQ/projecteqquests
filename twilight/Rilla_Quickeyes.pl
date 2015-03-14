sub EVENT_SAY {
 if($text =~ /Hail/i) {
   quest::say("OH HI! This is soooo boring, I wish I had something else to do.");
 }
 if($text =~ /armor/i) {
   quest::say("Oh you want me to make some armor? If you're a druid I could make you some.");
 }
 if($text =~ /I am a druid/i) {
   quest::say("can make you a cap, tunic, sleeves, leggings, mantle, bracer, and boots. If you want other druid armor you'll have to talk to Edgar.");
 }
 if($text =~ /cap/i) {
   quest::say("For the earth blessed cap you will have to go get me a moon jewel, a mark of the wild, a braided vine bracelet, and an aged dark wood shaft.");
 }
 if($text =~ /tunic/i) {
   quest::say("For the earth blessed tunic you will have to go get me a star jewel, a mark of nature, a primal earth rune, and a growth stone.");
 }
 if($text =~ /sleeves/i) {
   quest::say("For the earth blessed sleeves you will have to go get me a cloud jewel, a mark of vitality, an etched diamond of nature, and a storm filled vial.");
 }
 if($text =~ /leggings/i) {
   quest::say("For the earth blessed leggings you will have to go get me a sky jewel, a mark of life, an etched emerald of nature, and a sack of purified soil.");
 }
 if($text =~ /mantle/i) {
   quest::say("For the earth blessed mantle you will have to go get me a meteor jewel, a mark of regeneration, and an etched sapphire of nature.");
 }
 if($text =~ /bracer/i) {
   quest::say("For the earth blessed bracer you will have to go get me an astral jewel, a mark of growth, and an etched ruby of nature.");
 }
 if($text =~ /boots/i) {
   quest::say("For the earth blessed boots you will have to go get me a sun jewel, a mark of weather, and an etched star ruby of nature.");
 }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 4489 => 1, 4961 => 1, 4962 => 1, 4992 => 1)) { #cap
    quest::summonitem(3762);
    quest::exp(10000);   
  }
  if(plugin::check_handin(\%itemcount, 4490 => 1, 4993 => 1, 4994 => 1, 4995 => 1)) { #tunic
    quest::summonitem(3763);
    quest::exp(10000);
  }
  if (plugin::check_handin(\%itemcount, 4491 => 1, 4996 => 1, 4997 => 1, 4998 => 1)) { #sleeves
    quest::summonitem(3764);
    quest::exp(10000);
  }
  if (plugin::check_handin(\%itemcount, 4492 => 1, 4999 => 1, 5000 => 1, 5068 => 1)) { #leggings
    quest::summonitem(3765);
    quest::exp(10000);
  }
  if (plugin::check_handin(\%itemcount, 4493 => 1, 5069 => 1, 5079 => 1)) { #mantle
    quest::summonitem(3766);
    quest::exp(10000);
  }
  if (plugin::check_handin(\%itemcount, 4494 => 1, 5089 => 1, 5094 => 1)) { #bracer
    quest::summonitem(3767);
    quest::exp(10000);
  }
  if (plugin::check_handin(\%itemcount, 4488 => 1, 5095 => 1, 5096 => 1)) { #boots
    quest::summonitem(3768);
    quest::exp(10000);
  }
  plugin::return_items(\%itemcount);
} 