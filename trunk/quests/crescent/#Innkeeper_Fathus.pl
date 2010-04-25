sub EVENT_SAY {
if(quest::istaskactivityactive(204,2) && $text=~/hail/i) {
   quest::say("Vasha, $name, and welcome to my little corner of our fine city of Crescent Reach. I have a fine selection of goods available and even the [council] has been known to frequent my establishment, I'm proud to say!");
  quest::updatetaskactivity(204,2);
}
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}