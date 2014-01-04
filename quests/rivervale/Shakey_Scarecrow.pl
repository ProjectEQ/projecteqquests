sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::emote("rustles and looks up at you in acknowledgment.");
    quest::signal(19052, 0); #Reebo_Leafsway
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 14321 => 1)) {
    quest::summonitem(quest::ChooseRandom(13980, 13980, 14031));
  }
  if (plugin::check_handin(\%itemcount, 11139 => 1)) {
    $client->Message(0, "You remove the dilapidated pumpkin from Shakey's wooden neck post and replace it with the new one. A haunting voice rings in your ears");
    quest::say("Who has given me a voice once again? I can sense your presence but cannot see your form. Allow me but a moment to explain. I have been trapped in this golem of hay for many years. Ever since the horrible bloodbath in the forest I have been bound to this horrible fate, and I cannot find rest until the person responsible for my murder has been dealt with! Our fates are intertwined, you and I. We can both find peace if you listen to what I have to say. Find the blue orb. It yet retains its dark power. Go into the woods and seek out the one with a fragment.");
    quest::summonitem(52355, 2); #Dilapidated Head of Shakey
  }
  plugin::return_items(\%itemcount);
}