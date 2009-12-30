sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hello there. I have only the best supplies for the eager young tinkerer. I also have work for an eager tinkerer of any age, if you are [willing].");
  }
  if ($text=~/willing/i) {
    quest::say("I'm glad to see that there are some that are still willing to work and learn. There is plenty of both to be had on this ship. Personally, I am learning all that I can about how this dark matter can be [infused] with particles of what appear to be augmented stone. As for work, there is plenty of that too. I don't suppose you can help with some of that [work]?");
  }
  if ($text=~/work/i) {
    quest::say("Good. But for what I need to do, I'll need some dark matter. If you can find some raw dark matter, take it over to Skelontorim and he can treat it for you. Then bring it to me and I'll put you to work. Work hard enough and I'll teach you the secret for treating dark matter. Of course, since I am asking you to provide some of the material for the work, I will reward you more quickly than Skelontorim. So gather up some dark matter and hand it to me, and I'll give you some chores to do.");
    quest::taskselector(177);
  }
}
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 58242 => 1) && quest::istaskactivityactive(177,0)) {
  quest::say("Well, as you could probably guess, we have plenty of opportunities to get ourselves hurt out here. Heck, some of the people working on this boat hurt themselves every single day. I have figured out a way to use dark matter as a power supply for gauze presses. It's still a bit tricky to use and keep working, but they tend to last longer if handled properly. All I need you to do is put the dark matter into the presses. That sounds easy, but because dark matter is so unstable, it is difficult to place properly into the device without breaking or contaminating it. I'm certain that you can do it, though. When you have the presses ready, bring them back to me.");
  quest::summonitem(58235,10);
  quest::summonitem(58236,10);
}
  if (plugin::check_handin(\%itemcount, 58242 => 1) && quest::istaskactivityactive(177,1)) {
  quest::say("Your assistance is welcome, $name. The task I have for you is a little dangerous. I think I have discovered a new way to make flares that are not only more visible, but more distinctive. They should be more useful that simple fireworks for sending signals. The difficulty is that these flares use dark matter. I'm a little worried that a mistake might cause some damage to the tinkerer doing the work. But I can see that such danger does not discourage you! Here are some flares and some dark matter. Make sure to only use one scrap of dark matter in each flare! I'd hate to send folks out with flares that have too much power. . . Bring the flares back to me when you have them done. But please work on them over in a corner somewhat away from me. Thanks.");
  quest::summonitem(58235,10);
  quest::summonitem(58237,10);
}
  if (plugin::check_handin(\%itemcount, 58242 => 1) && quest::istaskactivityactive(177,2)) {
  quest::say("I am glad you can still work with us. I'm not one to panic, but I have been asked to beef up the ship's water pumps and repair some of the old ones. This might just be routine maintenance, but I could speculate otherwise, but that would be impolite. Please take these pumps and power them with the dark matter and grease all of the moving parts. Bring them back to me when you are done.");
  quest::summonitem(58235,10);
  quest::summonitem(58238,10);
  quest::summonitem(58234,10);
}
  if (plugin::check_handin(\%itemcount, 58242 => 1) && quest::istaskactivityactive(177,3)) {
  quest::say("Oh, hello. Great, you brought more dark matter. I've been wanting to try something for a while now, and this should allow me to try it. I hate rats. Any reasonable person does. But the sailors are used to having them around and don't take any efforts to get rid of the pests. I have been snapping up any broken clockworks that I can find and refitting them to look something like cats. If you could power them up with the dark matter, set in the bait and bring them back to me, I'd be grateful.");
  quest::summonitem(58235,10);
  quest::summonitem(58240,10);
  quest::summonitem(58239,10);
}
if (plugin::check_handin(\%itemcount, 58243 =>1 )) {
  quest::summonitem(58244,2);
}
plugin::return_items(\%itemcount);
}