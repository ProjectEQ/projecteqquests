sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Vasha, $name, and welcome to my little corner of our fine city of Crescent Reach. I have a fine selection of goods available and even the [council] has been known to frequent my establishment, I'm proud to say!");
    if(quest::istaskactivityactive(204,2)) { #Welcome to Crescent Reach Step 3
      $client->Message(4,"You catch on quickly! There is no doubt you will be a force to be reckoned with.");
    }
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}