# Broken Lute


sub EVENT_SAY {

if($text=~/Hail/i){

   quest::say("Hail!  What do think of [Lisera]?  She aint' much to look at, but soon she will be singing again.");

}

if($text=~/lisera/i){

   quest::say("Lisera is my lute.  She sounds horrible.  I need to get her tuned by a master tuner, but the League's Master Tuner is in the Plains of Karana for a while.  If only..  hey!!  You look like a fellow bard...  You [interested in the job]?");

}

if($text=~/interested in the job/i){

   quest::say("Great!!  Here.  Take Lisera to Vhalen Nostrolo.  He is in the plains near the well, composing.  He must tune it for me.  Be very careful! Lisera is all I've got.  If you complete this task and return with good news. I shall be glad to pass along an extra songsheet for a tune entitled 'Hymn of Restoration.");

quest::summonitem(13114); # Lisera Lute
}

}
sub EVENT_ITEM {

if (plugin::check_handin(\%itemcount,18803 => 1)) { # Note To Cassius

   quest::say("Vhalen does such fine work. I can't wait till he comes back to Qeynos.");
   quest::summonitem(15007); # Song: Hymn of Restoration
   quest::faction(135,5); # Guards of Qeynos
   quest::faction(184,5); # Knights of Truth
   quest::faction(192,5); # League of Antonican Bards
   quest::faction(53,-5); # Corrupt Qeynos Guards
   quest::faction(105,-5); # Freeport Militia
   quest::exp(100);
   quest::ding();
}

}

#END of FILE Zone:qeynos  ID:1057 -- Cassius_Messus.pl
