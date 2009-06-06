#BeginFile: butcher\Magus_Tira.pl
#
#

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("And how are you today, $name?  Ready to do some traveling? Hurry up, then. I have lots of things I need to do today. Tell me where you would like to go and I will send you there. I can send you to any of the other camps in [Everfrost], [Commonlands], [Nedaria's Landing], [North Ro], or [South Ro]. Hopefully I won't burn my hands this time! Long story, but my cohort, Gaelan Charhands, didn't tell me one of the words of the spell as a joke. Apparently it's funny for a beautiful gnome like myself to get her hands singed. I'll get him back some day!");
  }
  if($text=~/everfrost/i) {
    quest::say("");
    #quest::movepc();
  }
  if($text=~/commonlands/i) {
    quest::say("");
    #quest::movepc();
  }
  if($text=~/nedaria/i) {
    quest::say("I'm sorry, $name. The Gates of Discord zones are not yet available.");
    #quest::movepc();
  }
  if($text=~/north ro/i) {
    quest::say("");
    #quest::movepc();
  }
  if($text=~/south ro/i) {
    quest::say("");
    #quest::movepc();
  }
}

sub EVENT_ITEM {
  quest::say("I have no use for this, $name.");
  plugin::return_items(\%itemcount);
}

#EndFile: butcher\Magus_Tira.pl