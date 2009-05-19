sub EVENT_SAY { 
  if($text=~/hail/i) {
    quest::say("Hello, $name. Rueppy's my name. Why don't you buy us something to [drink] and we can talk?");
  }
  if($text=~/drink/i) {
    quest::say("How about a short beer? That sounds good.");
  }
  if($text=~/blackburrow stout/i) {
    quest::say("Oh, well we can't get that here. However, you can always [smuggle] it in...");
  }
  if($text=~/smuggle/i) {
    quest::say("Well, that depends. Do you want a [job]?");
  }
  if($text=~/job/i) {
    quest::say("Should you choose to accept, you have to go to the ruins on the other side of the great wall, find Gunrich, and tell him that [Dark Rivers Flow East].");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 13032 => 1)) { #Short Beer
    quest::say("Mmm. It's good, but not as good as [Blackburrow Stout].");
    quest::exp(100);
    quest::givecash(5,0,0,0); #Copper x 5
  }
  elsif(plugin::check_handin(\%itemcount, 13131 => 1)) { #Case of Blackburrow Stout
    quest::say("Ahhh, that hit the spot! Nice work, $name. Take this as a reward.");
    quest::exp(5000);
    quest::givecash(5,1,1,2); #Copper x 5, Silver x 1, Gold x 1, Platinum x 2
  }
  else {
    #do all other handins first with plugin, then let it do disciplines
    plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:rivervale  ID:19064 -- Rueppy_Kutpurse