sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Welcome! Welcome! Hey, I don't suppose you'd like to learn how to brew? Or maybe you already know the trade and you just want to help me out? I've got some busywork to do, and I'd like to get someone else to do it for me. I'd rather spend my time making tea from those wonderful local tea leaves. There's a wild variety that somehow grows in the mountains that I really would like to spend some time working with. Can you help me with my [busywork]?");
  }
  if ($text=~/busywork/i) {
    quest::say("The local tea can be used for some helpful brews. Of course this means that I have to spend all my time and energy brewing stuff up for the Wayfarers and no time trying new ideas. I really want to investigate this [mountain tea]! It's supposedly growing in harsh terrain, and the properties it displays are definitely magical. So if you are willing to do [some work] for me, I'll reward you with the secret that Yitimis and I have learned about preparing both types of local tea. I would need you to bring me some of the Taelosian Tea that Yitimis can make for you if you bring her Taelosian Tea Leaves.");
  }
  if ($text=~/mountain tea/i) {
    quest::say("It's amazing that this tea can grow in those mountains. I hear the locals like it a lot and often have it with them. I'd love to have some, and I'll prepare the Taelosian Mountain Tea leaves for you. I'll give you most of the Taelosian Mountain Tea and keep just a bit for myself.");
  }
  if ($text=~/some work/i) {
    quest::say("I can definitely use your help. I need some Taelosian Tea for the tasks I want you to do. Give Yitimis some Taelosian Tea Leaves and she can prepare Taelosian Tea for you. If you bring that to me, I can get you doing the busywork. Of course, since I'm asking you to supply the materials, I can reward you sooner than Yitimis will.");
    quest::taskselector(168); #Brewing Collect
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 58152 => 1)) { #Taelosian Tea
    if (quest::istaskactivityactive(168,0)) { #Brewing Collect Step 1
      quest::say("Let's get you started. Brew us up some Traveler's Tea. Just drop a Small Bundle of Taelosian Tea and a Pinch of Sugar into a brew barrel and combine. The tea it makes is very tasty and very popular with the Wayfarers. Bring the Traveler's Tea to me as soon as you have it.");
      quest::summonitem(58065,10); #Pinch of Sugar
      quest::summonitem(58136,10); #Small Bundle of Taelosian Tea
    }
    elsif (quest::istaskactivityactive(168,1)) { #Brewing Collect Step 2
      quest::say("Much work to do. Dive right in and brew up some Wayfarer Spiced Tea. Just take a Small Bundle of Taelosian Tea and Wayfarer Spice and combine them in a brew barrel. The result is pretty good! Just bring the tea back to me when you have it ready. Thank you."); 
      quest::summonitem(58136,10); #Small Bundle of Taelosian Tea
      quest::summonitem(58211,10); #Wayfarer Spice
    }
    elsif (quest::istaskactivityactive(168,2)) { #Brewing Collect Step 3
      quest::say("You'll have plenty of experience brewing tea before I'm done with you,' Galidnas smiles. 'I need more Bitter Berry Tea. Personally, I can't stand the stuff, but it goes over well with some folks. Just take a Small Bundle of Taelosian Tea and a Bitter Berry and combine them in a brew barrel. Don't worry, you only need one of those berries, they are really bitter! Bring the tea back to me when you're done.");
      quest::summonitem(58136,10); #Small Bundle of Taelosian Tea
      quest::summonitem(58223,10); #Bitter Berry
    }
    elsif (quest::istaskactivityactive(168,3)) { #Brewing Collect Step 4
      quest::say("Busy work is never done, is it? Well, I need some Rum Tea brewed up. Simple, but wonderful stuff, especially with that new tea. Combine Small Bundle of Taelosian Tea, Wayfarer Spice and an Ounce of Rum in a brew barrel to make this. It's my favorite drink. Bring it right back here to me as soon as you can, please.");
      quest::summonitem(58136,10); #Small Bundle of Taelosian Tea
      quest::summonitem(58211,10); #Wayfarer Spice
      quest::summonitem(58061,10); #Ounce of Rum
    }
    else {
      quest::say("I do not need this.");
      quest::summonitem(58152); #Taelosian Tea
    }
  }
  elsif (plugin::check_handin(\%itemcount, 58148 => 1)) { #Taelosian Mountain Tea Leaves
    quest::say("Ah, yes. Here is your tea");
    quest::summonitem(58147,2); #Taelosian Mountain Tea
  }
  elsif (plugin::check_handin(\%itemcount, 58159 => 4) || plugin::check_handin(\%itemcount, 58159 => 3) || plugin::check_handin(\%itemcount, 58159 => 2) || plugin::check_handin(\%itemcount, 58159 => 1)) { #Traveler's Tea
    quest::say("Ah, yes. Thank you.");
  }
  elsif (plugin::check_handin(\%itemcount, 58212 => 4) || plugin::check_handin(\%itemcount, 58212 => 3) || plugin::check_handin(\%itemcount, 58212 => 2) || plugin::check_handin(\%itemcount, 58212 => 1)) { #Wayfarer Spiced Tea
    quest::say("Ah, yes. Thank you.");
  }
  elsif (plugin::check_handin(\%itemcount, 58022 => 4) || plugin::check_handin(\%itemcount, 58022 => 3) || plugin::check_handin(\%itemcount, 58022 => 2) || plugin::check_handin(\%itemcount, 58022 => 1)) { #Berry Tea
    quest::say("Ah, yes. Thank you.");
  }
  elsif (plugin::check_handin(\%itemcount, 58071 => 4) || plugin::check_handin(\%itemcount, 58071 => 3) || plugin::check_handin(\%itemcount, 58071 => 2) || plugin::check_handin(\%itemcount, 58071 => 1)) { #Rum Tea
    quest::say("Ah, yes. Thank you.");
  }
  else {
    quest::say("I do not need this.");
    plugin::return_items(\%itemcount);
  }
}