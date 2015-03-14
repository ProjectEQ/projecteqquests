sub EVENT_SAY {
  if ($faction == 1) { # Require ally faction
    if ($text=~/hail/i) {
      quest::say("Greetings, $name. You tread in the halls of Iceshard manor. Are you here with a purpose or are you lost?");
    }
    if ($text=~/purpose/i) {
      quest::say("I do not know what purpose you would serve to the Kromrif. If you seek to amass a fortune you have come to the wrong man. I am but a simple battlerager, wielding my blade for the Iceshard brothers when needed.");
    }
    if ($text=~/battlerager/i) {
      quest::say("Yes, I am a warrior who thrives on battle. I have great faith in Rallos Zek and I call upon his power to make me more efficient in battle. I am not like the foolish berserkers. They howl like animals and create strange totems. They simply unleash their anger upon the world whereas I focus and destroy my foes with the aid of Rallos Zek.");
    }
    if ($text=~/rallos zek/i) {
      quest::say("The great war god guides my blade and has helped shape my day to day life... I feel as if there is something greater mapped out for my life than what I have here.");
    }
    if ($text=~/plan/i) {
      quest::say("I have been planning to travel forth from Kael Drakkel and destroy any Coldain who have spread from their safe home in Thurgadin. It is always a nice trip, I will take several of the elder Kromrif with me as well. Perhaps we will track down the elusive wurm, Blizzent.");
    }
    if ($text=~/blizzent/i) {
      quest::say("Blizzent is an ancient ice wurm Vorken speaks of occasionally. If I remember the story correctly, Blizzent once bit Vorken and Klaggen and has had a desire to have another taste. I have never seen the wurm myself. He may not even be alive still. If I were able to slay Blizzent and retrieve proof of it, I could probably get in good with master Vorken.");
    }
  }
}

sub EVENT_ITEM {
  if ($faction == 1) { # Require ally faction
    if (plugin::check_handin(\%itemcount, 25117 => 1)) {
      # text made up
      quest::say("Excellent, this will do nicely.  Take this sword for your efforts.");
      quest::summonitem(25083);
      quest::exp(1000);
    }
  }
}

# Quest by mystic414