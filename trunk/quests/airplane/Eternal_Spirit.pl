sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 57081 =>1 )) {
    quest::emote("beams and looks at you with pride.");
    quest::say("Greetings, shaman. I am both glad to see you and somewhat sad. I know you are here to retrieve my talisman -- which is the reason for my weeping heart. I do understand the importance of taking it for the Ruchu. My heart does warm, though, at the sight of a shaman in pursuit of great things. I am envious. Here, take the talisman and protect it with your life. I should like to see it again after all has been set right.");
 quest::summonitem(57083);   
  }
  plugin::return_items(\%itemcount);
}