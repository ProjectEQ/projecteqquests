#cleric dude
#npc - Nyrien Lyrdarniel
#zone - Dagnors Cauldron

sub EVENT_SAY {
   if ($text=~/hail/i) {
      if ($faction <= 7) {
         quest::say("Greetings, my friend! You may rest here if you like. There are many dangers in this land. May Tunare watch over you when you depart our camp.");
         quest::signal(70007, 5);
      }
      else {
         quest::say("You have some nerve to approach a loyal member of the Paladins of Tunare! Run, while you can!");
      }
   }
   elsif ($text=~/need to be healed/i) {
      if ($faction <= 7) {
         quest::say("I see. Then sit and rest a while. I must conserve my strength for our own interests. When you are ready to leave, go and ask Sigan to [escort you to the pass]. There, you can leave this dangerous land.");
      }
      else {
         quest::say("You have some nerve to approach a loyal member of the Paladins of Tunare! Run, while you can!");
      }
   }
   
}

sub EVENT_SIGNAL {
   quest::say("Leave our new friend alone, Ghilanbiddle.  He is quite welcome to rest amongst us.");
}
