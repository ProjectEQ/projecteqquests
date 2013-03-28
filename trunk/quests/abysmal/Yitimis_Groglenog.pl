sub EVENT_SAY {
  if ($text=~/hail/i) {
    if (quest::istaskactivityactive(168,4)) { #Brewing Collect Step 5
      quest::say("You've been just a peach helping out! I don't think I need your help any more, you've already done so much. Let me give you the secret I promised and you go out and enjoy the rest of the day.");
      $client->Message(15, "Yitimis pulls out several ragged-looking pieces of parchment, most with wine stains that make them almost unreadable. She holds one up for you to look at. It only takes you a minute to grasp what needs to be done to prepare the Taelosian Tea Leaves and the Taelosian Mountain Tea Leaves. In fact, you are certain that if you work at it long enough, you can produce more usable tea with practice.");
      quest::LearnRecipe(7839); #Taelosian Tea
      quest::LearnRecipe(7838); #Taelosian Mountain Tea
    }
    elsif(quest::istaskactivityactive(158,4)) { #Brewing Freebie Step 5
      quest::say("You've been just a peach helping out! I don't think I need your help any more, you've already done so much. Let me give you the secret I promised and you go out and enjoy the rest of the day.");
      $client->Message(15, "Yitimis pulls out several ragged-looking pieces of parchment, most with wine stains that make them almost unreadable. She holds one up for you to look at. It only takes you a minute to grasp what needs to be done to prepare the Taelosian Tea Leaves and the Taelosian Mountain Tea Leaves. In fact, you are certain that if you work at it long enough, you can produce more usable tea with practice.");
      quest::LearnRecipe(7839); #Taelosian Tea
      quest::LearnRecipe(7838); #Taelosian Mountain Tea
    }
    else {
      quest::say("Hail. Brell's blessing on you. Are you, perchance, a brewer or interested in learning the craft? I have a lot of [work] to do here, and I could use some help.");
    }
  }
  if ($text=~/work/i) {
    quest::say("We're very busy just trying to keep up with demand. With all of the new discoveries on Taelosia, we have a lot of visitors, but I'd really like to have some time to look at the native plants. I've been given some samples of the [tea] that grows locally and it has some very unusual properties. I just have not had enough time to investigate. Perhaps you could [lend a hand] with my daily tasks so that I can free up some time to look into this?");
  }
  if ($text=~/tea/i) {
    quest::say("It's aromatic and that's the least of its properties. I have a few dozen interesting ideas I want to try. Unfortunately, the tea requires special preparation before it can be used. I've worked out how to do that and I'd be very pleased if you could bring me some of those Taelosian Tea Leaves. I'll prepare them for you and only keep a small amount for myself. That way we can both try it!");
  }
  if ($text=~/lend a hand/i) {
    if (quest::istaskactivityactive(158,0)) { #Brewing Freebie Step 1
      quest::say("Excellent. The mornings are probably the busiest around here. And a Wayfarer's favorite pick-me-up in the morning is called Spicy Sunrise. Just take the Orange Juice and the Wayfarer Spice and combine it in a brew barrel. It will make a tasty drink! Please bring them to me as soon as you can. If you help me out enough, I may be willing to share the secret of preparing Taelosian Teas with you!");
      quest::summonitem(58211,20); #Wayfarer Spice
      quest::summonitem(58057,20); #Orange Juice
    }
    elsif (quest::istaskactivityactive(158,1)) { #Brewing Freebie Step 2
      quest::say("Well hello! I can certainly use your help. We need to brew up some coffee. I think we'll make Vanilla Coffee today. Just take the Coffee Beans, the Vanilla Beans and the Flask of Purified Sea Water and combine them in a brew barrel. Please rush back and give me the coffee, we'd like to serve it hot.");
      quest::summonitem(58033,20); #Coffee Beans
      quest::summonitem(58164,20); #Vanilla Beans
      quest::summonitem(58040,20); #Flask of Purified Sea Water
    }
    elsif (quest::istaskactivityactive(158,2)) { #Brewing Freebie Step 3
      quest::say("Hi! I'm glad you can help. One of the things we have trouble with around here is folks that stay on duty for hour after hour and getting bored. They tend to fall asleep. Well, Galidnus designed a tasty beverage that helps folks stay awake. Though he didn't come up with a very good name for it. He calls it Galidnus Glad Juice. To make it, just put Orange Juice, Coffee Beans, and Redberry into a brew barrel and combine. Bring them back to me when you've got them ready. Thank you!");
      quest::summonitem(58057,20); #Orange Juice
      quest::summonitem(58033,20); #Coffee Beans
      quest::summonitem(58070,20); #Redberry
    }
    elsif (quest::istaskactivityactive(158,3)) { #Brewing Freebie Step 4
      quest::say("'You sure are helpful! This one is pretty simple, though the ingredients can be expensive enough, I suppose. We need a good stock of Wayfarer Spiced Wine. Just put the Simple Wine and the Wayfarer Spice in a brew barrel and combine them. Bring me the wine and I'll get them into the store room. Thank you for helping me out.");
      quest::summonitem(58211,20); #Wayfarer Spice
      quest::summonitem(58133,20); #Simple Wine
    }
    else {
      quest::taskselector(158); #Brewing Freebie
    }
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 58153 => 1)) { #Taelosian Tea Leaves
    quest::say("Ah, yes. Here is your tea.");
    quest::summonitem(58152,2); #Taelosian Tea
  }
  elsif (plugin::check_handin(\%itemcount, 58144 => 4) || plugin::check_handin(\%itemcount, 58144 => 3) || plugin::check_handin(\%itemcount, 58144 => 2) || plugin::check_handin(\%itemcount, 58144 => 1)) { #Spicy Sunrise
    quest::say("Ah, yes. Thank you.");
  }
  elsif (plugin::check_handin(\%itemcount, 58165 => 4) || plugin::check_handin(\%itemcount, 58165 => 3) || plugin::check_handin(\%itemcount, 58165 => 2) || plugin::check_handin(\%itemcount, 58165 => 1)) { #Vanilla Coffee
    quest::say("Ah, yes. Thank you.");
  }
  elsif (plugin::check_handin(\%itemcount, 58041 => 4) || plugin::check_handin(\%itemcount, 58041 => 3) || plugin::check_handin(\%itemcount, 58041 => 2) || plugin::check_handin(\%itemcount, 58041 => 1)) { #Galidnus' Glad Juice
    quest::say("Ah, yes. Thank you.");
  }
  elsif (plugin::check_handin(\%itemcount, 58213 => 4) || plugin::check_handin(\%itemcount, 58213 => 3) || plugin::check_handin(\%itemcount, 58213 => 2) || plugin::check_handin(\%itemcount, 58213 => 1)) { #Wayfarer Spiced Wine
    quest::say("Ah, yes. Thank you.");
  }
  plugin::return_items(\%itemcount);
}