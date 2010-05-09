sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Ahoy there friend. As always you are welcome to seek shelter here amongst us. Please take care, however. As you can see we have not much space that is safe from the eyes of these strange invaders. Watch your step!");
  }
}
sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}