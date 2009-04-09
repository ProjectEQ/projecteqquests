# ancient pattern quest -- ranger epic
#

sub EVENT_SAY {
  if ($faction < 5) { #amiable or better Keepers of the Art
    if ($text=~/hail/i) {
      quest::say("Ah. Hello there, adventurer. Come to search for ancient artifacts with Fizzlebik and myself?");
    }
    if ($text=~/ancient artifacts/i) {
      quest::say("Oh. All types of things. This area is great. So many artifacts and remains of things all over. It's starting to fall into the pattern of things.");
    }
    if ($text=~/ancient bowl/i) {
      quest::emote("rummages through his tattered bag and throws aside a towel. 'Too many towels. Oh well, someone told me they were good to have once. Here it is, a bowl pattern. Interesting bowl. Looks almost like a magical bowl but I'm no potter. You need it, you say? Well, it is interesting. Part of my research here is for the wizard guild in Felwithe. I'm sure they'd put a high price on this one, the enchanters guild being so interested in trading for magical paraphernalia and all. Of course if you helped me out on a chore I have, I'd be happy to give it to you. I need to deliver an artifact to the guild and I'd much rather stay here exploring. If you wish, you can take the artifact and return with the receipt and I'll give you the pattern.'");
    }
    if ($text=~/take the artifact/i) {
      quest::say("Hah! Okay, then. Here take this to Farios Elianos in Felwithe. He will give you the receipt.");
      quest::summonitem(20457);
    }
  }
  else {
    quest::emote("will not speak to you, yet.");
  }
}

sub EVENT_ITEM {
  if ($faction < 5) { #amiable or better Keepers of the Art
    if (plugin::check_handin(\%itemcount, 20474 => 1)) {
      quest::emote("grins happily. 'Excellent! Was he pleased with the artifact? Oh, that's not even worth answering. I'm sure he was. He's always happy with the things I send him. That's why he honored me with this position of esteem, searching for useful and powerful items in this newly discovered land.'");
      quest::summonitem(18960);
    }
  }
  else {
    quest::say("I do not know you well enough to help you.");
    plugin::return_items(\%itemcount);
  }
}

# EOF zone: timorous ID: 96032 NPC: Alrik_Farsight

