#BeginFile: nedaria\Magus_Wenla.pl
#
#

sub EVENT_SAY {
	if($text=~/hail/i) {
		quest::say("Greetings, $name. I can provide travel to other magi in [Butcherblock], [Commonlands], [Everfrost], [North Ro], and [South Ro]. I can also send you to [Natimbi], the shores of Taelosia, or to the Queen of Thorns in [Abysmal Sea]. Just tell me where you'd like to go.");
      } elsif($text=~/butcherblock/i) {
		quest::emote("begins to cast a spell.");
        quest::selfcast(4179); #Teleport Butcherblock
      } elsif($text=~/everfrost/i) {
        quest::emote("begins to cast a spell.");
        quest::selfcast(4180); #Teleport Everfrost
      } elsif($text=~/commonlands/i) {
        quest::emote("begins to cast a spell.");
        quest::selfcast(4176); #Teleport East Commons
      } elsif($text=~/north ro/i) {
        quest::emote("begins to cast a spell.");
        quest::selfcast(4177); #Teleport North Ro
      } elsif($text=~/south ro/i) {
        quest::emote("begins to cast a spell.");
        quest::selfcast(4178); #Teleport South Ro
      } elsif($text=~/natimbi/i) {
        quest::emote("begins to cast a spell.");
        quest::selfcast(4963); #Natimbi Gate
      } elsif($text=~/abysmal sea/i) {
        quest::emote("begins to cast a spell.");
        #quest::selfcast(); #Translocate Abysmal missing???
        quest::movepc(279,0,-199,140); #Abysmal Sea
      }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}

#EndFile: nedaria\Magus_Wenla.pl