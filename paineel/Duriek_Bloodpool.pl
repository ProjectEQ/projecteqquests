# Part of SK Epic 1.0 Quest
# items: 18099, 14365, 14382, 5403, 11609, 5430, 14366, 14367

sub EVENT_ITEM {
  $faction = $client->GetCharacterFactionLevel(404); # Faction: Truespirit
  if (($faction >= 7) && plugin::check_handin(\%itemcount, 18099 => 1)) {
    quest::say("Yes, most unfortunate. I was informed last week of the death of my most recent apprentice. A few months ago, I paid a substantial sum to a group of rogues sent from Neriak to collect on a gambling debt. He swore to me that was the end of it, but I suspected otherwise. My warnings of gambling with the rogues fell on deaf ears. Please accept this for your troubles.");
    quest::faction (404,7); # Faction: Truespirit
    quest::exp(15000);
  }
  if (($faction >= 14) && plugin::check_handin(\%itemcount, 14365 => 1)) {
    quest::say("Thank you. Now, quickly, there is not much time for me. What I tell you here now must never be shared with another soul. I have spent the better part of my life piecing together clues for the creation of a legendary dark blade, a corrupted Ghoulbane. I am very close to understanding the method used in manipulating the enchantments of the Ghoulbane, but in my current condition, I cannot finish collecting the research. My previous apprentice was searching for this last clue when he met his untimely demise.");
    quest::faction (404,7); # Faction: Truespirit
  }
  if (($faction >= 21) && plugin::check_handin(\%itemcount, 14382 => 1)) {
    quest::emote("gasps at you in astonishment, his eyes beaming with pride, and says, 'You've found it! It seems I underestimated you. You have succeeded where others failed. I feared it would never come to pass.' Duriek takes the key from his neck, softly muttering some words, and places it in a previously unseen keyhole. The book's hinges creak as Duriek pulls it open. After reading for a few moments, he says, 'It is even better than I had hoped! It will take me weeks to uncover a portion of what this book has to offer. But this is what I have been searching for, so many years! At last I know the items required to corrupt that accursed blade!'");
    quest::faction (404,7); # Faction: Truespirit
  }
  if (($faction >= 35) && plugin::check_handin(\%itemcount, 5403 => 1, 11609 => 1, 5430 => 1, 14366 => 1)) {
    quest::emote("takes the Ghoulbane and places the other swords on either side of it. The sheath begins to gleam so intensely, you can see the bones inside Duriek's hands. After several minutes, there is a final, blinding flash. Duriek collapses to the ground. After a few moments, Duriek motions you closer and whispers, 'You have done well. I wish fate had been kinder to me and allowed me your aid years ago--I might have lived long enough to enjoy the fame of our combined efforts. I studied much of the tome you retrieved and have stumbled upon something that may be the key to unleashing darkness upon the face of Norrath forever. You must seek out a powerful lich by the name of Lhranc. Farewell, $name.' With his last bit of energy, Duriek places the corrupted Ghoulbane in your hands.");
    quest::faction (404,7); # Faction: Truespirit
    quest::summonitem(14367); # Item: Corrupted Ghoulbane
    $npc->SetAppearance(3);
    quest::settimer(1,5);
  }
  plugin::return_items(\%itemcount);
}

sub EVENT_SAY {
  $faction = $client->GetCharacterFactionLevel(404); # Faction: Truespirit
  if ($text=~/apprentice/i && $faction >= 14) {
    quest::say("As stubborn and foolish as he sometimes was, he was full of potential. Had he managed to achieve my age he doubtless would have surpassed my abilities. Though I am not surprised at his passing, he will be sorely missed. Well, I thank you for your efforts. Feel free to meet me in the tavern for a drink sometime. I must now get to the task of replacing my associate.");
  }
  if ($text=~/replace him/i && $faction >= 14) {
    quest::say("Hmm, you seem a bit green and I hesitate to trust you with such an important work, but time is of the essence as my days in this world are running out. Bring me back a bottle of cough elixir and, if you are still interested, I will instruct you further.");
  }
  if ($text=~/searching/i && $faction >= 21) {
    quest::say("I possess a key that will open a sealed tome to be found somewhere in the ruins uncovered here not long ago. Recover that tome for me and I am certain I will be able to corrupt the Ghoulbane. My name will be etched in history and you will wield a legend! You must hurry now, and I must return to my studies. Do not return to me, $name, without the tome.");
  }
  if ($text=~/items/i && $faction >= 28) {
    quest::say("I will need the Ghoulbane, the Soul Leech, the Blade of Abrogation, and the Decrepit Sheath. Alas, I am far too ill to travel and collect these pieces. I must call upon your youth and ability again, $name. Return to me with these items and I shall be known throughout history as the greatest grave lord to have walked Norrath and you shall be among the most powerful in our art.");
  }
}

sub EVENT_TIMER {
  quest::depop_withtimer();
}

#END of FILE Zone:paineel  ID:75006 -- Duriek_Bloodpool
#Quest by mystic414

