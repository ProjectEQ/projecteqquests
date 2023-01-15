#########################################################
#  NPC:  Elisabeth
#  Zone:  Rathe Mountains
#  Quest:  Greaves of Ro
#########################################################
# items: 12313, 12303

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Very good to meet you, $name. I am the keeper of the [Greaves of Ro]. Please feel free to rest and recuperate here. We shall see that you are safe from the evils of the Rathe Mountains.");
  }
  elsif ($faction > 5) {
    quest::say("Leave my presence at once. Your ways of life are not acceptable to one who follows the Truthbringer.");
  }
  elsif ($client->GetModCharacterFactionLevel(281) < 25) {
    quest::say("In the name of the Knights of Truth, I must ask you to venture to Freeport and enter the Hall of Thruth. There you are to find Theron Rolius, and ask of him, am [I an honored member]?");
  }
  elsif ($text=~/greaves of ro/i) {
    quest::say("Go to the countryside of Freeport. There, you shall seek out any nightfall giants. They have terrorized the countryside for too long. They have protection from common weapons. Rely on magic. I failed in tracking them down. You shall succeed and when return any single head to me. you shall be awarded the mold for the greaves.");
  }
}

sub EVENT_ITEM {
   if ($faction <= 4) {
      if (plugin::check_handin(\%itemcount,12313=>1)) {
         quest::say("You have done well.  These giants shall soon be purged from the Commonlands and the inns will be filled once again.  Here is the mold for the Ro Greaves.  For the final component, go and ask Thomas of [Lord Searfire].");
         quest::summonitem(12303); #Mold of Ro Greaves
      }
   }
   plugin::return_items(\%itemcount);
}
#END of FILE Zone:rathemtn  ID:50109 -- Elisabeth

sub EVENT_ITEM {
  if ($client->GetModCharacterFactionLevel(281) > 24) {
    if (plugin::check_handin(\%itemcount, 12313 => 1)) {
      quest::say("You have done well. These giants shall soon be purged from the Commonlands and the inns will be filled once again. Here is the mold for the Ro Greaves. For the final component, go and ask Thomas of [Lord Searfire].");
      quest::summonitem(12303); #Mold of Ro Greaves
      quest::faction(281, 20); # KoT
      quest::faction(362, 4); #Priests of Marr
      quest::faction(311, 2); #Steel Warriors
      quest::faction(271, -3); #Dismal Rage
      quest::faction(330, -3); #The Freeport Militia
    }
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:rathemtn  ID:50109 -- Elisabeth
