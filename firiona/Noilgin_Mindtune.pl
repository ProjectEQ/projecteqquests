# Al'Kabor's Research - Ring of the Messenger
#
# items: 6067, 6069

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hello there, $name! I hope you are enjoying your visit to the outpost. I know I sure am.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 6067 => 1)) {
    quest::say("Oh no! I have been tracked down. Can't I have a moment's peace? I'm sorry you went through all the trouble to get this to me, but I'm not delivering mail right now. I'm trying to take a vacation. You'll have to deliver it to Lanivon Baxer in the Toxxulia Forest yourself. Here, take it back. I have packaged it up nicely for the journey.");
    quest::summonitem(6069); # Item: Packaged Research Notes
  }
  plugin::return_items(\%itemcount);
}

# EOF zone: firiona ID: 84162 NPC: Noilgin_Mindtune

