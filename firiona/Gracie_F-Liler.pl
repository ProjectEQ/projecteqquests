sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("It's so good to see new faces, not to mention more adventurers in this area. On some nights, the sounds that come from the nearby hills will scare even the hardiest of travelers. I volunteered in the name of the Keepers of the Art to help locate any [new spell scrolls] that might surface. Maybe you will have a successful journey and find some of these scrolls yourself.");
  }
  if ($text=~/new spell scrolls/i) {
    quest::say("I have recently come into possession of some of these scrolls. They seem to be very promising in adding to the strengths of our occupation. Some more good news is that I have a few extra of these scrolls. Perhaps you might have or find an extra of your own and be willing to trade? In case you are interested, I am looking for the scrolls Theft of Thought, Color Slant, Cripple, and lastly Dementia. Bring me one of these and I'll make an even trade.");
  }
}

sub EVENT_ITEM() {
  if (plugin::check_handin(\%itemcount, 19378 => 1) || # Spell: Color Slant
      plugin::check_handin(\%itemcount, 19269 => 1) || # Spell: Cripple
      plugin::check_handin(\%itemcount, 19384 => 1) || # Spell: Dementia
      plugin::check_handin(\%itemcount, 19374 => 1)) { # Spell: Theft of Thought
    quest::say("Here is the scroll that I promised. We have both gained much knowledge today. I hope to do business with you again soon. Farewell!");      
    quest::summonitem(quest::ChooseRandom(19386,19379,19381,19215));
    quest::exp(1000);
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:firiona  ID:84169 -- Gracie_F`Liler