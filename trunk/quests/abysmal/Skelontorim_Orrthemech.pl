sub EVENT_SAY {
  if ($text=~/hail/i) {
    if (quest::istaskactivityactive(165,4)) { #Tinkering Freebie Step 5
      quest::emote("smiles and claps you on the back.");
      quest::say("I think you've done enough. You look like one of those adventuring gnomes and I hate to keep you working for me. You should be out there defeating our enemies! Only you can bring the proper tools to the fight. Before you go, let me explain to you what you need to know about the dark matter so you can treat it yourself.");
      quest::emote("whispers into your ear. This is distracting, but you are able to concentrate well enough to understand the process he is explaining.");
      quest::say("That should work well enough with the infused dark matter too. Now run off and save the world, but don't be a stranger!");
      $client->Message(15, "As you step away from the master tinkerer, you are certain that you can treat both forms of the raw dark matter in your toolkit. In fact you're certain that if you work with the material long enough, you will be able to get better results and lose less of the material in the process.");
      quest::LearnRecipe(417); #Dark Matter
      quest::LearnRecipe(448); #Infused Dark Matter
    }
    elsif(quest::istaskactivityactive(177,4)) { #Tinkering Collect Step 5
      quest::emote("smiles and claps you on the back.");
      quest::say("I think you've done enough. You look like one of those adventuring gnomes and I hate to keep you working for me. You should be out there defeating our enemies! Only you can bring the proper tools to the fight. Before you go, let me explain to you what you need to know about the dark matter so you can treat it yourself.");
      quest::emote("whispers into your ear. This is distracting, but you are able to concentrate well enough to understand the process he is explaining.");
      quest::say("That should work well enough with the infused dark matter too. Now run off and save the world, but don't be a stranger!");
      $client->Message(15, "As you step away from the master tinkerer, you are certain that you can treat both forms of the raw dark matter in your toolkit. In fact you're certain that if you work with the material long enough, you will be able to get better results and lose less of the material in the process.");
      quest::LearnRecipe(417); #Dark Matter
      quest::LearnRecipe(448); #Infused Dark Matter
    }
    else {
      quest::say("Hail, $name! I can't believe that we've come this far! I've never been much of a traveler, but I'm glad I took these Wayfarers up on their offer to join, even though that means I have to travel on this leaky wooden contraption. I've been teaching these mechanically ignorant folks something about how things should be done. I have to say, they've taken to it well. When they find something useful they use it. So now we're swamped with requests. I could sure use a good [gnome] to lend a hand here.");
    }
  }
  elsif ($race eq "Gnome") {
    if ($text=~/gnome/i) {
      quest::say("Well, with all the items I need to make, I haven't any time to delve into the properties of this [new matter] that they've brought me. If I could just find someone to [lend a hand] around here. Skelontorim peers at you, then around you, seemingly searching about for someone with hands to lend him.");
    }
    if ($text=~/new matter/i) {
      quest::say("Ah! Fascinating stuff. Blacker than night, it is. Heavy, too. I've taken to calling it dark matter, though Tial is of a mind to call it Tialonium.' Skelontorim chuckles. 'In any case, it's surprisingly fragile and must be handled carefully. It seems as though it reacts to contact very poorly. It has to be tempered and refined before it is of any use. But with the proper tuning, as I call it, dark matter is an extremely powerful energy source. Unfortunately, it's also unstable. I'm very sure that I can put it to better use eventually. If you find any raw dark matter, bring it to me and I'll treat it for you. I'll keep a little for my research, but I'll give you most of it back.");
    }
    if ($text=~/lend a hand/i) {
      quest::say("If you [help me] enough, I can teach you the secret for treating dark matter. That's a pretty important secret, so you'll have to do a lot of work, but I think it's well worth it!");
      quest::taskselector(165); #Tinkering Freebie
    }
    if ($text=~/help/i) {
      if (quest::istaskactivityactive(165,0)) { #Tinkering Freebie Step 1
        quest::say("Great! I'm almost ashamed to ask you to do such a menial task, but we are in desperate need of springs. Nothing fancy, just small, tight springs of the sort that many gnomes learn to make before they are out of their cradle. Just take this wire and you should have new springs for me in no time. Bring them right to me. Skelontorim pauses, then speaks again. I don't imagine you should go unrewarded for your efforts.");
        quest::summonitem(58158,20); #Thin Steel Wire
      }
      if (quest::istaskactivityactive(165,1)) { #Tinkering Freebie Step 2
        quest::say("Aha! Just in time. I've got some work to do and I need, well, I need a lot of pulleys. You probably shouldn't ask what I need them for, it's a rather long story involving a cat and a wedding ring. Let's just say that I need some pulleys. These should be simple, you'll only need one of each of the items I've given you. Your toolbox, while in need of some repair, should be more than good enough to do the work.");
        quest::summonitem(58226,20); #Small Axle
        quest::summonitem(58227,20); #Small Ball Bearings
        quest::summonitem(58228,20); #Small Roller
      }
      if (quest::istaskactivityactive(165,2)) { #Tinkering Freebie Step 3
        quest::say("Hello. I've got just the thing. As you may have noticed, we live mostly off of fish here. I noticed that our fishermen are using simple, boring lures. I'd like to get together a stock of my personal lures for them, but I just don't have time. If you could make some simple animated lures, I can at least upgrade their tools and improve their production. Not as well as using my special lures, but with all this work, what can we do? I apologize for the quality of the parts, I have to take what I can find here and even if that's used wine corks, then that's what I have to use. Bring the lures to me when you have them finished.");
        quest::summonitem(58229,20); #Used Cork
        quest::summonitem(58231,20); #Ordinary Lure
        quest::summonitem(58230,20); #Small Spring
      }
      if (quest::istaskactivityactive(165,3)) {  #Tinkering Freebie Step 4
        quest::say("Fantastic! I am trying to provide some more useful tools for our scouts, namely bows. If you could crank out some simple bow cams for me, I'd be grateful. I like to send folks into battle with the best gear, and those plain wooden bows don't have the punch that they should. With a few simple additions and can give them some serious kick! So hurry back to me with those cams.");
        quest::summonitem(58232,20); #Bolts
        quest::summonitem(58234,20); #Used Grease
        quest::summonitem(58233,20); #Simple Gears
      }
    }
  }
  else {
    quest::say("Begone! You are not a gnome!");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 58241 => 1)) { #Raw Dark Matter
    quest::say("Ah, yes. Here is your dark matter.");
    quest::summonitem(58242,2); #Dark Matter
  }
  elsif (plugin::check_handin(\%itemcount, 58245 => 4) || plugin::check_handin(\%itemcount, 58245 => 3) || plugin::check_handin(\%itemcount, 58245 => 2) || plugin::check_handin(\%itemcount, 58245 => 1)) { #Simple Spring
    quest::say("Ah, yes. Good work.");
  }
  elsif (plugin::check_handin(\%itemcount, 58246 => 4) || plugin::check_handin(\%itemcount, 58246 => 3) || plugin::check_handin(\%itemcount, 58246 => 2) || plugin::check_handin(\%itemcount, 58246 => 1)) { #Simple Pulley
    quest::say("Ah, yes. Good work.");
  }
  elsif (plugin::check_handin(\%itemcount, 58247 => 4) || plugin::check_handin(\%itemcount, 58247 => 3) || plugin::check_handin(\%itemcount, 58247 => 2) || plugin::check_handin(\%itemcount, 58247 => 1)) { #Simple Animated Lure
    quest::say("Ah, yes. Good work.");
  }
  elsif (plugin::check_handin(\%itemcount, 58248 => 4) || plugin::check_handin(\%itemcount, 58248 => 3) || plugin::check_handin(\%itemcount, 58248 => 2) || plugin::check_handin(\%itemcount, 58248 => 1)) { #Simple Bow Cam
    quest::say("Ah, yes. Good work.");
  }
  plugin::return_items(\%itemcount);
}