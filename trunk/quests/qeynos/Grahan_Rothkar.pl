
# begin -- quests/qeynos/Grahan_Rothkar.pl

#NPC: Grahan_Rothkar   Zone: qeynos
#Quest: Escaped Catman / Hero Bracers
#by Qadar

#Quest: Steel Warrior Initiation
#by BatCountry

sub EVENT_SAY {
  if($text=~/Hail/i){
    quest::say("Hail, $name! What business do you have in the pens of the Qeynos Arena? Have you a report of the [escaped catman]?");
  }

  if($text=~/escaped catman/i){
    quest::say("We had a catman imprisoned here for use in future gladiator battles. He escaped. In the process, he bit off my assistant's hand which held the key to pen number seven. I now seek to hire a warrior to [retrieve key seven].");
  }

  if($text=~/retrieve key seven/i){
    quest::say("Hmmm. You seem a bit young, but I shall give you a chance. Seek out the catman named Nomala. He most likely returned to [Kerra Isle]. He is not very powerful, but his people are surely watching over him. Retrieve the key for me and be rewarded.");
  }

  if($text=~/kerra isle/i){
    quest::say("Kerra Isle is a dangerous place. The Kerra are not a friendly race. There is an island between Erudin and Qeynos which is inhabited by a more docile tribe of Kerra. I hear they took some of their Kerra beetles along with them to the island, too.");
  }

  if($text=~/second escaped gladiator/i){
    quest::say("It appears our prize gladiator has escaped. He is a minotaur hero!! Trained by our best. He took down five of our greatest warriors during his escape. Rumor has it he fled to his homeland in the Steamfont Mountains. They say he is an outcast and does not live with his people. He appears during times of great need to champion the minotaurs. Return his shackles to me and glory is yours!!");
  }
}

sub EVENT_ITEM {
   if(plugin::check_handin(\%itemcount, 20031 => 1)){
      quest::say("I thank you. I must admit I had my doubts, but you have proven yourself a true warrior. I salute you. You can be of some assistance to me.It see ms as though there has been a [second escaped gladiator] and I have a reward waiting for a human warrior.");
      quest::faction(311,15);     # Steel Warriors better
      quest::faction(135,15);     # Guards of Qeynos better
      quest::faction(53,-15);     # Corrupt Qeynos Guards worse
      quest::faction(105,-15);    # Freeport Militia worse
      quest::faction(184,15);     # Knights of Truth better
      quest::ding
      quest::exp(10000);
      quest::summonitem(5033);                       
      quest::givecash(0,0,0,2);
   }

   if(plugin::check_handin(\%itemcount, 12188 => 1)){
      quest::say("You are a true Steel Warrior!! Now you shall wear my hero bracers. I designed them for my greatest gladiators and you have shown yourself mighty enough to wear them.");
      quest::faction(311,15);     # Steel Warriors better
      quest::faction(135,15);     # Guards of Qeynos better
      quest::faction(53,-15);     # Corrupt Qeynos Guards worse
      quest::faction(105,-15);    # Freeport Militia worse
      quest::faction(184,15);     # Knights of Truth better
      quest::exp(10000);
      quest::ding
      quest::summonitem(12189);                       
      quest::givecash(0,0,0,2);
   }

   if(plugin::check_handin(\%itemcount, 18894 => 1)){ # npc likes you, you've given him A Sealed Letter
      quest::say("So you are ready to encounter your final test. I wish you well, young warrior. Take this key to the pen on the left along the wall with three doors. There you shall meet your final challenge. Return with proof of victory. Exit before it is at an end and I shall not help you.");
      
      quest::unique_spawn(1303,0,0,-520,-120,-24.5);
      #depop in 10 minutes... it's a 6th level mob a few feet away. kill it faster next time
      quest::settimer(86,60 * 10);
      quest::summonitem(20029); # Pen Key #5
      quest::exp(2000);
   }

   if(plugin::check_handin(\%itemcount, 13398 => 1)){ #npc likes you, Arena Lion Skin
      quest::say("I salute you. You have done well and crossed into the brotherhood of the Steel Warriors. Welcome. Take this. It is the mark of a Steel Warrior. Live the way of the warrior.");
      
      quest::faction(311,50);     # Steel Warriors better - biggish faction boost, after all, you've just joined the brotherhood.
      quest::faction(135,15);     # Guards of Qeynos better
      quest::faction(53,-15);     # Corrupt Qeynos Guards worse
      quest::faction(105,-15);    # Freeport Militia worse
      quest::faction(184,15);     # Knights of Truth better
      quest::ding
      quest::summonitem(13229); #steel warrior bracer AC3 AGI1
      quest::exp(8000);
   }

   #do all other handins first with plugin, then let it do disciplines
   plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
   plugin::return_items(\%itemcount);
}

sub EVENT_TIMER {
   if($timer == 86)
   {
      quest::depopall(12051);
   }
}

# end -- quests/qeynos/Grahan_Rothkar.pl 