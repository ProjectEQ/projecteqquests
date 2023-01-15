# items: 5954, 3659, 5958, 17611, 5959, 5960, 5962, 5963, 5965, 5966, 5967
sub EVENT_SAY {
  if (($text=~/hail/i) && plugin::check_hasitem($client, 3659)) { #Buckler of the Jharin Recruit
    quest::say("Very well met, young friend. I assume that Gherik has sent you to me for the purpose of training you. Unforunately, I will not be doing any formal training for the several days. I'm taking a bit of a holiday to celebrate my wife's birthday. If you could take this receipt to the [merchant] for me before my wife gets home, I'd appreciate it. I'll place you at the top of my training list as well.");
    quest::summonitem(5954); #Gawfed's Receipt
  }
  if ($text=~/merchant/i) {
    quest::say("Gah... I'm losing my wits. I didn't tell you which merchant. Well, the fur is the first thing to go, and the mind is a close second. My wife's birthday is usually quite a large event in my household and I've been trying to make this one extra special. I'm lucky I can still find my tail. Take the note to Jihli Mahej. He's an importer who lives near the... gah! I can't remember the address. I'm sure you'll find him though. Good luck!");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 3659 => 1)) { #Buckler of the Jharin Recruit
    quest::say("Very well met, young friend. I assume that Gherik has sent you to me for the purpose of training you. Unforunately, I will not be doing any formal training for the several days. I'm taking a bit of a holiday to celebrate my wife's birthday. If you could take this receipt to the [merchant] for me before my wife gets home, I'd appreciate it. I'll place you at the top of my training list as well.");
    quest::summonitem(3659); #Buckler of the Jharin Recruit
    quest::summonitem(5954); #Gawfed's Receipt
  }
  elsif (plugin::check_handin(\%itemcount, 5958 => 1)) { #Finished Vase Replica
    quest::emote("looks at the vase and nods his head in approval.");
    quest::emote("says, 'I know that she's going to love this vase. The craftsmenship is amazing!' as he admires the vase. 'I need to properly thank you for retrieving it for me and I think that I know just the thing. If you gather some owlbear feathers I can have my brother apply them to your cloak. He can make a cloak really stand out. It will be a prize fit for any aspiring apprentice to wear. Take this sack and fill it with seven feathers and your recruit's cloak. Then return it to me with your cloak. I'll have it all sent over to my brother together in one bag.");
    quest::summonitem(17611); #Large Cloth Sack
  }
  elsif (plugin::check_handin(\%itemcount, 5959 => 1)) { #Bag of Feathers
    quest::say("It looks like you're all set. I'll have this sent over to my brother at once. Thank you again for fetching the vase for me. I can't wait to give it to the missus. I just know that she's going to love it. I have another task for you. It shouldn't take much time at all. Your cloak won't be done for a while, so you can do this while you wait. Take this piece of parchment to Jangle. He'll give you a bag of lute strings. I'm restringing all of my instruments before the party. Please be quick. Thank you again.");
    quest::summonitem(5960); #Note for Jangle
    quest::exp(1000);
    quest::faction(1513,10); #Guardians of Shar Vahl
  }
  elsif (plugin::check_handin(\%itemcount, 5962 => 1)) { #Note from Jangle
    quest::say("I really must be losing my mind. I could have sworn I specified the quantities. Oh well, I apologize for the confusion. Please take this back to him with my apologies.");
    quest::summonitem(5963); #Gawfed's Request
  }
  elsif (plugin::check_handin(\%itemcount, 5965 => 1)) { #Bag of Lute Strings
    quest::say("My dear friend, $name, you have been a wondrous help! Though we have not had an opportunity to work on the more refined Jharin teachings, you have definitely proven yourself to be an honorable citizen and worthy apprentice. My brother has returned with your cloak. Please take it along with the title of Jharin Apprentice. To further demonstrate my appreciation of your work for me, please take this lute.");
    quest::faction(1513,10); #Guardians of Shar Vahl
    quest::summonitem(5966); #Cloak of the Jharin Apprentice
    quest::summonitem(5967); #Lute of the Jharin Apprentice
    quest::exp(3000);
    quest::shout("Everyone, please welcome my student and friend, $name, to the rank of Jharin Apprentice!");
    quest::say("Now, please meet with Aljuum Mohim. He will be responsible for your training during my holiday. Please show him the lute that I just gave you. He'll most likely be in a tavern somewhere. I just hope that he is sober. Take care, friend!");
  }
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:sharvahl  ID:155060 -- Hymnist_Gawfed
