sub EVENT_SAY {
 if($text =~ /Hail/i) {
   quest::say("Hiya, I be a fishin', what ya need somethin?");
 }
 if($text =~ /armor/i) {
   quest::say("Oh ya want some of the druid equipment that Rilla and I make?");
 }
 if($text =~ /I am a druid/i) {
   quest::say("I can make ya a mask, cloak, gloves, talisman, belt, and a crook. Just ask about each one and I'll tell ya what ya need to bring so I can make it.");
 }
 if($text =~ /mask/i) {
   quest::say("'For the earth blessed mask you need to bring me a moon jewel, a mark of storms, and an etched fire opal of nature.");
 }
 if($text =~ /cloak/i) {
   quest::say("For the earth blessed cloak you need to bring me a star jewel, a mark of the earth, an etched peridot of nature, and a tablet of wolves.");
 }
 if($text =~ /gloves/i) {
   quest::say("'For the earth blessed gloves you need to bring me a cloud jewel, a mark of blossoms, and an etched pearl of nature.");
 }
 if($text =~ /talisman/i) {
   quest::say("For the earth blessed talisman you need to bring me a sky jewel, a mark of rain, and an etched opal of nature.");
 }
 if($text =~ /belt/i) {
   quest::say("For the earth blessed belt you need to bring me a meteor jewel, a mark of flora, an etched onyx of nature, and an ancient writ of nature.");
 }
 if($text =~ /crook/i) {
   quest::say("For the earth blessed crook you need to bring me an astral jewel, mark of fauna, an etched fire emerald of nautre, and a vial of moon dew.");
 }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 4489 => 1, 5097 => 1, 5098 => 1)) { #mask
    quest::summonitem(3769);
    quest::exp(10000);   
  }
  if(plugin::check_handin(\%itemcount, 4490 => 1, 5099 => 1, 5107 => 1)) { #cloak
    quest::summonitem(3770);
    quest::exp(10000);
  }
  if (plugin::check_handin(\%itemcount, 4491 => 1, 5108 => 1, 5109 => 1)) { #gloves
    quest::summonitem(3771);
    quest::exp(10000);
  }
  if (plugin::check_handin(\%itemcount, 4492 => 1, 5110 => 1, 5116 => 1)) { #talisman
    quest::summonitem(3772);
    quest::exp(10000);
  }
  if (plugin::check_handin(\%itemcount, 4493 => 1, 5117 => 1, 5118 => 1, 5119 => 1)) { #belt
    quest::summonitem(3773);
    quest::exp(10000);
  }
  if (plugin::check_handin(\%itemcount, 4494 => 1, 5129 => 1, 5190 => 1, 5191 => 1)) { #crook
    quest::summonitem(3774);
    quest::exp(10000);
  }
  plugin::return_items(\%itemcount);
}
