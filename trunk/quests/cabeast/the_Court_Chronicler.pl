#The Court Chronicler sells a tome that tells of Talon Southpaw, for the Whistling Fists quest line

sub EVENT_SAY {
 if($text =~ /hail/i) {
  quest::say("Greetings, $name. May I interest you in one of the tomes of our history?"); #Made this up
 }
}

#Submitted by Jim Mills