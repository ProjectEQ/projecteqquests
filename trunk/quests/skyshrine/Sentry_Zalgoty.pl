sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Don't mind the velium in next room. They are too caught up in their duty to pay attention to anything else.");
  }
}

sub EVENT_ITEM {
  quest::say("I have no need for this, $name.");
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:skyshrine  ID:Not_Found -- Sentry_Zalgoty