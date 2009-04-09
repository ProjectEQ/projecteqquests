# Pristine ore samples
#

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Quickly! I need your [help]!");
  }
  if ($text=~/help/i) {
    quest::say("I just received a sample of a new ore mined by the pirates of Broken Skull Rock. Unfortunately, it is not pure enough to conduct the needed experiments. I need several Pristine Ore Samples from within the mines. Are you willing to help me in return for a [favor]?");
  }
  if ($text=~/favor/i) {
    quest::say("Bah! Don't worry. You'll be rewarded well. Take this Sealed Sack and get three samples. Make sure to combine them. I wouldn't want the samples to oxidize like the last ones.");
    quest::summonitem(17711);
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 63008 => 1)) {
    quest::say("Hmm. It LOOKS like the samples survived. I will, however, have to test them. But you've done well I suppose. Here. Take this as payment.");
    quest::summonitem(63049);
  }
}

# EOF zone: steamfont ID: 56129 NPC: Metallurgist_Mirakzin

