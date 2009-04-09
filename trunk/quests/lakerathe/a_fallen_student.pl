sub EVENT_SAY {
 if($text=~/hail/i){
  quest::me("As you look at this individual, you can tell he has something bothering him greatly.");
  quest::say("Eh? There is nothing I can help you with. I have nothing for myself anymore... except these [cursed dreams].");
  }
  if(($text=~/cursed dreams/i) && ($MnkEpic != 1) || ($MnkPre != 1)){
   # Monk Epic 1.5/2.0 (Prequest)
   quest::say("I sense something within you. You may walk the path, but I must be certain. The information I possess is too important to give to just anyone. If you believe you are worthy of the information I hold you will [complete this task] I ask.");
  }
  if(($text=~/cursed dreams/i) && ($MnkEpic == 1) || ($MnkPre == 1)){
   # Monk Epic 1.5 
   quest::say("I pray that they stay locked within my mind for the world as we know it would be changed forever. In my dreams I see sand as red as blood and skies scorched from war. It is a terrible [vision].");
  }
  if($text=~/i will complete the task/i){
   # Monk Epic 1.5/2.0 (Prequest)
   quest::say("Do not think that it will be an easy feat, even for one with such capabilities as yourself. There are two masters you must find. They will show you the ways of the enlightened. Return to me after you have gained proof of your deeds.");
  }
  if($text=~/show me the way/i){
   # Monk Epic 1.5/2.0 (Prequest)
   quest::say("Very well then. There is a place full of mirrors. Locate one of them and speak the words, I am ready to be tested. It is at this point you will face the darkness within yourself. You will have to face this foe alone, remember that. Return to me if you manage to prove that you are worthy of true enlightenment.");
  }
  if($text=~/vision/i){
   # Monk Epic 1.5
   quest::say("I have seen visions of a dark foe gaining new strength in a plane unknown to me. It grows stronger with every passing minute. It gathers those that stand for chaos and disorder and is sending them out to search for the ultimate power of the Immortals, but it cannot be real. History reveals that he has been defeated. I see this same dream every night. It haunts me greatly. This dream seems too real, however, to not have some truth to it. If only I knew if this was a gift of foresight, or if I have finally lost my mind. If I only knew, I would be able to rest again. Please find a way to let me know if this is fact or fiction, $name .");
  }
  if($text=~/time/i){
   # Monk Epic 1.5
   quest::say("Time for what? Time for us to find a way to defeat this menace that threatens our ways of life. Go out and find one that may know more about the [power of the Immortals]. Please do not return until you have found someone to help.");
  }
  if($text=~/vortix/i){
   # Monk Epic 1.5
   quest::say("I see you know who I truly am now. It does not matter though. There is nothing I can help you with. Danl should have been able to help you more than I could.");
  }
  if($text=~/diary/i){
   # Monk Epic 1.5
   quest::say("Kaiarens Diary? I havent seen it in some time now. If I were not such a coward, I would have kept it. I have heard rumors of it being torn in half. Some students that wanted to learn the ways of the Celestial Fists were looking for it a while back. One was a pirate that wanted to only learn the Path of the Silent to gain more treasures then he had. The other, wanted to become the most powerful fighter alive. You may want to seek them out and see if they have located pieces of it. I am sorry I could not be of more help. If you do happen to locate the two pieces, bring them back to me and maybe I will be able to aid you further. Now that you know my secret, there is no reason to remain hidden from the world. You will be able to find me resting in the Plane of Tranquility. Be safe, $name .");
  }
 }

sub EVENT_ITEM {
 # Handin: Muramite Sand
 if(plugin::check_handin(\%itemcount, 48122 => 1)){
  # Monk Epic 1.5
  quest::say("Where did you find this? Could it really be happening now, after all of this time? It couldnt be. He had been defeated... there is little [time] left for us now I am afraid.");
  }
 # Handin: Seal of Cedrick & Seal of Mystik
 elsif(plugin::check_handin(\%itemcount, 48100 => 1, 48101 => 1)){ 
  # Monk Epic 1.5/2.0 (Prequest)
  quest::say("I see you do have the skill that is needed to continue this quest, but you must now face your hardest foe yet. For your final task, you will be alone, and in that moment you will have to face your true self. Many cannot bear to see what they find within. It is at that time we really see what we are capable of. If you wish to continue, I will [show you the way].");
 }
 # Handin: Medal of Identity
 elsif(plugin::check_handin(\%itemcount, 48102 => 1)){ 
  # Monk Epic 1.5/2.0 (Prequest)(END)
  # Flag Monk Prequest = true (need code) 
  quest::say("So I see you do truely have the ability to follow the path of the Enlightened. I am sorry I was not sure before but I am now. Now I must tell you of my [cursed dreams].");
 } 
}


# NpcName: a fallen student - Zone: lakerathe - Loc: (1350, 2075)
# Race: 1 - HelmTexture: 0 - Texture: 4 - Gender: 0
# End of File
