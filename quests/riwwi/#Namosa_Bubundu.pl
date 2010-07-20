sub EVENT_SAY {
  if($text=~/hail/i) {
  if ($faction >= 4) { # Require Kindly and greater faction
  if (defined $qglobals{bic} && $qglobals{bic} == 6) {
    quest::emote("coughs pitifully and looks through you with weak eyes.");
    quest::say("This gazebo was once a place of contemplation, meditation, and reflection, but now it is a place of torture. These slavers shackle us here within feet of the pool of water and refuse us food or drink for days at a time, accompanied by horrible beatings. And now, I have had enough. I am through with this world and can only hope for peace in my passing. Before I pass on I wonder if you could do a [favor] for me?");
    }
    }
    }
  if($text=~/favor/i) {
  if ($faction >= 4) { # Require Kindly and greater faction
  if (defined $qglobals{bic} && $qglobals{bic} == 6) {
     quest::emote("slips you a scuffed signet ring.");
     quest::say("Yes, yes. Here is a family heirloom that I have been keeping secret from our captors. If you deliver this ring to my kin, I can die in peace knowing it never fell into their hands. There are rumors that some of my family members have escaped the clutches of these monsters and made their way into a city that floats on water. I hope you understand, friend. Go quickly.");
     quest::summonitem(52179);
}
}
}    
  }

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 52178 =>1 )) {
    quest::emote("gasps");
    quest::say("What?! Oh no, this isn't good at all. She isn't supposed to die. I am! Quick, go and see Councilman Tentric in Qinimi and let him know what's happening. He has always helped our family when we were in need. If you bring this token he will know I sent you!");
    quest::summonitem(52176);
    quest::exp(10000);
    quest::faction(363,10);
    quest::faction(416,-10);
  }
  if (plugin::check_handin(\%itemcount, 52175 =>1 )) {
    quest::say("A drakelily? My aunt grew these in her garden. In fact, I helped her plant some of them myself. She always told me they were a sign of hope. Thank you, $name. I'll inform our people of your kindness.");
   quest::exp(10000);
    quest::faction(363,10);
    quest::faction(416,-10);
    quest::setglobal("bic",7,5,"F");
   quest::emote("touches your shoulder and gazes at you with pleading eyes.");
   quest::say("I hope this isn't presumptuous of me. You've already done so much. Before you go, I need to ask you for another favor. Turlini is under heavy guard in one of the nearby towers. The Muramites think he's up to something and I'm concerned they may torture or kill him. Please have a talk with Turlini when you can.");
   quest::summonitem(52174);    
  }
  plugin::return_items(\%itemcount);
}