sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Hello. Please leave me be. I am studying several interesting essays on mana storage devices.");
  }
  if($text=~/i wish to speak to you on a matter of the soul/i) {
    quest::say("I haven't heard anyone say that in a while. I am surprised that you want to follow the legacy of Azraxs. Take this book and write down the instructions on how to complete your soul trap and then give the book back to me.");
    quest::summonitem(18956); #Tattered Book
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 18956 => 1)) { #Tattered Book
    quest::say("Here is the first part. Now, go and gather the components from the list. Once your trap is ready, you will know what to do.");
    quest::summonitem(17803); #Soul Trap
  }
  else {
    quest::say("I don't need this.");
    plugin::check_handin(\%itemcount);
  }
}
#END of FILE Zone:paineel  ID:75029 -- Ernax_the_Scholar