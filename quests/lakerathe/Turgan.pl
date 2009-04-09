#BeginFile: Turgan.pl
# Part of the quest for Boots of the Reliant

sub EVENT_SAY {
  if($text=~/Hail/i) {
    quest::say("Hail!  What brings you here?");
  }
  if($text=~/icon of the reliant/i) {
    quest::say("Where did you hear... I don't know what you are talking about.  Begone!  Back to Kithicor with you!");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 18145 => 1)) { #Turgan's Note
    quest::say("I am that Turgan, but I am no longer worthy of this title.  Take this in hopes that you become a better steward than I was.");
    quest::summonitem(19002); #Icon of the Reliant
  }
  else {
    quest::say("I have no need for this, $name.");
  }
}
#EndFile: lakerathe - Turgan.pl (51092)