sub EVENT_SAY {
  if ($text=~/hail/i) {
    if (quest::istaskactivityactive(171,4)) { #Alchemy Collect Step 5
      quest::say("You've been a great help already. I sense that you have greater tasks to attend to and there are fledglings about that can continue your work. As a reward for you assistance, please allow me to teach you the secret of filtering the Taelosian sludge.");
      $client->Message(15,"Lita leans forward and whispers directly in you ear. What she tells you makes sense and you believe that you can now filter the sludge. All you need to do is put the Sample of Taelosian Sludge into your medicine bag and combine. This will return a Sample of Filtered Taelosian Sludge. You believe that with continued work on filtering the sludge you may be able to improve your results.");
      quest::LearnRecipe(1396); #Sample of Filtered Highland Sludge
      quest::LearnRecipe(1397); #Sample of Filtered Taelosian Sludge
    }
    elsif (quest::istaskactivityactive(172,4)) { #Alchemy Freebie Step 5
      quest::say("You've been a great help already. I sense that you have greater tasks to attend to and there are fledglings about that can continue your work. As a reward for you assistance, please allow me to teach you the secret of filtering the Taelosian sludge.");
      $client->Message(15,"Lita leans forward and whispers directly in you ear. What she tells you makes sense and you believe that you can now filter the sludge. All you need to do is put the Sample of Taelosian Sludge into your medicine bag and combine. This will return a Sample of Filtered Taelosian Sludge. You believe that with continued work on filtering the sludge you may be able to improve your results.");
      quest::LearnRecipe(1396); #Sample of Filtered Highland Sludge
      quest::LearnRecipe(1397); #Sample of Filtered Taelosian Sludge
    }
    else {
      quest::say("May your ancestors watch over us all. I am glad to see you. I have need of assistance. I only ask because there is much to do and much at stake. Can you help me with some simple alchemical [chores]?");
    }
  }
  if ($text=~/chores/i) {
    quest::say("It is my duty to ensure that the minor needs of those aboard are attended to. Primarily this means making dye. You may have noticed that our brotherhood enjoys showing off somewhat and the scouts have always desired colored arrows to help them distinguish their success from that of their fellows. I just don't have the time to make the dye, I am far too busy trying to discover the components and uses of a very unusual [sludge] that comes from the continent. Can you [help out]?");
    quest::taskselector(172); #Alchemy Freebie
  }
  if ($text=~/sludge/i) {
    quest::say("I'm not really sure what happened in those mountains in the past, but the runoff there is different and has affected the water and mud. If you find any of the highland sludge, please bring it to me. I can filter it properly and give you the majority of the concentrate. In exchange, I'll keep a small portion for my own use.");
  }
  if ($text=~/help out/i) {
    if (quest::istaskactivityactive(172,0)) { #Alchemy Freebie Step 1
      quest::say("May your loved ones live on in your heart. I just can't keep up with the wasteful desires of our smiths, alchemists and scouts. They use dye as though it were salt water. I'd be grateful if you could help me by making some of the basic black dye that we use most. Take this squid ink and add one vial of resin to thicken it. Use your medicine bag. Please hurry back with the dye, I haven't the patience to deal with these demands any longer. If you can help me enough, I might be able to teach you the secret of the Taelosian sludge.");
      quest::summonitem(58145,20); #Squid Ink
      quest::summonitem(58204,20); #Wayfarer Resin
    }
    if (quest::istaskactivityactive(172,1)) { #Alchemy Freebie Step 2
      quest::say("Bless your kin and all their forefathers. Green dye is very useful and isn't too hard to make. Why don't you make some for me? The recipe is fairly simple, using your medicine bag add one vial of this resin to an equal volume of this simple plant extract. Return with the dye when you are done.");
      quest::summonitem(58042,20); #Green Plant Extract
      quest::summonitem(58204,20); #Wayfarer Resin
    }
    if (quest::istaskactivityactive(172,2)) { #Alchemy Freebie Step 3
      quest::say("Thanks to you and yours. You have been of great assistance. Right now I have need of blue dye. This recipe is a little more difficult than green dye, berry juice is notoriously difficult to work with, but you should be able to do the job. Use your medicine bag to mix this simple berry extract with this resin to thicken it.");
      quest::summonitem(58088,20); #Simple Berry Extract
      quest::summonitem(58204,20); #Wayfarer Resin
    }
    if (quest::istaskactivityactive(172,3)) { #Alchemy Freebie Step 4
      quest::say("Your lineage is that of the most noble family. You have been of great service to the Wayfarers Brotherhood. I think I can trust you with the most difficult dye that I need made. Not only is red dye difficult to make, but the ingredients are noticeably harder to find. But I think you can do the work. Take these rare cactus beetles and crush them in your medicine bag with this resin to create the red dye. Bring them back to me when you are done.");
      quest::summonitem(58066,20); #Rare Cactus Beetle
      quest::summonitem(58204,20); #Wayfarer Resin
    }
  }
} 

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 58076 => 1)) { #Sample of Taelosian Sludge 
    quest::say("Ah, yes. Here is your filtered sludge.");
    quest::summonitem(58074,2); #Sample of Filtered Taelosian Sludge
  }
  elsif (plugin::check_handin(\%itemcount, 58175 => 4) || plugin::check_handin(\%itemcount, 58175 => 3) || plugin::check_handin(\%itemcount, 58175 => 2) || plugin::check_handin(\%itemcount, 58175 => 1)) { #Wayfarer Black Dye
    quest::say("Ah, yes. Thank you.");
  }
  elsif (plugin::check_handin(\%itemcount, 58190 => 4) || plugin::check_handin(\%itemcount, 58190 => 3) || plugin::check_handin(\%itemcount, 58190 => 2) || plugin::check_handin(\%itemcount, 58190 => 1)) { #Wayfarer Green Dye
    quest::say("Ah, yes. Thank you.");
  }
  elsif (plugin::check_handin(\%itemcount, 58176 => 4) || plugin::check_handin(\%itemcount, 58176 => 3) || plugin::check_handin(\%itemcount, 58176 => 2) || plugin::check_handin(\%itemcount, 58176 => 1)) { #Wayfarer Blue Dye
    quest::say("Ah, yes. Thank you.");
  }
  elsif (plugin::check_handin(\%itemcount, 58203 => 4) || plugin::check_handin(\%itemcount, 58203 => 3) || plugin::check_handin(\%itemcount, 58203 => 2) || plugin::check_handin(\%itemcount, 58203 => 1)) { #Wayfarer Red Dye
    quest::say("Ah, yes. Thank you.");
  }
  plugin::return_items(\%itemcount);
}