# Inert Potion

sub EVENT_SAY {

   if ($text=~/Hail/i) {

   quest::say("Greetings $name, any potions with you today?");
   }

}

sub EVENT_ITEM {

   if (plugin::check_handin(\%itemcount,13983=>1)) {
      quest::say("Ha!! What a fool!! I have stolen another potion to add to the crate. I shall make a fortune!! The real Slansin is in back. Now it is time for me to leave.");

      # quest::faction(Not_Found,10); # +Tradefolk Underground
      quest::faction(48,10); # +Coalition of Tradefolk Underground
      quest::faction(60,10); # +Crimson hands
      quest::faction(31,10); # +Carson McCabe
      quest::faction(53,10); # +Corrupt Qeynos Guards
      quest::faction(105,5); # +Freeport Militia
      quest::faction(145,-10); # -High Council of Erudin
      quest::faction(147,-10); # -High Guard of Erudin
      quest::exp(300);
   
   }

}

#END of FILE Zone:erudnint  ID:23001 -- Slansin