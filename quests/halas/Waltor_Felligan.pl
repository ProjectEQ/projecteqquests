# Quest for Waltor_Felligan in halas - Wooly Fungus, Poison Cure and Disease Cure 
# NPC ID 29058 -- Waltor_Felligan 

sub EVENT_SAY {
  if($text=~/Hail/i){ 
    quest::say("Hello, me friend! I'm the resident healer o' Halas. Please inform me when ye've a need fer me talents to [bind wounds], [cure disease] or [cure poison]. Might I add, if ye're a young shaman o' Halas, ye can also [assist in gathering fungus]."); 
  }
  if($text=~/cure disease/i){
    quest::say("Two small quantities o' wooly fungus are needed before we can cure yer malady.");
  }
  if($text=~/bind wounds/i){ # This part has no reported outcome anywhere probably broken on live 
    quest::say("Before I bind yer wounds, ye must pay tribute to the Tribunal in the amount of ten gold coins.");
  }
  if($text=~/cure poison/i){
    quest::say("I'll be needing mammoth steaks to feed the unfortunate.  Then we'll drain the poison from yer veins.");
  }
  if($text=~/assist in gathering fungus/i){
    quest::say("As the wooly spiderlings get ready to molt, they'll carry wooly fungus. Oftentimes, one can find wooly fungus growing on their bellies. I use this in me healing practices. I'll reward ye if ye can fill this jar full o' the valuable fungus. Don't forget to combine them before ye return it to me. And have yerself some rations handy, or ye may find yerself snacking on this tasteless food source.");
    quest::summonitem(17946); 
  }
}

sub EVENT_ITEM { 
  if (plugin::check_handin(\%itemcount, 13966 => 1)) { # Jar of Fungus turn in for random spell 
    quest::summonitem(quest::ChooseRandom(15203, 15270, 15271, 15275, 15036, 15075)); 
    quest::say("Aye! Ye've filled the jar. I'll see to it that Holana locks this away. Tis difficult to obtain and we can only spare the talents of our young shamans. Allow me to give ye a reward. Thank ye kindly fer yer service."); 
    quest::faction(294, 10); #faction with Shamen of Halas increased 
    quest::faction(213, 10); #faction with Merchants of Halas increased 
    quest::faction(33, -30); #faction with Circle of Unseen Hands decreased 
    quest::faction(47,-30); #faction with Coalition of Tradefolk decreased 
    quest::faction(90,-30); #faction with Ebon Mask decreased 
    quest::givecash (0,0,4,0); 
    quest::exp(50); 
  } 
  elsif (plugin::check_handin(\%itemcount, 13445 => 1)) { # poison cure for steak totally bogus text 
    quest::selfcast(203); 
    quest::say("Aye! I will draw the poison from your veins!");      
  } 
  elsif (plugin::check_handin(\%itemcount, 13967 => 2)) { # disease cure for wooly fungus totally bogus text 
    quest::selfcast(213); 
    quest::say("Ah! Now I can cure yer malady."); 
  } 
  plugin::return_items(\%itemcount);
} 
#END of FILE Zone:halas  ID:29058 -- Waltor_Felligan