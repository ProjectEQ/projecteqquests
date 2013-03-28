#BeginFile: #Jeremy_Leafrunner.pl
#Quest for Jaggedpine - Jeremy Leafrunner: Jeremy's Letter

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Hello there $name. Nice day today isn't it? We really appreciate the help that the city of Qeynos has offered us in defense of [Fort Jaggedpine].");
  }
  if($text=~/Fort Jaggedpine/i) {
    quest::say("That's the name my grandfather and grandmother gave to this place a while ago. Great name don't you think? Well at least I think it is anyway. My grandmother moved away after my grandfather passed away a long time ago. Are you [planning a trip to Felwithe] any time soon?");
  }
  if($text=~/planning a trip to Felwithe/i) {
    quest::say("Hey that's great. I don't see much of my grandmother these days, would you be [willing to deliver a letter] to her?");
  }
  if($text=~/willing to deliver a letter/i) {
    quest::say("Thanks a bunch, I really appreciate it! Here take this to her. Her name is Elishia.");
    quest::summonitem(8969); #Letter to Elishia
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 8970=>1)) { #Letter to Jeremy
    quest::say("Thank you! It is great to hear from my grandmother."); #Real text still needed
    quest::faction(271,20);  #Residents of Jaggedpine
    quest::faction(159,20);  #Jaggedpine Treefolk
    quest::faction(265,20);  #Protectors of Pine
    quest::faction(135,20);  #Guards of Qeynos
  }
  plugin::return_items(\%itemcount);
}
#EndFile: #Jeremy_Leafrunner.pl