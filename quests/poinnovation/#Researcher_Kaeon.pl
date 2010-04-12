sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Salutations. We have been monitoring your performance in the scrap yards. Your ability seems to rival your physical capabilities. We would like to test your endurance and mental abilities further. Would you comply to endurance testing?");
  }
  if ($text=~/I will comply/i) {
    quest::say("'Excellent. We would like to test a maximum of six at one time. Are you ready to begin testing?");
  }
  if ($text=~/ready/i) {
    quest::say("Excellent I will now send you down to the testing bay. Assistant Kelrig will be there shortly with further instructions.");
    quest::selfcast(1091);
  }
}
sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}