sub EVENT_ITEM{
   quest::say("I have no need for this item, $name. You can have it back");
   plugin::return_items(\%itemcount);
}   