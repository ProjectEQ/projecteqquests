# NPC: a_desert_madman

sub EVENT_AGGRO {
  my $random_result = int(rand(100));
  if($random_result <= 33) {
    quest::say("Damn my eyes! You're just another mirage!");
  }
  elsif($random_result <= 66) {
    quest::say("$race\'s like you are better left dead than alive.");
  }
  else {
    quest::say("It's $race\'s like you who have ruined your own lands, You'll not ruin mine!");
  }
}
# OASIS