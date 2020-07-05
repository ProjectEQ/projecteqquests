# items: 56010, 28047, 28051, 1299, 28049, 18170, 28017, 28048, 28019, 28050, 12433, 12509, 56013, 5768, 6505, 6506
sub EVENT_SAY {
  if ($text=~/hail/i) {
	if (plugin::check_hasitem($client,28048) && plugin::check_hasitem($client,28049) && plugin::check_hasitem($client,28050)) { #respawn Jhassad if failed during initial attempt
	  quest::say("Jhassad told me to notify him the minute you returned.  Hurry down to the beach so you do not miss him again!");
	  quest::unique_spawn(96074,0,0,-1781,-11959,14.3,2); #Jhassad Oceanson
	}
	else {
      quest::emote("bows deeply. 'I have been expecting you, $name. The waters have foretold your arrival. I am High Priest Omat Vastsea of the Triumvirate missionaries. Please feel free to enjoy the quiet solitude of this inn.'");
    }
  }
  if ($text=~/Triumvirate/i) {
    quest::say("The Triumvirate of Water are: E'ci, the mistress of ice; Tarew Marr, the lord of water; and Povar, the formless master of vapor and mist. We Triumvirate missionaries are granted great divinatory powers and wisdom through our devotion to the Triumvirate and must defend the waters of Norrath from the ravages of the Tyrant of Fire, Fennin Ro.");
  }
  if ($text=~/Fennin Ro/i) {
    quest::say("The Tyrant of Fire, Fennin Ro, is the merciless lord of fire in all its forms. The rivalry between the tyrant and the Triumvirate is as old as the gods themselves and is an eternal battle. We witness the struggle every moment of our lives as the Oasis of Marr succumbs to the heat of the surrounding desert and is replenished by the swelling of the Lifire River. That fragile balance between the elements must be maintained but the Plasmatic Priesthood threatens that balance.");
  }
  if ($text=~/plasmatic priesthood/i) {
    quest::say("The Plasmatic Priesthood are worshipers of the Tyrant of Fire, but they have been driven mad by their fanaticism and have forgotten the importance of the balance. In their madness they would set the whole world aflame, leaving nothing but lifeless ash.");
  }
  if ($text=~/Tavon sent me/i) {
    quest::say("I received word from my brother that you would be coming. I have just the task for you. I am sure you heard of the [" . quest::saylink("Plasmatic Priests") . "]");
  }
  if ($text=~/Plasmatic Priests/i) {
    quest::say("The Plasmatic Priests were worshippers of Fennin Ro. Their numbers were all but destroyed by adventurers, and with the silence of the Pantheon they no longer draw power from the Tyrant of Fire. However they are still a danger, please find the last remnants of their order and bring me proof of their[" . quest::saylink("destruction") . "]");
  }
  if ($text=~/destruction/i) {
    quest::say("They are in hiding, the few alcoves that I managed to find were shrouded and hidden. Take this signet and find the keeper for each alcove. Show it to him and he will drop the veil. Strike fast and exterminate the camp before he is able to cloak the camp again. Return the talisman to me with proof of the deaths of the three remaining high priests. Once you have done this, I will send you to my brother with my blessings.");
	quest::summonitem(56010); # Item: Talisman of the Plasmatic Priests
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 28047 => 1)) { #Ornate Sea Shell
    quest::say("So, you are a friend of Natasha's? That is good to see. She is a very wise and gifted woman. The Riptide goblins have adopted a new king but are still in a vulnerable state until his subjects accept his rule. The Plasmatic Priesthood is aware of the weakened state of the Riptides and has convinced the Fire Peak goblins to strike against them. Although I do not agree with the mannerisms or actions of any goblin clan, such a war would be detrimental to all who are caught in its path. Lord Gimblox of the Fire Peak clan has been meeting with a member of the Plasmatic Priesthood in the Temple of Solusek Ro. Locate the Plasmatic Priest, hand him this statue to hinder his powers, then eliminate him and bring me his robe.");
    quest::summonitem(28051); #Coral Statue of Tarew
  }
  elsif (plugin::check_handin(\%itemcount, 1299 => 1)) { #Blood Soaked Plasmatic Priest Robe
    quest::say("You have proven yourself to be one who is willing to take responsibility for his own actions. Such a trait is desired by all deities to be present in their faithful. I pray that you had the wisdom to slay Lord Gimblox as well as the Plasmatic Priest in order to prevent further advancement in the incursion against the Riptides. Priestess Natasha awaits inside the inn for Lord Gimblox's ring, make haste for she is a busy women and will depart soon.");
    quest::summonitem(28049); #Orb of Frozen Water
    quest::exp(100000); 
    quest::unique_spawn(96080,0,0,-2198,-11601,76); #Natasha Whitewater
  }
  elsif (plugin::check_handin(\%itemcount, 18170 => 1, 28017 => 1)) { #A Singed Scrol (overkind bathezid), Sceptre of Ixiblat Ferl
    quest::say("I commend you on your success over the fire elemental lord, Ixiblat Fer. The fact that the Plasmatic Priesthood has mustered up the power to summon such a being means drastic actions must be taken to stop the fanatic cult of Fennin Ro. I wonder what kind of favor Zordak Ragefire performed for the sarnak summoners to convince them to assist in the ritual that brought forth Ixiblat Fer. The dragon Iksar hybrid abominations are not beings who ally with others easily. All I have seen in my divinations of the High Plasmatic Priest are riddles, and signs that the one who slays him may be awarded an Orb of the Triumvirate. If you are the one whom my visions foretell, then seek Zordak Ragefire and bring me his heart.");
    quest::summonitem(28048); #Orb of Clear Water
    quest::exp(100000); 
    quest::unique_spawn(96080,0,0,-2198,-11601,76); #Natasha Whitewater
  }
  elsif (plugin::check_handin(\%itemcount, 28019 => 1)) {#Zordak Ragefire's Heart (combined after the death of zordakalicus in SF)
    quest::say("I see now that Zordak Ragefire and the exiled elder dragon Zordakalicus were the same being. That explains how he resisted our attempts to divine his affairs and past. Each of these orbs I have granted you represents one of the Triumvirate. Jhassad Oceanson awaits on the shore below to perform the ritual that will merge the orbs into a single Orb of the Triumvirate and summon an avatar from the Plane of Water. Present the Orb of the Triumvirate to the Avatar of Water when it arrives and allow your destiny to be unraveled.");
    quest::summonitem(28050); #Orb of Vapor
    quest::exp(100000); 
    quest::unique_spawn(96074,0,0,-1781,-11959,14.3,2); #Jhassad Oceanson
  }
  elsif ($client->GetGlobal("cleric20") >= 2 && plugin::check_handin(\%itemcount, 12433 => 1)) { #Dark Red Robe
    quest::summonitem(12509); #Robe of Plasmatic Priesthood
    quest::say("What? You found this on a Disciple in Discord?  This is a robe of the Plasmatic Priesthood, without question.  Bring this to Cecilia quickly, hopefully she will be able to divine their intentions.");
  }
  elsif ($client->GetGlobal("cleric20") >= 2 && plugin::check_handin(\%itemcount, 56013 => 1)) { #Ethereal Disciple's Journal
    quest::emote("grows pale as he reads the journal, 'It is just as a feared. I can't believe he is on his way here.");
    $client->Message(13, "The walls of the cove tremble as the Prime Disciple appears before Omat. 'Well this is an unexpected surprise, I came looking for Omat, however revenge on you, $name, will be that much sweeter."); #forgot to note color ... assume red like rest of the quest :P
    $client->SetGlobal("cleric20", "3", 5, "F");
    quest::spawn2(96368, 0, 0, $client->GetX(), $client->GetY(), $client->GetZ(), $client->GetHeading()); ##Gefaari_Drokaz
    quest::summonitem(56013); #Ethereal Disciple's Journal returned in case of failure
  }
  elsif (plugin::check_handin(\%itemcount, 5768 => 1, 6505 => 1, 6506 => 1, 56010 => 1)) { #Cleric Prequest 3 heads and talisman
    quest::say("Excellent. I think this was the last of the organized Plasmatic Priests. You have done well. I will send you to my brother with my blessing. Thank you for your assistance.");
    $client->SetGlobal("cleric15pre", "1", 5, "F"); #Set prequest complete flag
  }
  plugin::return_items(\%itemcount);
}
#End of File, Zone:timorous  NPC:96033 -- Omat_Vastsea
