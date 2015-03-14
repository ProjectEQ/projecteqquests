# Earring of Veracity #1 (Insignia)
# Sanctus Seru : torsten reidan
# Marus Seru : reothe
# Netherbian Lair : Legionnaire Dalini, spawned Bregun Dorey


sub EVENT_SAY{
  if ($text=~/Where is Bregun Dorey/i) {
    quest::say("Bregun Dorey... I have not heard that name in many years. I will never forget it. He was very unique, always running around with an odd metal hat on. He swore that it would keep out the mind probing magics of the Question. I know where he was last seen, and I will tell you if you help by getting us some [supplies].");
  }
  if ($text=~/what supplies/i) {
    quest::say("Get me two Bark Potions, a Spring Crystal, and a Harvest Crystal. I will tell you where I last saw him headed. If you buy them in Sanctus Seru do not tell them you are giving aid to the Recuso or you shall be prosecuted as well.");
  }
}

sub EVENT_ITEM{
  # Bark potion x2, spring crystal x1, harvest crystal x1
  if (plugin::check_handin(\%itemcount,14519=>2,14512=>1,14511=>1)) {
    quest::say("This is great! We can treat our injured and have something to eat for weeks. I can vaguely recall Bregun heading towards the Lair of the Netherbians. You might ask a guard there if they have seen him.");
    quest::exp(40000);
  }
  
  plugin::return_items(\%itemcount);
}

