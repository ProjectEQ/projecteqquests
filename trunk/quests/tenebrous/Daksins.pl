# Daksins' Vampyre Antidote
#

sub EVENT_SPAWN {
  $gaveblood = 0;
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hello traveller, what brings you to these cursed mountains? If I were you I would turn back now, all that really lies ahead of you is certain death. The vampires that inhabitant these mountains are some of the fiercest and most skilled.");
  }
  if ($text=~/return the extract/i && $gaveblood == 1) {
    quest::say("I suppose I could trust you to return it to Zimloro. You have earned my trust by going and slaying this beast for me. This will help me greatly as well as I must rest in Katta for a few days to recover from the wounds I received at the hands of these monsters. Please return this bag that contains the extract along with other components that Zimloro asked me to retrieve to him. Thank you, $name, I am forever in your debt.");
    quest::summonitem(4765);
    $gaveblood = 0;
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 4764 => 1)) {
    quest::say("I see you were sent by my friends from back home. I understand that they are very worried about me but they must understand that I am doing this to help my sister and anyone else infected by this horrible beasts. If only I could receive some help in collecting a vampyre blood extract sample I could return it home along with the other components that Zimloro decribes in this letter.");
  }
  if (plugin::check_handin(\%itemcount, 2693 => 1)) {
    quest::say("The blood of one of the cursed! You have done it, $name. You must be a very skilled fighter to have bested one of these vile creatures. All that needs to be done now is to return this extract along with the other antidote supplies that I have prepared to Zimloro. Will you return this extract?");
    $gaveblood = 1;
  }
  else {
    plugin::return_items(\%itemcount);
    return 1;
  }
  quest::exp(5000);
  quest::faction(154,10); #house of stout
  quest::faction(338,10); #traders of the haven
}

# EOF zone: tenebrous ID: 172036 NPC: Daksins

