sub EVENT_SAY {
  if ($text=~/hail/i) {
    if (quest::istaskactivityactive(170,4)) { #Smithing Collect Step 5
      quest::say("No more work now. Snokin happy wit what you do already. Snokin show you secret now. You not tell anyone!");
      quest::emote("looks around furtively, as if everyone on the ship doesn't hear everything he says. He hands you a piece of paper with some very precise writing on it. You can only guess that he did not write it. You look it over and you understand the methods for smelting the aligned ore and the shimmering aligned ore. It's not a complicated process, but you would have needed information that only that Wayfarers have to uncover it. Now all you need to do is place the ore into a forge and you will be able to make the steel. However, you are certain that you can improve the process if you work with the ore long enough. Snokin takes the paper back and pulls out a ledger. You see him carefully note your name on the ledger with clear and concise penmanship that matches that on the paper you just read.");
      quest::LearnRecipe(3649); #Bar of Aligned Steel
      quest::LearnRecipe(3650); #Bar of Shimmering Steel
    }
    if(quest::istaskactivityactive(163,4)) { #Smithing Freebie Step 5
      quest::say("No more work now. Snokin happy wit what you do already. Snokin show you secret now. You not tell anyone!");
      quest::emote("looks around furtively, as if everyone on the ship doesn't hear everything he says. He hands you a piece of paper with some very precise writing on it. You can only guess that he did not write it. You look it over and you understand the methods for smelting the aligned ore and the shimmering aligned ore. It's not a complicated process, but you would have needed information that only that Wayfarers have to uncover it. Now all you need to do is place the ore into a forge and you will be able to make the steel. However, you are certain that you can improve the process if you work with the ore long enough. Snokin takes the paper back and pulls out a ledger. You see him carefully note your name on the ledger with clear and concise penmanship that matches that on the paper you just read.");
      quest::LearnRecipe(3649); #Bar of Aligned Steel
      quest::LearnRecipe(3650); #Bar of Shimmering Steel
    }
    else {
      quest::say("Hello, Snokin can help you with da smith stuff. Can you [help] Snokin? Snokin too busy, need more time at forge with new ore, less time doing silly work for Wayfarers.");
    }
  }
  if ($text=~/help/i) {
    quest::say("You is nice person! Da Wayfarers wants Snokin to make lots of silly things for dem, but Snokin want to make stuff with [new ore], not old steel. Can you do some [silly work] for Snokin?");
  }
  if ($text=~/new ore/i) {
    quest::say("It is strange ore, Snokin never see anything like it. It very easy to work with, if you knows the way. It also make very strong steel. Dey say dat it get dat way when something big, like explosion or something magic, make all da metal line up. So dey call it aligned ore,' Snokin says the words, clearly unsure of what they mean. 'It make great steel! Very strong and make good, sharp edges if you hammer on it right way. Snokin know how to make steel from new ore. If you find any ore, bring to Snokin and Snokin give you new steel.");
  }
  if ($text=~/silly work/i) {
    quest::say("Tank you! If you make stuff for Snokin, Snokin can work more on new ore. You work as hard as Snokin, den Snokin give you good reward. Snokin knows people work good for good reward. Take [dis stuff] and make tings for me.");
    quest::taskselector(163); #Smithing Freebie
  }
  if ($text=~/dis stuff/i) {
    if(quest::istaskactivityactive(163,0)) { #Smithing Freebie Step 1
      quest::say("Take [dis stuff] and make studs so Snokin no have to. Just go to forge and put stuff in. One of each is good. When you have da studs, bring to Snokin. When you do enough work, Snokin will show you da secret for makin da new ore into da new steel.");
      quest::summonitem(58167,20); #Vial of Abysmal Sea Water
      quest::summonitem(58055,20); #Metal Scraps
      quest::summonitem(58103,20); #Simple Iron File
    }
    if(quest::istaskactivityactive(163,1)) { #Smithing Freebie Step 2
      quest::emote("smiles at you, showing very crooked teeth.");
      quest::say("Good! Snokin needs some rings for da Wayfarers. If you could make dem. Snokin be happy. Take dis stuff and go over to da forge and make rings. Bring da rings to Snokin.");  
      quest::summonitem(58113,20); #Simple Ring Mold
      quest::summonitem(58055,20); #Metal Scraps
      quest::summonitem(58103,20); #Simple Iron File
    }
    if(quest::istaskactivityactive(163,2)) { #Smithing Freebie Step 3
     quest::say("Snokin not tink you as bad as dey say. Snokin need chisels and you can make dem. Take dis stuff to da forge, put one of each of dem in and make da chisel. Bring da chisel to Snokin fast, da Wayfarers needs dem.");
     quest::summonitem(58055,20); #Metal Scraps
     quest::summonitem(58091,20); #Simple Chisel Mold
    }
    if(quest::istaskactivityactive(163,3)) { #Smithing Freebie Step 4
      quest::say("Good! More stuff for you to do for Snokin. Snokin like you. Make files and bring Snokin soon. Take dis stuff and put into forge to make files. Go now, work hard for reward, not stand and look at Snokin.");
      quest::summonitem(58039,20); #Flask of Abysmal Sea Water
      quest::summonitem(58055,20); #Metal Scraps
      quest::summonitem(58096,20); #Simple File Mold
    }
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 58018 => 1)) { #Aligned Ore
    quest::say("Ok. Take dis steel.");
    quest::summonitem(58019,2); #Bar of Aligned Steel
  }
  elsif (plugin::check_handin(\%itemcount, 58124 => 4) || plugin::check_handin(\%itemcount, 58124 => 3) || plugin::check_handin(\%itemcount, 58124 => 2) || plugin::check_handin(\%itemcount, 58124 => 1)) { #Simple Stud
    quest::say("Ok. Tanks.");
  }
  elsif (plugin::check_handin(\%itemcount, 58112 => 4) || plugin::check_handin(\%itemcount, 58112 => 3) || plugin::check_handin(\%itemcount, 58112 => 2) || plugin::check_handin(\%itemcount, 58112 => 1)) { #Simple Ring
    quest::say("Ok. Tanks.");
  }
  elsif (plugin::check_handin(\%itemcount, 58090 => 4) || plugin::check_handin(\%itemcount, 58090 => 3) || plugin::check_handin(\%itemcount, 58090 => 2) || plugin::check_handin(\%itemcount, 58090 => 1)) { #Simple Chisel
    quest::say("Ok. Tanks.");
  }
  elsif (plugin::check_handin(\%itemcount, 58095 => 4) || plugin::check_handin(\%itemcount, 58095 => 3) || plugin::check_handin(\%itemcount, 58095 => 2) || plugin::check_handin(\%itemcount, 58095 => 1)) { #Simple File
    quest::say("Ok. Tanks.");
  }
  plugin::return_items(\%itemcount);
}