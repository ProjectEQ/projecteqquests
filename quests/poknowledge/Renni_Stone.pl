#Renni_Stone.pl
#Renni's Rock Collection


sub EVENT_SAY {
  if($text=~/Hail/i) {
    quest::say("Har har, $name! I see yer curious mind has brought ye to what will be the most fabulous and fascinating museum display of them all, the geological exhibit. Behold the [rocks] of Norrath! I'd be most delighted to show them to ye, eh, but I'm afraid it's not quite ready yet, you see. Some pieces of my collection have gone missing and I haven't gone to get replacements yet.");
  }
  if($text=~/rocks/i) {
    quest::say("Eh, let's see. I'm missing a Whirling Crystal, A Scarlet Stone, Icy Geoduck, and A Pulsating Rock. Might ye have these on ye? If ye do, go and get a Collector's Box from [Merri], and put them inside. Close the box and bring it to me. The display will be most grand if ye do!");
  }
  if($text=~/Merri/i) {
  	quest::say("Curator Merri is the founder of the museum in the Selia district of New Tanaan. She is a true visionary and a wonderful person as well. It is her dream to turn life's love into something truly grand. She also carries with her the Collector's Boxes. If you need one, be sure to ask her for it.");
  }#Text taken from Holly Longtail's related quest.  It's out of character coming from this guy, but there's no reference on alla's.
}
    
sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 28077 => 1)) {#Collection of Gems
    quest::emote("opens the box carefully and inspects the contents.  'These will do.  Thank ye.  Take this as a reward.'");#Text made up, no reference
    quest::summonitem(28235);#Fine Antique Pelisse
  }
  else {
   quest::say("I don't need this."); #text made up
   plugin::return_items(\%itemcount);
   return 1;
  }    
}#END of FILE Zone:poknowledge  ID:202018 -- Renni_Stone 

