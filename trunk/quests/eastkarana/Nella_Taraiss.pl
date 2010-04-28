#BeginFile: eastkarana\Nella_Taraiss.pl (15190)
#Quest file for East Karana - Nella Taraiss: By the Stones

sub EVENT_SAY {
  if($text=~/hail/i) {
    if(quest::istaskactivityactive(139,2)) {
      quest::say("Thanks for contacting me. Your information on this matter has been most useful.");
      $client->Message(15,"The search for the Morticalidon won't end, not as long as entrepid explorers like you are on the trail. With this type of creature, you never know when or where you'll find it, but one thing is for sure -- finding this creature will be the most rewarding experience you'll ever have. In the meantime, here's payment for the time you spent searching.");
    }
    else {
      quest::say("Hello, $name.");
    }
  }
}

sub EVENT_ITEM {
  quest::say("I have no use for this, $name.");
  plugin::return_items(\%itemcount);
}
#EndFile: eastkarana\Nella_Taraiss.pl (15190)