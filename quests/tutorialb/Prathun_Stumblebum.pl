#zone: tutorialb
#Revised Angelox

sub EVENT_SAY {
  if ($text=~/hail/i && quest::istaskactivityactive(22,6)) {
    quest::say("There are many members of the revolt that can aid you as you combat the kobolds.  A new soldier like yourself won't last long without friends!");
    quest::say("The trick to talking to other adventurers is to go through proper channels.  No one likes a hothead who begs for coins by shouting at everyone in earshot. . .   But if you ask nicely, you can get others to team up with you on your adventures.");
    quest::say("The dangers of combat and the adventuring lifestyle can sometimes bring out the worst in people.  It's important to keep a cool head and only shout when absolutely necessary.");
    quest::say("Good luck out there, friend.  I'm sure you'll do fine!");
    quest::say("The command /shout will allow you to shout in a large radius. The command /ooc will allow you to talk out of character across the entire world.  The /tell command is to allow you to talk to only one person without anyone else hearing it. The /say command lets you talk to others in your immediate area.");
    quest::updatetaskactivity(22,6);
   }
  elsif ($text=~/hail/i) {
    quest::say("There are many members of the revolt that can aid you as you combat the kobolds.  A new soldier like yourself won't last long without friends!");
    quest::say("The trick to talking to other adventurers is to go through proper channels.  No one likes a hothead who begs for coins by shouting at everyone in earshot. . .   But if you ask nicely, you can get others to team up with you on your adventures.");
    quest::say("The dangers of combat and the adventuring lifestyle can sometimes bring out the worst in people.  It's important to keep a cool head and only shout when absolutely necessary.");
    quest::say("Good luck out there, friend.  I'm sure you'll do fine!");
    quest::say("The command /shout will allow you to shout in a large radius. The command /ooc will allow you to talk out of character across the entire world.  The /tell command is to allow you to talk to only one person without anyone else hearing it. The /say command lets you talk to others in your immediate area.");
   }
}