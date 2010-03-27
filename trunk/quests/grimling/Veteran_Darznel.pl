sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Well met, friend. May I be of assistance?");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 8471 =>1 )) {
    quest::say("Let's see, yes... yes... It looks like you signed everything in the correct spot. That can only mean that you're not only brave, but you have some wits as well. If you have all of your teeth and can stand on one leg until the count of five, I think we can make use of you.");
    quest::say("Go and find Scout Husman. He's been leading raiding parties against the grunt camps. Adventures are great, but we need a real soldier to assist him this time. Perhaps we will get better results with your help.
Bring me any grimling intelligence reports or documents that you may have found. Place the documents and your Garrison Cloak in this bag and bring them back to me. Complete this task and you may even get a promotion.");
    quest::summonitem(17130);
  }
  if (plugin::check_handin(\%itemcount, 8472 =>1 )) {
    quest::say("I cannot help but think that your presence and leadership are what made those missions such wonderful successes. I have been authorized to give you a field promotion for your valor and bravery in combat. Your ability to lead was the keystone in the success of those engagements. Welcome to the rank of Garrison Officer, #name.");
    quest::summonitem(63168);
  }
  plugin::return_items(\%itemcount);
}