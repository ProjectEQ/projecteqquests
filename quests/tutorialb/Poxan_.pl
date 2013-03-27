#zone - tutorialb
#quest - Poxan's Sword
#Angelox - updated by site3op

sub EVENT_SAY {
  if ($text=~/hail/i){
    quest::emote("sighs heavily as he peers into the murky water. 'This is terrible, I've dropped my sword into the water and I can't swim! I don't suppose you could get it back for me $name? I can't very well fight kobolds without a sword.'");
  }
}

sub EVENT_ITEM{
  if (plugin::check_handin(\%itemcount, 59968 => 1)) {
    quest::say("Excellent, thank you, $name. Now I can fight along side the revolt against the kobolds. Here take this. I found it in the tunnels earlier. You might need it.");
    quest::summonitem(59969);
    quest::exp(10);
  }
  plugin::return_items(\%itemcount);
}
