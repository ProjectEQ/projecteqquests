sub EVENT_SAY {
  if ($text=~/hail/i && $race ne "FROGLOK") {
    quest::say("The Fist Strikes!");
    $npc->CastSpell(905,$userid);
  }
  elsif ($text=~/hail/i) {
    quest::say("You're late! Feast of flies, what a weakling you are! We have no time to lose. [No rest] for the strong.");
  }
  elsif ($text=~/hail/i && $qglobals{token} == 1) {
     quest::say("And hail to you. Well, let me have a look at you. You sure that you have [really trained]?");
   }
  if ($text=~/no rest/i) {
    quest::say("You've slept your last easy night, recruit. If you want to stay a common footman, then keep hopping. But if you think you can be elite, if you think you can hack being a commando, then you've come to the [right place]. Welcome to the Guja.");
  }
  if ($text=~/right place/i) {
    quest::say("First things first. You need weapon practice. The army will take anyone who knows how to hold a pointy stick. A Guja, however, must know every means of combat. Go. Find some fights. Return to me when all your skills with blunt, slashing and piercing weapons have been honed to at least 75. Tell me then that you are [truly ready].");
  }
  if ($text=~/different examples/i) {
    quest::say("From North Ro collect Blackrock Lichen and Dry Eye Weed. From Everfrost collect Ice Blood and Winter Lilly. And finally, from Lavastorm collect Stonefruit and Lava Pears. Combine them into a useful bundle and return once you've learned your way.");
  }
  if($client->GetSkill(0) >= 75 && $client->GetSkill(1) >= 75 && $client->GetSkill(2) >= 75 && $client->GetSkill(3) >= 75 && $client->GetSkill(36) >= 75) {
  if ($text=~/truly ready/i) {
    quest::say("Good. That's a foundation we can build on. Now for your first round of training. A Guja must be adept at surviving in all forms of terrain. The swamp is warm, moist and comfortable. But you must learn to [live anywhere].");
  }
  }
  if ($text=~/live anywhere/i) {
    quest::say("Extremes of temperature and humidity are the worst. Deserts, tundra and rocky terrain are our enemies. And so they shall be the first enemies you defeat. Take this pack. Go to Lavastorm, the Northern Desert of Ro, and distant Everfrost. Live in each for a time, taking your food from the land. Bring me back two [different examples] from each area to prove your skill.");
    quest::summonitem(17272);
  }
  if($client->GetSkill(0) >= 130 && $client->GetSkill(1) >= 130 && $client->GetSkill(2) >= 130 && $client->GetSkill(3) >= 130 && $client->GetSkill(36) >= 130) {
  if ($text=~/really trained/i  && $qglobals{token} == 1) {
    quest::say("I see that you were right. Well, you'll need all of those skills for the next round of your training. You've proven you could survive where frogloks do not flourish. Now let's see how adept you are in our own elements. Go find Guja Master Therik in Lake Rathetear. And by in, I do mean IN. But watch out for the barbarians nearby. Ha! That old war dog. Take him this as a gift. I'm sure he'll get the joke.");
    quest::summonitem(63099);
  }
}
}
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 62854 =>1 )) {
    quest::say("Excellent. You look much more hardy and lean. But you have a long way to go still. Take this token as a mark of your achievement. Make sure to keep it safe. Now go practice your weapon skills some more. When you think you're ready, come back here. We'll see what other weaknesses we can whittle away.");
    quest::summonitem(63091);
    quest::exp(10000);
    quest::ding();
    quest::setglobal("token",1,5,"F");
  }
  if (plugin::check_handin(\%itemcount, 63098 =>1 )) {
    if($client->GetSkill(0) >= 160 && $client->GetSkill(1) >= 160 && $client->GetSkill(2) >= 160 && $client->GetSkill(3) >= 160 && $client->GetSkill(36) >= 160) {
    quest::say("Hmm, You've learned much. You know how to survive in a wide variety of environments. You've learned the ways of watery warfare. Yes, I will notch your token. But the [third notch] is something you must earn on your own.");
    quest::summonitem(63103);
  }
  }
  plugin::return_items(\%itemcount);
}