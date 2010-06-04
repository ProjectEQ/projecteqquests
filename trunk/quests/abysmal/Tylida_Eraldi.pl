sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::emote("squints and looks at you with a slight grin on her face.");
    quest::say("Hello. I don't suppose you're a baker by profession, or perhaps you're [interested] in learning? I have several jobs that I need done, but I just don't have time to do them myself. Are you interested in helping out?");
  }
  if ($text=~/interested/i) {
    quest::say("This crew needs a lot of food. My specialty is long-lasting food items that can be taken on long journeys. Obviously a lot of Wayfarers are taking a lot of long trips these days. I was wondering if you would mind [helping me] out? I really want to spend more time working with the newly discovered strain of local wheat. There's a wild variety of wheat that only grows in the mountainous areas, which is a very odd place for any wheat to grow, But this stuff grows there, if sparsely. The thing is, there are some very odd properties to this wheat, and with the proper technique it can be made into a very [unique flour]. So if you have a chance, I would be pleased if you could [help out]. Unfortunately, the recipes I'm working on require the use of Taelosian Wheat Flour. If you can find some Taelosian Wheat, Ordin can make flour from it. Bring that to me, and I'll have plenty of tasks for you to do.");
  }
  if ($text=~/unique flour/i) {
    quest::say("I'm still a bit shocked that wheat is growing on the side of mountains. They even say that some of the creatures up there eat it by the handful like a snack. Obviously we'd prefer to make baked items from it. If you can get me some of that Taelosian Mountain Wheat, I'll make flour out of it. I'll only keep a little of it for myself.");
  }
  if ($text=~/help out/i) {
    quest::say("I can definitely use your help. I need some Taelosian Wheat Flour for the tasks I want you to do. Ordin can make flour from the raw wheat if you have any. If you bring me some flour, we can get started. You'll have to sweat a bit before we're done, but if you're up to the task I can reward you with the secret of milling the local wheat. Because I'll be asking you to find your own supplies, I can reward you a bit sooner than Ordin will.");
    quest::taskselector(167); #Baking Collect
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 58155 => 1)) { #Taelosian Wheat Flour
    if(quest::istaskactivityactive(167,0)) { #Baking Collect Step 1
      quest::say("Thanks for helping me. The first thing I need you to do is bake some Wayfarer Wheat Crackers. These are one of the staples of our scouts, and I don't like letting them leave without as many as they can carry. So take a Small Sack of Taelosian Wheat Flour and Wayfarer Spice and put them in the oven. Don't be tempted by their wonderful smell. Eating them isn't really part of the task.' Tylida smiles. 'Bring them right back to me when you're done.");
      quest::summonitem(58138,10); #Small Sack of Taelosian Wheat Flour
      quest::summonitem(58211,10); #Wayfarer Spice
    }
    elsif(quest::istaskactivityactive(167,1)) { #Baking Collect Step 2
      quest::say("Hello! Great, thanks for helping. We need to stock up on Wayfarer loaves. They keep a good long time, so I hope to get ahead today and stay that way. Take a Small Sack of Taelosian Wheat Flour, a Wayfarer Spice, and Crushed Nuts and bake them in the oven. A Wayfarer Loaf won't rise much, so don't worry about that. Just bring them back here to me and I'll store them.");
      quest::summonitem(58138,10); #Small Sack of Taelosian Wheat Flour
      quest::summonitem(58211,10); #Wayfarer Spice
      quest::summonitem(58034,10); #Crushed Nuts
    }
    elsif(quest::istaskactivityactive(167,2)) { #Baking Collect Step 3
      quest::say("You've been a big help, thank you. This time I need some Wayfarer cookies. These are sort of tough, but very flavorful and tasty. They travel real well, so they're a big hit with Wayfarers, hence their name. Just take a Small Sack of Taelosian Wheat Flour, Wayfarer Spice, and two Pinches of Sugar and bake them up. Please don't try to eat them hot. They really hold onto heat and you'll probably burn yourself. Just bring them to me and I'll get them to those that need them.");
      quest::summonitem(58138,10); #Small Sack of Taelosian Wheat Flour
      quest::summonitem(58211,10); #Wayfarer Spice
      quest::summonitem(58065,20); #Crushed Nuts
    }
    elsif(quest::istaskactivityactive(167,3)) { #Baking Collect Step 4
      quest::say("May Brell bless you! I could really use some Wayfarer Fruitcake right now. I know, you've heard that fruitcake is more like wood than food. Well, ours are a little better than wood, but just as durable. I'm not going to make you eat them, that's for the others to accomplish. All I need you to do is put a Small Sack of Taelosian Wheat Flour, Wayfarer Spice, and Heavy Fruit into the oven and bake up some fruitcakes. Bring them back here, use a cart if you must, and I'll see that they find homes.");
      quest::summonitem(58138,10); #Small Sack of Taelosian Wheat Flour
      quest::summonitem(58211,10); #Wayfarer Spice
      quest::summonitem(58044,10); #Crushed Nuts
    }
    else {
      quest::say("I do not need this.");
      quest::summonitem(58155); #Taelosian Wheat Flour
    }
  }
  elsif (plugin::check_handin(\%itemcount, 58149 => 1)) { #Taelosian Mountain Wheat
    quest::say("Ah, yes. Here is your flour.");
    quest::summonitem(58150,2); #Taelosian Mountain Wheat Flour
  }
  elsif (plugin::check_handin(\%itemcount, 58219 => 4) || plugin::check_handin(\%itemcount, 58219 => 3) || plugin::check_handin(\%itemcount, 58219 => 2) || plugin::check_handin(\%itemcount, 58219 => 1)) { #Wayfarer Wheat Crackers
    quest::say("Ah, yes. Thank you.");
  }
  elsif (plugin::check_handin(\%itemcount, 58192 => 4) || plugin::check_handin(\%itemcount, 58192 => 3) || plugin::check_handin(\%itemcount, 58192 => 2) || plugin::check_handin(\%itemcount, 58192 => 1)) { #Wayfarer Loaf
    quest::say("Ah, yes. Thank you.");
  }
  elsif (plugin::check_handin(\%itemcount, 58182 => 4) || plugin::check_handin(\%itemcount, 58182 => 3) || plugin::check_handin(\%itemcount, 58182 => 2) || plugin::check_handin(\%itemcount, 58182 => 1)) { #Wayfarer Cookie
    quest::say("Ah, yes. Thank you.");
  }
  elsif (plugin::check_handin(\%itemcount, 58187 => 4) || plugin::check_handin(\%itemcount, 58187 => 3) || plugin::check_handin(\%itemcount, 58187 => 2) || plugin::check_handin(\%itemcount, 58187 => 1)) { #Wayfarer Fruitcake
    quest::say("Ah, yes. Thank you.");
  }
  else {
    quest::say("I do not need this.");
    plugin::return_items(\%itemcount);
  }
}