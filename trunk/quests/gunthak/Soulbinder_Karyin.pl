#generic soulbinder quest
sub EVENT_SAY { 
  plugin::soulbinder_say($text);
}

sub EVENT_ITEM {
  quest::say("I do not need this.");
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:gunthak  ID:90964 -- Soulbinder_Karyin 

