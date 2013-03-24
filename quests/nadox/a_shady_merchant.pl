sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("You there! You look like you could use a bit of [work]. If you're interested I have something that you might find very. . . lucrative.");
  }
  if($text=~/work/i) {
    quest::say("My employers have been enjoying quite a bit of success lately with their operations and wish to continue them uninterrupted. However, these operations have been put in jeopardy lately. Those stinking [pirates] are thinking of shipping off again to resume their raiding of Faydwer and Antonica.");
  }
  if($text=~/pirates/i) {
    quest::say("It's no less than the Hate's Fury that is heading out again. You can't even imagine what a ship like that can do to the operations of my employers. We have come up with a solution, or at least a way to prolong our profits though, if you're willing to [help].");
  }
  if($text=~/help/i) {
    quest::say("Excellent, the plan is a simple one, in concept at least. The ship needs a navigator in order to be successful in its raids. If we can eliminate the navigator of the Hate's Fury she will not be able to leave until they can conscript a new one. There's been a small [complication] though.");
  }
  if($text=~/complication/i) {
    quest::say("The captain and his officers are a fairly vicious group, they are pirates after all. Because of this there is a high turn over rate on the crew. The last navigator for the ship met a rather grisly end. They recently obtained a new navigator, but we have not been able to discover who that is so far. This is where you come in, if you're still [interested].");
  }
  if($text=~/interested/i) {
    quest::say("We need you to venture onto the ship, find out who the navigator is, where he is located, and slay him if possible. Now get going and don't come back until he's dead!");
    #quest::assigntask(); #Task: Hate's Fury Setting Sail
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}