# items: 2877, 17238, 3676, 3667
sub EVENT_SAY {
  if($text=~/forged fasteners/i) {
    quest::say("Ah, Poren must have sent you. May I inspect your slate first?"); #Still need real text
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 2877 => 1)) { #Acrylia Slate of Shar Vahl
    quest::say("My wife is making some jewelry. Not the sparkly stuff, mind you. She is nearly blind so appearance means little to her. She is intent on making jewelry with a more, uhh, natural feel. Currently she's constructing a special scorpion leg necklace, and is in need of more scorpion legs. I can't leave the shop so I need your help. Fill this box with scorpion legs and I'll pay you with metal fasteners that any merchant will gladly buy.");
    quest::summonitem(2877); #Acrylia Slate of Shar Vahl
    quest::summonitem(17238); #Kagazz's Box
  }
  elsif (plugin::check_handin(\%itemcount, 3676 => 1)) { #Box of Scorpion Legs
    quest::say("Excellent! My wife will be happy to continue working on her necklace. Take these fasteners as payment for your assistance."); #Still need real text
    quest::summonitem(3667); #Forged Fasteners
  }
  else {
    quest::say("I have no use for this, $name.");
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:sharvahl  ID:155279 -- Kagazz