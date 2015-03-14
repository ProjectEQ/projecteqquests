sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 55270 => 1)) { #Shelie's Note
    quest::say("This note is covered in filth! Oh, it is from Shelie, that explains it.");
    quest::emote("holds the note in front of her by the top corner and begins to read it.");
    quest::say("I can barely make out this scrawl that that ogre calls writing, but I believe it says you need some Bloodguard Mummy Wrappings from the Mistmoore Catacombs. It's your lucky day, and obviously not mine, I do have some mummy wrappings. Take them. Just don't take them out of the protective case until they can be cleaned, lest you get a flesh rotting disease that will make the next month of your life a living nightmare as you slowly die a horrible, agonizing death. Don't say I didn't warn you. Why must I be surrounded by all this filth? I am much too good for this. That is the price I pay for living the life of an adventurer, I suppose.");
    quest::emote("makes some notes of her own. 'Take this note to Dahdd Jonne. He is at the camp in South Ro unless he is off in Rivervale stuffing his fat face.' Jilsuia continues to mumble to herself as you walk away.");
    quest::summonitem(55272); #Jilsua's Note (Sony's spelling, not mine)
    quest::summonitem(55267); #Bloodguard Mummy Wrappings
  }
  plugin::return_items(\%itemcount);
}