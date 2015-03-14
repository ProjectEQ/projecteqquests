sub EVENT_SAY {
  if ($text=~/hail/i) {
    if (quest::istaskactivityactive(167,4)) { #Baking Collect Step 5
      quest::say("You have been a big help around the kitchen! I wouldn't feel right continuing to abuse your kindness.");
      quest::emote("glances around.");
      quest::say("Take a quick peek into my recipe book. This is the way you grind the Taelosian Wheat into flour.");
      $client->Message(15, "He quickly shows you the last page of his coveted recipe book. It only takes you a moment to see what the trick is. From now on, all you have to do is put the Taelosian Wheat or Taelosian Mountain Wheat into your mixing bowl and combine it to get the flour. In fact, you are certain that if you work at it long enough, you can produce more usable wheat with practice.");
      quest::LearnRecipe(2338); #Taelosian Wheat Flour
      quest::LearnRecipe(2336); #Taelosian Mountain Wheat Flour
    }
    elsif (quest::istaskactivityactive(157,4)) { #Baking Freebie Step 5
      quest::say("You have been a big help around the kitchen! I wouldn't feel right continuing to abuse your kindness.");
      quest::emote("glances around.");
      quest::say("Take a quick peek at my recipe book. This is the way you grind Taelosian Wheat into flour.");
      $client->Message(15, "He quickly shows you the last pages of his coveted recipe book. It only takes you a moment to see what the trick is. From now on, all you have to do is put the Taelosian Wheat or Taelosian Mountain Wheat into your mixing bowl and combine it to get the flour. In fact, you are certain that if you work at it long enough, you can produce more usable wheat with practice.");
      quest::LearnRecipe(2338); #Taelosian Wheat Flour
      quest::LearnRecipe(2336); #Taelosian Mountain Wheat Flour
    }
    else {
      quest::say("Hello! Boy, I'm glad to see you! I really need your help. Can you help me with some simply [baking tasks]? A ship floats on its belly, you know.");
    }
  }
  if ($text=~/assistance/i) {
    quest::say("Great! Right now what I need is some oatmeal prepared for meals that we need to serve right away. This is a simple task and may be too easy for you, but those folks are hungry. Just take this Oatmeal and Hot Water and mix it in your mixing bowl. Bring the finished Oatmeal to me right away. If you help me with the many tasks that I have to get done, I might be willing to share with you the secret of grinding the Taelosian Wheat into flour.  If you need supplies I can be of [further help].");
    quest::taskselector(157); #Baking Freebie
  }
  if ($text=~/baking tasks/i) {
    quest::say("Wayfarers eat far more than their fair share. It's just about impossible to keep up with them! I'd really like some help baking some of the basic foods so that I can spend my time thinking up new uses for this wonderful wild grain that has been descovered on Taelosia. I've named it Taelosian [Wheat], but I suppose that the natives might have some other name for it. Can you be of any [assistance] to me?");
  }
  if ($text=~/wheat/i) {
    quest::say("It's wonderful! I haven't had as much time to try it in some of my favorite recipes, but I have done a little taste-testing and it's very good. It even has some magical properties that I'm still trying to figure out. It does require some special treatment when making the flour, but I've figured that out. If you bring me some Taelosian Wheat, I'd gladly grind it for you. I'd just keep a bit of it for my efforts.");
  }
  if ($text=~/further help/i) {
    if (quest::istaskactivityactive(157,0)) { #Baking Freebie Step 1
      quest::summonitem(58045,20); #Hot Water
      quest::summonitem(58056,20); #Oatmeal
    }
    elsif (quest::istaskactivityactive(157,1)) { #Baking Freebie Step 2
      quest::say("Yes! Wayfarer's Muffins are probably our most popular traveling food. And folks passing through here are always traveling. If you could take a hunk of dough and a single dose of Wayfarer Surpize and put them in the oven, I would be grateful. Hmmm? Oh, no, I can't really tell you what's in the Wayfarer's surprize. Please bring the muffins back to me as fast as you can, we're always running out."); 
      quest::summonitem(58214,20); #Wayfarer Surprise
      quest::summonitem(58046,20); #Hunk of Dough
    }
    elsif (quest::istaskactivityactive(157,2)) { #Baking Freebie Step 3
      quest::say("Good! We're trying to stock up for dinner. We usually serve a lot of Wayfarer Pie. It's sort of a pie surprize! If you could run over to the oven and bake up a Hunk of Dough, Wayfarer Pie Tin and Wayfarer Surprise into a nice, tasty pie, that would be great! Bring the pies to me when you're done. No, I'm still not going to tell you what the surprize is."); 
      quest::summonitem(58046,20); #Hunk of Dough
      quest::summonitem(58214,20); #Wayfarer Surprise
      quest::summonitem(58199,20); #Wayfarer Pie Tin
    }
    elsif (quest::istaskactivityactive(157,3)) { #Baking Freebie Step 4
      quest::say("You have been a big help! I think I can trust you to make some dessert for these ruffians. I need a lot of pastries, or who knows what they might do! Just take this Hunk of Dough and a Dab of Frosting and pop them in the oven! Bring them back piping hot, please!");
      quest::summonitem(58046,20); #Hunk of Dough
      quest::summonitem(58035,20); #Dab of Frosting
    }
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 58154 => 1)) { #Taelosian Wheat
    quest::say("Ah, yes. Here is your flour.");
    quest::summonitem(58155,2); #Taelosian Wheat Flour
  }
  elsif (plugin::check_handin(\%itemcount, 58059 => 4) || plugin::check_handin(\%itemcount, 58059 => 3) || plugin::check_handin(\%itemcount, 58059 => 2) || plugin::check_handin(\%itemcount, 58059 => 1)) { #Ordin's Oatmeal
    quest::say("Ah, yes. Thank you.");
  }
  elsif (plugin::check_handin(\%itemcount, 58193 => 4) || plugin::check_handin(\%itemcount, 58193 => 3) || plugin::check_handin(\%itemcount, 58193 => 2) || plugin::check_handin(\%itemcount, 58193 => 1)) { #Wayfarer Muffin
    quest::say("Ah, yes. Thank you.");
  }
  elsif (plugin::check_handin(\%itemcount, 58198 => 4) || plugin::check_handin(\%itemcount, 58198 => 3) || plugin::check_handin(\%itemcount, 58198 => 2) || plugin::check_handin(\%itemcount, 58198 => 1)) { #Wayfarer Pie
    quest::say("Ah, yes. Thank you.");
  }
  elsif (plugin::check_handin(\%itemcount, 58196 => 4) || plugin::check_handin(\%itemcount, 58196 => 3) || plugin::check_handin(\%itemcount, 58196 => 2) || plugin::check_handin(\%itemcount, 58196 => 1)) { #Wayfarer Pastry
    quest::say("Ah, yes. Thank you.");
  }
  plugin::return_items(\%itemcount);
}