#BeginFile: abysmal\Magus_Pellen.pl

sub EVENT_SAY {
      if($text=~/hail/i) {
		quest::say("I can provide you with travel to [Natimbi] and [Nedaria]'s Landing with our Farstone magic. Just tell me where you'd like to go and I shall send you.");
      } elsif($text=~/nedaria/i) {
        quest::emote("begins to cast a spell.");
        quest::selfcast(4580); #Teleport Nedaria
      } elsif($text=~/natimbi/i) {
        quest::emote("begins to cast a spell.");
        quest::selfcast(4963); #Natimbi Gate
      }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}

#EndFile: abysmal\Magus_Pellen.pl