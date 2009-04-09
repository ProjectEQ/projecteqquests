#############
#Quest Name: Bard Mail Quest
#Author: RealityIncarnate
#NPCs Involved: Tralyn Marsinger, Eve Marsinger, Lislia Goldtune, Felisity Starbright, Jakum Webdancer, Ton Twostring, Idia, Sivina Lutewhisper, Ticar Lorestring, Marton Stringsinger, Drizda Tunesinger, Travis Two Tone, Silna Songsmith, Siltria Marwind, Tacar Tissleplay, Kilam Oresinger, Lyra Lyrestringer 
#Items Involved: Bardic letters: 18150-18167
#################

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hail, $name - If you are interested in helping the League of Antonican Bards by delivering some mail then you should talk to my wife, Eve.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 18150 => 1) || plugin::check_handin(\%itemcount, 18151 => 1)) {
    quest::say("Incoming mail - very good!  Please take this gold for your troubles.");
    quest::givecash(0,0,quest::ChooseRandom(3,4,5,6),0);
    quest::exp(50);
    quest::faction(192,10); #league of antonican bards
    quest::faction(184,10); #knights of truth
    quest::faction(135,10); #guards of qeynos
    quest::faction(273,-30); #ring of scale
    quest::faction(207,-30); #mayong mistmoore
  }
  
  elsif(plugin::check_handin(\%itemcount, 18153 => 1) || plugin::check_handin(\%itemcount, 18154 => 1)) {
  quest::say("Incoming mail - very good!  Please take this gold for your troubles.");
    quest::givecash(0,0,quest::ChooseRandom(8,9,10,11,12),0);
    quest::exp(100);
    quest::faction(192,10); #league of antonican bards
    quest::faction(184,10); #knights of truth
    quest::faction(135,10); #guards of qeynos
    quest::faction(273,-30); #ring of scale
    quest::faction(207,-30); #mayong mistmoore
  }

  else {
    quest::say("I have no need for that.");
    plugin::return_items(\%itemcount);
  }
}

# End of File zone: qeynos