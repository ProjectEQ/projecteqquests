sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 55272 => 1)) { #Jilsua's Note
    quest::say("Ahoy there! Dahdd Jonne, tailor extraordinaire at your service! What's this? A note from, Jilsua? Always a pleasure!");
    quest::emote("stuffs a whole bixie berry bun into his mouth. 'Mrpmpphh. Says you are on a quest to upgrade your Satchel of Abu-Kar. Very interesting!'");
    quest::emote("wipes his hands on his clothes. 'Let's see here. I think I can do this. Hand me your Rujarkian Orc Hide, Stone Frog Skin, and your Bloodguard Crypt Mummy Wrappings, oh and of course your Satchel of Abu-Kar. Don't worry, I won't ruin it. At least I don't think I will.'");
  }
  elsif(plugin::check_handin(\%itemcount, 55265 => 1, 55266 => 1, 55267 => 1, 40900 => 1)) { #Rujarkian Orc Hide, Stone Frog Skin, Bloodguard Crypt Mummy Wrappings, Satchel of Abu-Kar
    quest::emote("takes the items and puts them into his tailoring kit. He begins to furiously sew them together. 'Ah bugger. Seems this one is a failure. Ha! Got ya! Just kidding there, friend. Here you go! One Reinforced Satchel of Abu-Kar! Kizpi's directions were pretty good, even if he did forget to include a few items! My best work yet If I don't say so myself!'");
    quest::summonitem(40901); #Reinforced Satchel of Abu-Kar
  }
  else {
    quest::say("I do not want this.");
    plugin::return_items(\%itemcount);
  }
}