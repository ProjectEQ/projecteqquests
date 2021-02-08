# Mining Operation
#
# items: 4754, 4756, 4747, 4755

sub EVENT_SPAWN {
  $picks = 0;
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Lo there stranger what ya doin in ere? You know how dangerous it can be down ere! I be lucky I got some of da finest miners werkin for me. I sure do hope we get those supplies soon.");
  }
  if ($text=~/retrieve the mining picks/i && $picks == 1) {
    quest::say("Excellent, $name. Please go see Terasol in Katta to retrieve my mining supplies. Bring him this note to show that you were sent by me. And dunt stray off track with these supplies, we needs em bad!");
    quest::summonitem(4754); # Item: Jarbled Note
    $picks = 0;
  }
  if ($text=~/return a letter/i && $picks == 2) {
    quest::say("I thank you, $name. Without your help I doubt we would have been able to finish this project on time! Please take this to my wife Aliane back home. You can surely count on me telling the Patriarch of how much help you have been when I return home. I wish you good journeys as for me its back to work I go!");
    quest::summonitem(4756); # Item: Letter to Aliane
    $picks = 0;
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 4747 => 1)) {
    quest::say("Ah these must be from ol Coggo! Ye see I had sent out a few men to gather some new picks an such for the mining operation ere but they haven't returned yet. I'm really in need of some picks that are being held in Katta by a friend of mine. Will you [retrieve the mining picks] for me?");
    $picks = 1;
  }
  if (plugin::check_handin(\%itemcount, 4755 => 1)) {
    quest::say("Ye did it, $name! Ye hear dat boys! Dis outlander ere jess delivered us our new minin picks! You have no idea how much these supplies will aid our operation! As a final task would you be able to [return a letter] to me wife back home?");
    $picks = 2;
  }
  else {
    plugin::return_items(\%itemcount);
    return 1;
  }
  quest::exp(2500);
  quest::faction(1512,10); #house of stout
  quest::faction(1508,10); #traders of the haven
}

# EOF zone: paludal ID: 156067 NPC: Daesorak_Steelknuckle

