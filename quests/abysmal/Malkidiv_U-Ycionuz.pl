sub EVENT_SAY {
  if ($text=~/hail/i) {
    if (quest::istaskactivityactive(161,4)) { #Pottery Freebie Step 5
      quest::say("You've been a great help already. I'd feel very guilty asking you to help out any further. There are others that can do that work for us. For all of your efforts, I'd be honored to teach you the secret of refining chunks of broken stone worker into refined Taelosian clay and chunks of broken ancient stone worker into refined ancient Taelosian clay.' Malkidiv pulls a small text from his coat and leans forward to show you a few of the pages. What he shows you seems amazingly simple once you've seen it. You think that with practice you might be able to get better results than Malkidiv gives to those that he refines clay for. Just place a single chunk of Broken Taelosian stone worker onto a pottery wheel and you will receive clump of refined Taelosian clay.");
      quest::LearnRecipe(8647); #Clump of Refined Taelosian Clay
      quest::LearnRecipe(8646); #Clump of Refined Ancient Taelosian Clay
    }
    elsif (quest::istaskactivityactive(175,4)) { #Pottery Collect Step 5
      quest::say("You've been a great help already. I'd feel very guilty asking you to help out any further. There are others that can do that work for us. For all of your efforts, I'd be honored to teach you the secret of refining chunks of broken stone worker into refined Taelosian clay and chunks of broken ancient stone worker into refined ancient Taelosian clay.' Malkidiv pulls a small text from his coat and leans forward to show you a few of the pages. What he shows you seems amazingly simple once you've seen it. You think that with practice you might be able to get better results than Malkidiv gives to those that he refines clay for. Just place a single chunk of Broken Taelosian stone worker onto a pottery wheel and you will receive clump of refined Taelosian clay.");
      quest::LearnRecipe(8647); #Clump of Refined Taelosian Clay
      quest::LearnRecipe(8646); #Clump of Refined Ancient Taelosian Clay
    }
    else {
      quest::say("Hello. Thanks for stopping by. Are you, by chance, interested in helping me with some of the more [menial tasks] I have to get done around here?");
    }
  }
  if ($text=~/menial tasks/i) {
    quest::say("Well, I am responsible for keeping the ship stocked with plates, pots and other simple supplies, but with all the research I'm working on and my experiments with the amazing local [clay], I just font have time to keep up. Wayfarers are notoriously hard on dinnerware. Can you [help] me out? And if you have any spare clumps of refined ancient clay, please speak with Hiloan, she needs help making some of the more complicated items used on the ship.");
  }
  if ($text=~/help/i && !quest::istaskactive(161)) {
    quest::say("Great! We've discovered that this new clay makes wonderfully durable plates. Of course, there's no point in making durable plates, that's just a challenge to these people to try and break them. With this clay we can make thinner plates that are just as strong and take up less room. If you can [keep helping] me out, I might be willing to share with you our secret method of refining the stone worker clay.");
    quest::taskselector(161); #Pottery Freebie
  }
  if ($text=~/keep helping/i) {
    if (quest::istaskactivityactive(161,0)) { #Pottery Freebie Step 1
      quest::say("Here, take these bits of broken plates and this bonding agent and re-fire the plates. Bring them back to me as soon as you can. I'm grateful for the help. If you can [keep helping] me out, I might be willing to share with you our secret method of refining the stone worker clay.");
      quest::summonitem(58025,20); #Broken Wayfarer Plate
      quest::summonitem(58024,20); #Bonding Agent
    }
    if(quest::istaskactivityactive(161,1)) { #Pottery Freebie Step 2
      quest::say("Excellent, you're obviously too talented to be wasted fixing plates. We could use a lot of pots. Our cooks are just as clumsy as out patrons. Take these pot molds and blocks of clay and fire them in a kiln. I can use a lot of these things, we use them for storage, cooking, breaking over heads All the usual stuff. We don't need quality here, just quantity. Bring them back to me quickly or we'll run out soon.");
      quest::summonitem(58135,20); #Small Block of Scrap Clay
      quest::summonitem(58202,20); #Wayfarer Pot Mold
    }
    if(quest::istaskactivityactive(161,2)) { #Pottery Freebie Step 3
      quest::say("Wonderful! You are certainly good at working with a kiln, and you've been a great help to me. I have a somewhat more complicated task to be done, if you have the time. We go through mugs here faster than an ogre goes through chocolate. Take this clay and these flasks of water and turn them on a pottery wheel until you have something that resembles a mug. Handles would be helpful, but not necessary. Then take the unfired mug and these Wayfarers seals and carefully fire them in the kiln. Don't worry, those seals are stamped onto tough sea serpent skin, they won't burn. Bring me the mugs when you're done.");
      quest::summonitem(58135,20); #Small Block of Scrap Clay
      quest::summonitem(58039,20); #Flask of Abysmal Sea Water
      quest::summonitem(58195,20); #Wayfarer Mug Seal
    }
    if(quest::istaskactivityactive(161,3)) { #Pottery Freebie Step 4
      quest::say("Fantastic! You have been of great service to the Wayfarers Brotherhood. If you can help me with my next task, I'd be willing to give out one of the Wayfarers trade secrets. This task will require more effort and skill than those I've been asking you to do. Some of our scouts use ceramic shafts for our arrows. These require some skill to make properly and have to be made well. I just can't trust anyone to make them. Take this clay, these flasks of water and this special dye and use the pottery wheel to form them into unfired shafts. Then, take these molds and fire the shafts. The dye is important, as each of the scouts likes to have their own colors on the shafts. Something about competing over who kills the most enemies or something like that.");
      quest::summonitem(58135,20); #Small Block of Scrap Clay
      quest::summonitem(58039,20); #Flask of Abysmal Sea Water
      quest::summonitem(58185,20); #Wayfarer Dye
      quest::summonitem(58172,20); #Wayfarer Arrow Shaft Mold
    }
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 58027 => 1)) { #Chunk of Broken Taelosian Stone Worker
    quest::say("Ah, yes. Here is your clay.");
    quest::summonitem(58032); #Clump of Refined Taelosian Clay
  }
  elsif (plugin::check_handin(\%itemcount, 58200 => 4) || plugin::check_handin(\%itemcount, 58200 => 3) || plugin::check_handin(\%itemcount, 58200 => 2) || plugin::check_handin(\%itemcount, 58200 => 1)) { #Wayfarer Plate
    quest::say("Ah, yes. Thank you.");
  }
  elsif (plugin::check_handin(\%itemcount, 58201 => 4) || plugin::check_handin(\%itemcount, 58201 => 3) || plugin::check_handin(\%itemcount, 58201 => 2) || plugin::check_handin(\%itemcount, 58201 => 1)) { #Wayfarer Pot
    quest::say("Ah, yes. Thank you.");
  }
  elsif (plugin::check_handin(\%itemcount, 58194 => 4) || plugin::check_handin(\%itemcount, 58194 => 3) || plugin::check_handin(\%itemcount, 58194 => 2) || plugin::check_handin(\%itemcount, 58194 => 1)) { #Wayfarer Mug
    quest::say("Ah, yes. Thank you.");
  }
  elsif (plugin::check_handin(\%itemcount, 58171 => 4) || plugin::check_handin(\%itemcount, 58171 => 3) || plugin::check_handin(\%itemcount, 58171 => 2) || plugin::check_handin(\%itemcount, 58171 => 1)) { #Wayfarer Arrow Shaft
    quest::say("Ah, yes. Thank you.");
  }
  plugin::return_items(\%itemcount);
}