sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Alas, my mood is melancholy, friend. Speak your business so I may continue to [" . quest::saylink("wallow") . "].");
  }
  if ($text=~/wallow/i) {
    quest::say("Tis a long story, but I suppose airing my quandary might aid me.  My heart has been besieged by a beautiful drakkin.  Her name is Kamilah and the image of her in my mind drives me to great distraction. I'm meant to be the guard captain of this great city and I find I'm getting distracted. And while I would cut down any enemy without any hesitation I can't find the courage to tell her how I feel!  Hm, you seem fairly brazen, perhaps you might [" . quest::saylink("help") . "] me.");
  }
  if ($text=~/help/i) {
    #You have been assigned the task 'Love in the Air: Guard's Fancy'
    quest::say("Kamilah is a jeweler in Artisan's Row on the second level of Crescent Reach. You will no doubt recognize her beauty very easily.  I've been saving this gift for her until I had the courage to hand it to her.  Take this to her and tell her it is from me!  Oh how my spirits have been lifted!");
    quest::summonitem(85089); #Wild Crescent Rose
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}