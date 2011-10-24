sub EVENT_COMBAT {
	if($combat_state == 1){
		quest::say("Grrrreeeoww!!!  I shall gut you like a fish for your vile ways!!");
	}
}

sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Rrrr.. catching and prrreparing fish is my specialty. Perrrhaps you could fetch for me some [rrrare fish] so that I may demonstrate my skill? Rrrr.");
}
if($text=~/what rrrare fish/i){
quest::say("Rrrr.. my most delectable dish is prrreparrred frrrom rrraw darkwater piranha. Unforrrtunately. the pirrranha only surrrvives in the murrrky waterrrs of the wicked Nektulos forrrest. I will rrreward any brrrave fisherman who can brrring me some rrraw darkwater pirranha."); }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 12318 => 1)) {
    quest::say("Rrrrr... you found the rrrraw fish.  I can now make my favorrrrrite dish.  Herrrrre is a special spearrrrr that will help you to catch morrrrrre of these."); #need proper text
    quest::summonitem(7027);
  }
}
#END of FILE Zone:kerraridge  ID:74075 -- Roary_Fishpouncer 

