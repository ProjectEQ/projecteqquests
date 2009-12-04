sub EVENT_SAY {

 if(quest::istaskactivityactive(158,4) && $text=~/hail/i) {
   quest::say("You've been just a peach helping out! I don't think I need your help any more, you've already done so much. Let me give you the secret I promised and you go out and enjoy the rest of the day. Yitimis pulls out several ragged-looking pieces of parchment, most with wine stains that make them almost unreadable. She holds one up for you to look at. It only takes you a minute to grasp what needs to be done to prepare the Taelosian Tea Leaves and the Taelosian Mountain Tea Leaves. In fact, you are certain that if you work at it long enough, you can produce more usable tea with practice.");
   quest::updatetaskactivity(158,4);    
}
  
 elsif ($text=~/hail/i) {
    quest::say("Hail. Brell's blessing on you. Are you, perchance, a brewer or interested in learning the craft? I have a lot of [work] to do here, and I could use some help.");
  }
  if ($text=~/work/i) {
    quest::say("We're very busy just trying to keep up with demand. With all of the new discoveries on Taelosia, we have a lot of visitors, but I'd really like to have some time to look at the native plants. I've been given some samples of the [tea] that grows locally and it has some very unusual properties. I just have not had enough time to investigate. Perhaps you could [lend a hand] with my daily tasks so that I can free up some time to look into this?");
  }
  if ($text=~/tea/i) {
    quest::say("It's aromatic and that's the least of its properties. I have a few dozen interesting ideas I want to try. Unfortunately, the tea requires special preparation before it can be used. I've worked out how to do that and I'd be very pleased if you could bring me some of those Taelosian Tea Leaves. I'll prepare them for you and only keep a small amount for myself. That way we can both try it!");
  }
  if ($text=~/lend a hand/i) {
    quest::say("Excellent. The mornings are probably the busiest around here. And a Wayfarer's favorite pick-me-up in the morning is called Spicy Sunrise. Just take the Orange Juice and the Wayfarer Spice and combine it in a brew barrel. It will make a tasty drink! Please bring them to me as soon as you can. If you [help me out] enough, I may be willing to share the secret of preparing Taelosian Teas with you!");
    quest::taskselector(158);
  }
  if(quest::istaskactivityactive(158,0) && $text=~/help me out/i) {
  quest::summonitem(58211,20);
  quest::summonitem(58057,20);
}
  if(quest::istaskactivityactive(158,1) && $text=~/help me out/i) {
  quest::say("Well hello! I can certainly use your help. We need to brew up some coffee. I think we'll make Vanilla Coffee today. Just take the Coffee Beans, the Vanilla Beans and the Flask of Purified Sea Water and combine them in a brew barrel. Please rush back and give me the coffee, we'd like to serve it hot.");
  quest::summonitem(58033,20);
  quest::summonitem(58164,20);
  quest::summonitem(58040,20);
  }
    if(quest::istaskactivityactive(158,2) && $text=~/help me out/i) {
    quest::say("Hi! I'm glad you can help. One of the things we have trouble with around here is folks that stay on duty for hour after hour and getting bored. They tend to fall asleep. Well, Galidnus designed a tasty beverage that helps folks stay awake. Though he didn't come up with a very good name for it. He calls it Galidnus Glad Juice. To make it, just put Orange Juice, Coffee Beans, and Redberry into a brew barrel and combine. Bring them back to me when you've got them ready. Thank you!");
    quest::summonitem(58057,20);
    quest::summonitem(58033,20);
    quest::summonitem(58070,20);
    }
 if(quest::istaskactivityactive(158,3) && $text=~/help me out/i) {   
    quest::say("'You sure are helpful! This one is pretty simple, though the ingredients can be expensive enough, I suppose. We need a good stock of Wayfarer Spiced Wine. Just put the Simple Wine and the Wayfarer Spice in a brew barrel and combine them. Bring me the wine and I'll get them into the store room. Thank you for helping me out.");
    quest::summonitem(58211,20);
    quest::summonitem(58133,20);
    }
    }

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}

