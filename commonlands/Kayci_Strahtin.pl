sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 55268 => 1)) { #Kizpi's Note
    quest::say("Incessant fleas! Ever since I arrived in the Commonlands, they have plagued me! Oh, sorry. What's this? A note from Kizpi? Let me see. So the ol' bugger finally found a way to upgrade the Satchel of Abu-Kar, eh? It says here that you will need a Rujarkian Orc Hide. You are in luck, I just happen to have one that a previous adventure gave to me from his recent excursion to the Rujarkian Hills. You may have it. You will need some other items though. Kizpi didn't know about that?! His brain must be freezing out there in Everfrost!");
    quest::emote("makes some new notes. 'Take this note to Shelie Dikop at the Adventurer's Camp in North Ro. Tell her to come here and scare these fleas away with her ugly face!'");
    quest::emote("laughs. 'Perhaps that would be a bad idea. Just hand her this note when you find her. Good luck to you.'");
    quest::emote("begins to furiously scratch at the fleas behind his ears.");
    quest::summonitem(55269); #Kayci's Note
    quest::summonitem(55265); #Rujarkian Orc Hide
  }
  plugin::return_items(\%itemcount);
}