# items: 20879, 20880
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 20879 => 1)) {
    quest::say("Ah, nice of you to come and pick this up for Ganelorn! I know he is a busy fellow. I certainly hope that his girlfriend will like this gift.");
    quest::summonitem(20880); # Item: Gift
  }
}