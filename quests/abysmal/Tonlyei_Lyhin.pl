sub EVENT_SAY {
  if(quest::istaskactivityactive(164,4) && $text=~/hail/i) {
     quest::emote("smiles and clasps your hand for a moment");
     quest::say("You have been of such great assistance to us that I can no longer ask you to spend your days working for us. I thank you. Please, allow me to show you the secret to preparing Muramite etched scales. This method will work on the younger and aged scales. Tonlyei opens her sewing kit and shows you the contents. The kit is old, the tools you see there have been handed down by generations in her family. She points to a clearly marked bottle of liquid, a common substance that you might not have thought to use when working with this material. She explains that if you use it liberally when working with the Muramite scales it will reduce the brittleness that tends to develop over time, and makes it possible to work with them. You know that you can use this method, and you even suspect that you will be able to improve on it if you work with the scales for a while. Tonlyei bows slightly to you May Prexus guard the waters of your life, $name.");
     quest::updatetaskactivity(164,4);
}

  elsif ($text=~/hail/i) {
    quest::say("Greetings, $name. I hope this day finds you well. For us, as for many aboard, things are hectic. There are many people in need of new clothing or armor among the Wayfarers, and it is our pleasure to provide them. There are other tasks that we would like to attend to. I have received several samples of skin from the Muramites, and I believe that it can be used in many interesting applications. I would like to work with it if only I had [time].");
  }
  if ($text=~/time/i) {
    quest::say("Time is precious for me. I wonder, would you be able to aid me by tackling some of my [chores] while I spend some time working with the [Muramite etched scales]?");
  }
  if ($text=~/muramite etched scales/i) {
    quest::say("As horrific as it seems, the creatures that have invaded Taelosia are part beast and part men, or so I'm told. They appear to have intellect and many functions like men, but their physiology is very different from ours in many ways. For me, the most interesting thing is that they wear the scales of another creature as armor. It seems that those that have armor, make it from the scales of the same creature. These scales are as tough as any animal, and treated and tanned properly we can make it into a very durable and supple material. I know the secret for preparing those scales. I'd be happy to prepare any Muramite Etched Scales you can bring me. The stuff is very strange, and it is difficult to get large usable pieces, but I'll give you the majority of what I can cull from it. I'll also keep a bit of it for myself as payment for the work.");
  }
  if ($text=~/chores/i) {
    quest::say("Very well then. I appreciate your assistance. I have long suspected that certain Wayfarers have been selling their clothing for drink and that is why they need replacements so frequently. Regardless of the reason, there are several simple items that I need to keep in abundant supply. If you can find the time to help us keep up with those supplies, I would be willing to teach you the method we have discovered for making useful leather out of the scales of those Muramites. There will be a [lot of work] for you as I won't be handing out this secret easily, but if you think the reward is worth the effort, then let's begin by having you make some simple belts for us. These are not complicated, nor are they meant to last, as there seems to be no point in making durable items for these scallywags. Just take a yard of this cloth and a pattern and place them into your sewing kit and combine them. Please return the belts to me as quickly as you can.");
    quest::taskselector(164);
  }
  if(quest::istaskactivityactive(164,0) && $text=~/lot of work/i) {
     quest::summonitem(58221,20);
     quest::summonitem(58087,20);
}
  if(quest::istaskactivityactive(164,1) && $text=~/lot of work/i) {
     quest::emote("smiles and nods approvingly");
     quest::say("Welcome back. Again, I thank you for your efforts. I suppose it wouldn't shock you to know that my fellow Wayfarers use up a large number of socks every day. Many of them refuse to wear shoes as they traipse about the ship. Others just lose them. I suspect that some of the less reputable folks have been using them to filter tea! So, I have resorted to making a large volume of, well, lesser quality socks to give out to those that seem to require replacements more often than others. I would be grateful if you could create a good number of pairs for me to bolster my supplies. These are easy to make. Just take a yard of this cloth and a pattern and combine them in your sewing kit. Bring the socks to me when you are done. Thank you.");
     quest::summonitem(58221,20);
     quest::summonitem(58120,20);
  }
  if(quest::istaskactivityactive(164,2) && $text=~/lot of work/i) {
    quest::say("Greetings to you, $name. It appears that our supply of pants has run low again. These are just simple cloth pants meant to be worn around the ship, not to protect anyone from harsh weather or sword cuts. This fabric starts off rough, but when washed it actually becomes rather soft. Sure, it's not silk, and you won't catch me wearing it, but for most that venture about this ship it is more than adequate for their needs. Just take a yard of cloth and a pattern and combine them in your sewing kit. Please bring the pants to me when you are done so that I can get a pair onto one of the halflings, as he is wont to run about without any.");
    quest::summonitem(58221,20);
    quest::summonitem(58110,20);
    }
  if(quest::istaskactivityactive(164,3) && $text=~/lot of work/i) {
     quest::say("Wonderful! I must say your enthusiasm has brightened my day. I like to keep a good supply of shirts available for those that need replacements and for use by those that wear heavy armor as undershirts. These do not need to be of the best quality, but they need to be well made. I think you can produce a more than adequate shirt. Take a yard of cloth and a shirt pattern and combine them in your sewing kit. When you have the finished shirts, bring them to me.");
     quest::summonitem(58221,20);
     quest::summonitem(58115,20);
  }
  }
sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}