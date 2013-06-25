sub EVENT_SAY {
  if ($text=~/hail/i) {
    if ($race eq "FROGLOK") {
      if ($client->HasSkill(0) && $client->HasSkill(1) && $client->HasSkill(2) && $client->HasSkill(3) && $client->HasSkill(36)) {
        if (defined $qglobals{token} && $qglobals{token} == 1) {
          quest::say("And hail to you. Well, let me have a look at you. You sure that you have [really trained]?");
        }
        else {
          quest::say("You're late! Feast of flies, what a weakling you are! We have no time to lose. [No rest] for the strong.");
        }
      }
      else {
        quest::say("Wander away, tad. You do not have what it takes.");
      }
    }
    else {
      quest::say("The Fist Strikes!");
      $npc->CastSpell(905, $userid);
    }
  }
  if ($text=~/no rest/i) {
    if ($race eq "FROGLOK") {
      if ($client->HasSkill(0) && $client->HasSkill(1) && $client->HasSkill(2) && $client->HasSkill(3) && $client->HasSkill(36)) {
        quest::say("You've slept your last easy night, recruit. If you want to stay a common footman, then keep hopping. But if you think you can be elite, if you think you can hack being a commando, then you've come to the [right place]. Welcome to the Guja.");
      }
      else {
        quest::say("Wander away, tad. You do not have what it takes.");
      }
    }
    else {
      quest::say("The Fist Strikes!");
      $npc->CastSpell(905, $userid);
    }
  }
  if ($text=~/right place/i) {
    if ($race eq "FROGLOK") {
      if ($client->HasSkill(0) && $client->HasSkill(1) && $client->HasSkill(2) && $client->HasSkill(3) && $client->HasSkill(36)) {
        quest::say("First things first. You need weapon practice. The army will take anyone who knows how to hold a pointy stick. A Guja, however, must know every means of combat. Go. Find some fights. Return to me when all your skills with blunt, slashing and piercing weapons have been honed to at least 75. Tell me then that you are [truly ready].");
      }
      else {
        quest::say("Wander away, tad. You do not have what it takes.");
      }
    }
    else {
      quest::say("The Fist Strikes!");
      $npc->CastSpell(905, $userid);
    }
  }
  if ($text=~/truly ready/i) {
    if ($client->GetSkill(0) >= 75 && $client->GetSkill(1) >= 75 && $client->GetSkill(2) >= 75 && $client->GetSkill(3) >= 75 && $client->GetSkill(36) >= 75) {
      quest::say("Good. That's a foundation we can build on. Now for your first round of training. A Guja must be adept at surviving in all forms of terrain. The swamp is warm, moist and comfortable. But you must learn to [live anywhere].");
    }
    else {
       quest::say("Ha! You're eager, but you're not ready. Go find some more fights.");
    }
  }
  if ($text=~/live anywhere/i) {
    if ($client->GetSkill(0) >= 75 && $client->GetSkill(1) >= 75 && $client->GetSkill(2) >= 75 && $client->GetSkill(3) >= 75 && $client->GetSkill(36) >= 75) {
      quest::say("Extremes of temperature and humidity are the worst. Deserts, tundra and rocky terrain are our enemies. And so they shall be the first enemies you defeat. Take this pack. Go to Lavastorm, the Northern Desert of Ro, and distant Everfrost. Live in each for a time, taking your food from the land. Bring me back two [different examples] from each area to prove your skill.");
      quest::summonitem(17272); # Basic Survival Pack
    }
    else {
      quest::say("Ha! You're eager, but you're not ready. Go find some more fights.");
    }
  }
  if ($text=~/different examples/i) {
    if ($client->GetSkill(0) >= 75 && $client->GetSkill(1) >= 75 && $client->GetSkill(2) >= 75 && $client->GetSkill(3) >= 75 && $client->GetSkill(36) >= 75) {
      quest::say("From North Ro collect Blackrock Lichen and Dry Eye Weed. From Everfrost collect Ice Blood and Winter Lilly. And finally, from Lavastorm collect Stonefruit and Lava Pears. Combine them into a useful bundle and return once you've learned your way.");
    }
    else {
      quest::say("Ha! You're eager, but you're not ready. Go find some more fights.");
    }
  }
  if ($text=~/really trained/i) {
    if ($client->GetSkill(0) >= 125 && $client->GetSkill(1) >= 125 && $client->GetSkill(2) >= 125 && $client->GetSkill(3) >= 125 && $client->GetSkill(36) >= 125) {
      quest::say("I see that you were right. Well, you'll need all of those skills for the next round of your training. You've proven you could survive where frogloks do not flourish. Now let's see how adept you are in our own elements. Go find Guja Master Therik in Lake Rathetear. And by in, I do mean IN. But watch out for the barbarians nearby. Ha! That old war dog. Take him this as a gift. I'm sure he'll get the joke.");
      quest::summonitem(63099); # Therik's Tooth
    }
    else {
      quest::say("Ha! You're eager, but you're not ready. Go find some more fights.");
    }
  }
  if ($text=~/third notch/i) {
    if (defined $qglobals{token} && $qglobals{token} == 2) {
      quest::say("Though the trolls represent a threat to our people, their threat is distant. The Lizardmen of The Feerrott, however, present a real and menacing danger. I know that they already feed on our young and plan our demise. But we will [act first].");
    }
  }
  if ($text=~/act first/i) {
    if (defined $qglobals{token} && $qglobals{token} == 2) {
      quest::say("We must learn how to fight them. We must learn how their dark lord changed them. Go, fight them at the footsteps of that black temple. Harvest their scales, their claws and their fangs. Get me three of each and put them in this bag. Turn the bag and your token in to me. It may take some time, but the blood you spill and the information you gain will help greatly. Now go.");
      quest::summonitem(17273); # Guja Battle Pack
    }
  }
  if ($text=~/another option/i) {
    if ($race eq "FROGLOK" && defined $qglobals{token} && $qglobals{token} == 3) {
      quest::say("The lizardmen have challenged us, demanding that you represent Gukta. Should you win, war will be averted and many lives spared. Of course, it may mean your [own life].");
    }
  }
  if ($text=~/own life/i) {
    if (defined $qglobals{token} && $qglobals{token} == 3) {
      quest::say("I applaud your bravery, $name. Come victory or death, you will always be remembered. Go to the obelisk bridge in front of the temple. Give your Guja Token to their emissary. It was the only sign they would accept to guarantee your identity. And it means you will only have one chance. Be wary. They are not to be trusted.");
    }
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 63090 => 1)) { # Filled Survival Pack
    quest::say("Excellent. You look much more hardy and lean. But you have a long way to go still. Take this token as a mark of your achievement. Make sure to keep it safe. Now go practice your weapon skills some more. When you think you're ready, come back here. We'll see what other weaknesses we can whittle away.");
    quest::exp(10000);
    quest::ding();
    quest::summonitem(63091); # Guja Token
    quest::setglobal("token", 1, 5, "F");
  }
  if (plugin::check_handin(\%itemcount, 63098 => 1)) { # Notched Gukta Token
    if ($race eq "FROGLOK" && defined $qglobals{token} && $qglobals{token} == 1) {
      if ($client->GetSkill(0) >= 165 && $client->GetSkill(1) >= 165 && $client->GetSkill(2) >= 165 && $client->GetSkill(3) >= 165 && $client->GetSkill(36) >= 165) {
        quest::say("Hmm, You've learned much. You know how to survive in a wide variety of environments. You've learned the ways of watery warfare. Yes, I will notch your token. But the [third notch] is something you must earn on your own.");
        quest::exp(10000);
        quest::summonitem(63103); # Twice Notched Guja Token
        quest::setglobal("token", 2, 5, "F");
      }
      else {
        quest::say("Ha! You're eager, but you're not ready. Go find some more fights.");
        quest::summonitem(63098); # Notched Gukta Token
      }
    }
  }
  if (plugin::check_handin(\%itemcount, 63103 => 1, 63104 => 1)) { # Twice Notched Guja Token, Lizardman Samples
    if ($race eq "FROGLOK" && defined $qglobals{token} && $qglobals{token} == 2) {
      quest::say("I wish I could say I welcome your return. But news has reached us. Apparently you did your job too well. The Lizardmen are even now readying for war. We cannot afford that fight. The council has decided we must . . .accept [another option].");
      quest::exp(10000);
      quest::summonitem(63105); # Thrice Notched Guja Token
      quest::setglobal("token", 3, 5, "F");
    }
  }
  if (plugin::check_handin(\%itemcount, 63106 => 1)) { # Tongue of Thugat
    if ($race eq "FROGLOK" && defined $qglobals{token} && $qglobals{token} == 3) {
      quest::say("Well done! The Lizardmen have been spurned. They will lick their wounded pride for months. This is a great victory for Gukta, $name. Here, take my own sigil of the Guja. And my shield. They are the best gifts I can think to give. Wear them proudly. You are truly a Guja now.");
      quest::exp(10000);
      quest::summonitem(63107); # Sugal's Sigil
      quest::summonitem(63108); # Sugal's Shield
    }
  }
  plugin::return_items(\%itemcount);
}
