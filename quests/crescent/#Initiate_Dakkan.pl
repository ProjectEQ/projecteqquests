sub EVENT_SAY {
  if(quest::istaskactivityactive(204,1) && $text=~/hail/i) {
     quest::say("Vasha, newcomer. Ah, yes, 'vasha' is what we drakkin say when we greet each other. It is a word taken from the dragon language. There is so much to learn! One of the first things I learned when I awoke from my human-sleep was the ways of nature. Would you like to [learn]?");
     quest::updatetaskactivity(204,1);
}
}
sub EVENT_ITEM {
 plugin::return_items(\%itemcount); 
}