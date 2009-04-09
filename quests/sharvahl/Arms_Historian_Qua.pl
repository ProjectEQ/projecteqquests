sub EVENT_SAY {
if($text=~/hail/i) {
    quest::say("Hail citizen, may I help you find a book or are you looking for assistance with something else? ");
  
}
 }

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 9049 => 1)) {
    quest::say("It is a pleasure to meet you, $name. The Animists mentioned that someone would be by, but for me not to wait, so I sent the information that they requested to Weapons Master Rahoul. He is having a master smith finish the blades.");
    quest::say("Take him this receipt and I'm sure that he'll get you the weapons as soon as possible. Take care. It appears that a lot of people are relying on you in this matter. You may be the only person that can do this.");
    quest::summonitem(9050);
  }
  plugin::return_items(\%itemcount);
}