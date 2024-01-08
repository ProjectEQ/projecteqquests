sub EVENT_SAY {
  if ($text=~/hail/i) {
    if (!quest::istaskcompleted(8799)) { #Task: Achievements
      quest::say("Oh, $name! That's your name, right? I'm recording all the events here. Assuming I survive, this will turn into quite a marvelous account of what occurred! But I think someone of your potential is going to go on to even greater adventures. Maybe you'd like to hear more about what kind of achievements are possible for the greatest of adventurers?");
      quest::taskselector(8799); #Task: Achievements
    }
    if (quest::istaskactivityactive(8799, 0)) {
      #force open achievements window
      quest::updatetaskactivity(8799, 0);
    }
    quest::popup("Achievements Overview", "<br><c \"#CCFF99\">Achievements</c> are a record of your character's accomplishments. You can find the Achievements window located under \"Character\" in the EverQuest menu. <br><br><c \"#00F0F0\">Examine</c> the various tabs here, which can be expanded and collapsed to expose subcategories and specific achievements.<br><br><c \"#F07F00\">Click 'OK' to learn about achievement types.</c>", 13);
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}