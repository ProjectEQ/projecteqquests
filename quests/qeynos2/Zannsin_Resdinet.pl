sub EVENT_SAY {
  if($text=~/hail/i){
    quest::say("Hey..  My name's Zannsin. but you can call me [Zan].");
  }
  if($text=~/men to prak in highpass/i) {
    quest::say("Hmm, I see. Maybe you can help us out with this, $name, huh? I think it'd be a perfect opportunity for you to prove just how valuable you are to our little organization. Take this letter to Prak at Golden Rooster in Highpass, and see what you can do to help him out.");
    quest::summonitem(18795);
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 18028 => 1)) {
    quest::say("You have proven yourself to be very valuable $name. For helping us out please accept this Cloak of the Unseen Hands!");
    quest::summonitem(1048);
  }
  else {
    #do all other handins first with plugin, then let it do disciplines
    plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:qeynos2  ID:2077 -- Zannsin_Resdinet