# Rogue Epic NPC -- Anson_McBale

sub EVENT_SAY {
  if($faction <= 5) {
    if($text=~/hail/i) {
      quest::emote("looks at you suspiciously. 'Yeah? Whacha want?'");
    }
    if($text=~/i need to see stanos/i && $class eq "Rogue" && $ulevel >= 50) {
      quest::say("This better be important.");
      quest::spawn2(5088,0,0,336.4,10.3,45.7,225.1);
    }
  }
  else {
    quest::say("Go away! We don't have time for the likes of you.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 28014 => 1) && $class eq "Rogue" && $ulevel >= 50) {
    quest::spawn2(5088,0,0,336.4,10.3,45.7,225.1);
    quest::say("Oh, I see.");
  }
  else {
    quest::emote("will not accept this item.");
    plugin::return_items(\%itemcount);
  }
}

#END of FILE  Quest by: Solid11  Zone:highpass  ID:5037 -- Anson_McBale