#Holly_Longtail.pl
#Holly Longtail's Replacement Parts


sub EVENT_SAY {
  if($text=~/Hail/i) {
    quest::say("Hello, $name. The preservation of ancestors is a time-honored tradition. It's a task one must handle with painstaking care and precision. Please do not fret for the lives of these specimens. They live in the eternal realm of beauty now. I have quite a large collection of stuffed animals ready to go, but many of them have sustained injuries in their capture. In fact, I wouldn't mind some help to collect some [replacement parts] from creatures around the world.");
  }
  if($text=~/replacement parts/i) {
    quest::say("Grab a Collector's Box from [Merri] before you go. You need to recover an Undead Froglok Tongue, Cockatrice Beak, High Quality Cougarskin, and a Tiny Rockhopper Eye. Seal the box tightly and return it to me. If the contents are in sufficient and usable condition, I may have a reward for you.");
  }
  if($text=~/Merri/i) {
  	quest::say("Curator Merri is the founder of the museum in the Selia district of New Tanaan. She is a true visionary and a wonderful person as well. It is her dream to turn life's love into something truly grand. She also carries with her the Collector's Boxes. If you need one, be sure to ask her for it.");
  }
}
  
  
sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 28076 => 1)) {#Collection of Taxidermy
    quest::emote("opens the box and carefully inspects its contents. 'These will do. Please accept this as a show of my appreciation. Now if you'll excuse me I have much work left to do.");
    quest::summonitem(28237);#Fine Antique Ring
  }
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:poknowledge Holly_Longtail 
