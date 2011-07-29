## NPC not in DB when created but, added by Jaekob
# Cragbeast Queen: Visage of the Brute
# created by Gonner
# beat the taskmistress added by Jaekob

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::emote("is whistling an unusual tune. As she speaks, her song continues. The overlapping effect of the music and her melodious voice is haunting.");
    quest::say("Greetings $race, it is not often that someone visits me here. In fact, I can't remember the last time I saw another person. Ever since that day in the Coliseum my life has been so strange. Time has all but lost its meaning, and I see the most unusual things. Have you come to hear my [story], or would you like me to explain what the world looks like [through my eyes]?");
  }
  if($text=~/through your eyes/i) {
    quest::say("It is difficult to describe. Things that used to be clear to me are now non-distinct, and . . . I see visions . . . that are inexplicably real but defy all common logic. For instance, I see you carry a trophy from an epic battle; a misshapen lump of flesh that you aquired from a tremendous foe. You do not understand. Please allow me to borrow it for a moment so I can show you.");
  }
  if ($text=~/story/i) {
    quest::emote("smiles and nods emphatically.");
    quest::say("It would be my pleasure to relate my story to you, $name. My passion is beautiful music and my songs bring hope to people when they need it most. I shared this gift with my fellow nihil in Riwwi and anyone else who would listen, as I share it now with you. One day the Taskmistress arrived to check on her underlings in the Coliseum. She heard my voice and slowly trotted up to me. She seemed genuinely interested in the effect my music had on the other Nihil. I remember smiling politely and singing her one of my favorite ballads, but suddenly everything went black. As far as I can tell I've been in this place ever since. What happened that day, I wonder? What became of the Taskmistress? My thoughts always return to her for some reason, as if our fates are entwined.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 52113 => 1)) { #Misshapen Cragbeast Flesh
    quest::emote("places her hand over your eyes and forces you to examine the Cragbeast Queen's Flesh through her transparent fingers. The skin takes the shape of a hideous mask.");
    quest::say("Do you see now, $name? Do you understand?");
    quest::summonitem(52120); #Visage of the Brute
  }
  if (plugin::check_handin(\%itemcount, 52119 => 1 )) {
    $npc->TempName("Caridwi_the_Avenged");
    quest::emote("gasps. Her ghostly skin grows even more pale as she comes to grips with her fate.");
    quest::say("Oh my. She . . . killed me, didn't she? Krisz slew me in front of everyone I knew and loved. Her fate is entwined with mine no longer. I will sing one last song and then leave this world. Thank you for avenging me, $name. The leather choker around Krisz's neck may prove of some use to you.");
    quest::exp(50000);
    quest::summonitem(52137);
  }
  else {
    quest::say("I have no use for this.");
    plugin::return_items(\%itemcount);
  }
}
#END of FILE zone:Yxtta ID: -- Caridwi.pl