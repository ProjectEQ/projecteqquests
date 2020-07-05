#############
#Quest Name: Bard Mail Quest
#Author: RealityIncarnate
#NPCs Involved: Tralyn Marsinger, Eve Marsinger, Lislia Goldtune, Felisity Starbright, Jakum Webdancer, Ton Twostring, Idia, Sivina Lutewhisper, Ticar Lorestring, Marton Stringsinger, Drizda Tunesinger, Travis Two Tone, Silna Songsmith, Siltria Marwind, Tacar Tissleplay, Kilam Oresinger, Lyra Lyrestringer 
#Items Involved: Bardic letters: 18150-18167
#################
# items: 18161, 18160, 18162, 18163

sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hail. $name - If you are interested in helping the League of Antonican Bards by delivering some mail then you should talk to Idia."); }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 18161 => 1)) {
    quest::say("Incoming mail - very good!  Please take this gold for your troubles.");
    quest::givecash(0,0,quest::ChooseRandom(3,4,5,6),0);
    quest::exp(1550);
    quest::faction(284,5); #league of antonican bards
    quest::faction(281,1); #knights of truth
    quest::faction(262,1); #guards of qeynos
    quest::faction(304,-1); #ring of scale
    quest::faction(285,-1); #mayong mistmoore
  }
  
  if(plugin::check_handin(\%itemcount, 18160 => 1) || plugin::check_handin(\%itemcount, 18162 => 1) || plugin::check_handin(\%itemcount, 18163 => 1)) {
    quest::say("Incoming mail - very good!  Please take this gold for your troubles.");
    quest::givecash(0,0,quest::ChooseRandom(6,7,8,9),0);
    quest::exp(1550);
    quest::faction(284,5); #league of antonican bards
    quest::faction(281,1); #knights of truth
    quest::faction(262,1); #guards of qeynos
    quest::faction(304,-1); #ring of scale
    quest::faction(285,-1); #mayong mistmoore
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:gfaydark
