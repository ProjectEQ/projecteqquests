sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Poor Nedaria.  She asked me to stand by her and try to convince everyone that she is just suffering from flu. Those who have seen her know I am lying.  Worst of all, I can't seem to do anything to help her.  She is just getting worse by the hour.  How I wish Morden and Tondal would hasten their mission and return.  I think her heart might heal at least if he were here.");
  }
}
sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}