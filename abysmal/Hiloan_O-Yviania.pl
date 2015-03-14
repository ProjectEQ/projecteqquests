sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::emote("glances at you and holds your stare for a moment before speaking.");
    quest::say("I don't suppose you have any skill at all throwing pots or at the kiln, because if you do I could use your help with some of the more [intricate items] that the fools around here are always breaking.");
  }
  if ($text=~/intricate items/i) {
    quest::say("I have been given the unsatisfying task of replacing [specialty items] for the gardeners and the folks that deal in poisons and other such things. But I just don't have time for it. I have my own research into the native clay to work on. There appear to be golems made out of a type of clay that was dug up long ago, when this land was much more fertile and magical. The clay of these [ancient golems] is more powerful and useful than the rest. If you are interested in helping Malkidiv out with lesser tasks, talk to him. He can also refine chunks of broken golem for you.");
  }
  if ($text=~/specialty items/i) {
    quest::say("Let's put you to work. You don't have to be a skilled potter to handle this. Oh and, well, I'll need you to get some Clump of Refined Taelosian Golem Clay from Malkidiv. He can refine chunks of golems for you, if you can find some. I won't need the ancient stuff for these tasks. Hand me the clumps and I'll get you started. Work hard for me and I'll reward you with the secret recipe that Malkidiv and I share. And since what I need is more difficult to obtain, I'll be quicker to reward you.");
     quest::taskselector(175); #Pottery Collect
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 58032 => 1)) { #Clump of Refined Taelosian Clay
    if (quest::istaskactivityactive(175,0)) { #Pottery Collect Step 1
      quest::say("Let's start you out on one of the more urgent requests. We use special ceramic receptacles to hold those augment stones to the buoys and other important locations. We need to get a stockpile of those ready in case we need them. They are easy to make, just put a small block of refined clay and the receptacle mold into a kiln and fire them. Bring them back to me when they cool off.");
      quest::summonitem(58134,10); #Small Block of Refined Taelosian Clay
      quest::summonitem(58069,10); #Receptacle Mold
    }
    elsif (quest::istaskactivityactive(175,1)) { #Pottery Collect Step 2
      quest::say("Fine. I need you to make some replacement crucibles for various researchers on this ship. Take a small block of refined golem clay and a Wayfarer crucible mold and fire them in the kiln. Bring them back to me as soon as you can, this research is vital.");
      quest::summonitem(58184,10); #Wayfarer Crucible Mold
      quest::summonitem(58134,10); #Small Block of Refined Taelosian Clay
    }
    elsif (quest::istaskactivityactive(175,2)) { #Pottery Collect Step 3
      quest::say("Hm . . . You're not too horrible at this. Maybe you can start working on something less urgent but more complicated. There are some obsessed gnomes on this ship that insist on keeping gardens. It seems that someone has been using their watering cans as weapons and targets. We could use some more. Take a small block of refined Taelosian clay and a flask of purified sea water and form the unfired watering can on the pottery wheel. Then take the unfired watering can to the kiln and add the waterproofer. Fire those and bring them back to me.");
      quest::summonitem(58218,10); #Wayfarer Waterproofer
      quest::summonitem(58040,10); #Flask of Purified Sea Water
      quest::summonitem(58134,10); #Small Block of Refined Taelosian Clay
    }
    elsif (quest::istaskactivityactive(175,2)) { #Pottery Collect Step 4
      quest::say("You've been pretty useful. How about you start work on some vials for storing our concoctions. Just use the flasks of purified sea water, a small block of refined Taelosian clay and a Wayfarers liner sketch on the pottery wheel to make an unfired vial. Take that vial to the kiln and fire it with the waterproofer and you should have a useable vial. Bring them back to me as soon as you can.");  
      quest::summonitem(58218,10); #Wayfarer Waterproofer
      quest::summonitem(58134,10); #Small Block of Refined Taelosian Clay
      quest::summonitem(58040,10); #Flask of Purified Sea Water
      quest::summonitem(58224,10); #Wayfarer Liner Sketch
    }
    else {
      quest::say("I do not need this.");
      quest::summonitem(58032); #Clump of Refined Taelosian Clay
    }
  }
  elsif (plugin::check_handin(\%itemcount, 58026 => 1)) { #Chunk of Broken Ancient Stone Worker
    quest::say("Ah, yes. Here is your clay.");
    quest::summonitem(58031,2); #Clump of Refined Ancient Taelosian Clay
  }
  elsif (plugin::check_handin(\%itemcount, 58174 => 4) || plugin::check_handin(\%itemcount, 58174 => 3) || plugin::check_handin(\%itemcount, 58174 => 2) || plugin::check_handin(\%itemcount, 58174 => 1)) { #Wayfarer Augment Receptacle
    quest::say("Ah, yes. Thank you.");
  }
  elsif (plugin::check_handin(\%itemcount, 58183 => 4) || plugin::check_handin(\%itemcount, 58183 => 3) || plugin::check_handin(\%itemcount, 58183 => 2) || plugin::check_handin(\%itemcount, 58183 => 1)) { #Wayfarer Crucible
    quest::say("Ah, yes. Thank you.");
  }
  elsif (plugin::check_handin(\%itemcount, 58217 => 4) || plugin::check_handin(\%itemcount, 58217 => 3) || plugin::check_handin(\%itemcount, 58217 => 2) || plugin::check_handin(\%itemcount, 58217 => 1)) { #Wayfarer Watering Can
    quest::say("Ah, yes. Thank you.");
  }
  elsif (plugin::check_handin(\%itemcount, 58216 => 4) || plugin::check_handin(\%itemcount, 58216 => 3) || plugin::check_handin(\%itemcount, 58216 => 2) || plugin::check_handin(\%itemcount, 58216 => 1)) { #Wayfarer Vial
    quest::say("Ah, yes. Thank you.");
  }
  plugin::return_items(\%itemcount);
}