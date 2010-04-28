#BeginFile: steamfont\Brynn_Tinkerton.pl (56160)
#Quest file for Steamfont Mountains - Brynn Tinkerton: Tour of the Castle

sub EVENT_SAY {
  if($text=~/hail/i) {
    if(quest::istaskactivityactive(14,3)) {
      quest::say("Thanks for contacting me, $name. Your information on this matter has been most useful.");
      $client->Message(7,"You've impressed quite a few people with your cunning. Some thought that you, the Red Beetle, would fail, but others felt you had exactly what it took to get the job done. They were right. You may be contacted in the future, Red Beetle, so keep a watchful eye to the sky for the Black Bixie. Here's a little something for your trouble.");
    }
    else {
      quest::say("Hello, $name");
    }
  }
}

sub EVENT_ITEM {
  quest::say("I have no use for this, $name.");
  plugin::return_items(\%itemcount);
}

#EndFile: steamfont\Brynn_Tinkerton.pl (56160)