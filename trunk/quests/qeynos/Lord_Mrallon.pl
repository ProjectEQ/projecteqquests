# Lord Mrallon
# Crown of the Tempest Guard Quest

sub EVENT_SAY {
 if ($faction <= 2) {
   if ($text=~/tale/i) {
      quest::say("Nyrein Shadowstorm spent much of her life defending the Jaggedpine from within its confines. However, duty would sometimes deem that she trek beyond the forests to assure its protection. In the peak years of her life, she spent much time wandering the whole of Norrath in pursuit of one villain that had betrayed the entire order. We are not certain why or how this one, who at one time was Nyrein's most trusted of companions and second to only her within the order, fell to the temptations and corruption of The Faceless -- but we do know that Nyrein defeated him on the battlefield. He fled to the Plane of Fear and with him went the very essence of the Tempest Guard that remains caged within his corrupted, violent spirit. Find the Tempest Reaver and retrieve the Essence of the Tempest Guard, which you must then seal within the Hollowed Tempest Stone to create the Tempest's Guard Stone. Once you have this sacred stone, return it to Lady Deira.");
   }
  }
}

sub EVENT_ITEM {
 if ($faction <= 2) {
   if (plugin::check_handin(\%itemcount, 8919 => 1, 8951 => 1)) {
   quest::say("Aaaah, yet another warrior brave enough to face their own faults and honorable enough to strive for a proof of their worth and devotion to The Rainkeeper. Your kind is too few and far too rare, but do not think that your trials are at their end. I have forged the necessary Hollowed Tempest Stone -- yes, young warrior, I am indeed one well versed in the ways of the Tempest Guard for at one time I myself held such a rank in a time before the closing of the Jaggedpine. Aaaah, but enough reminiscing for one day -- your trial is the matter at hand. Within the Hollowed Tempest Stone you must combine the Essence of the Tempest Guard, which you will find only through great peril. The Tempest Reaver, who resides in the realm of Cazic-Thule himself, holds the essence. The [tale] regarding its presence there is indeed one to be heard if you wish to fully understand your task.");
      quest::summonitem(8955); #Hollowed Tempest Stone
      quest::faction(183,50); #Knights of Thunder
      quest::faction(21,-50); #Bloodsabers
      quest::faction(257,50); #Priests of Life
      quest::faction(135,50); #Guards of Qeynos
      quest::exp(1000);
   }
 }
 plugin::return_items(\%itemcount);
}