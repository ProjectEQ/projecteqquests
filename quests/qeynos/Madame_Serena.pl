# Religion dialogues
sub EVENT_SAY {
   if($text=~/follow/i)
   {
      if($text=~/Bristlebane/i)
      {
         quest::say("To be like the king of thieves is the path on which you stray. Go to Crow's after sundown. It is better than in day.");
      }
      elsif($text=~/Bertoxxulous/i)
      {
         quest::say("The catacombs contain safe haven for you and me. It is our place. To you, I tell no lie.");
      }
      elsif($text=~/Brell/i)
      {
         quest::say("The place of true power is usually beneath your feet. Stay in this city and a rare enemy you just may meet.");
      }
      # responds to cazic or thule or cazic thule. the other thules provoke same response
      elsif($text=~/(?:Cazic|Thule)/i)
      {
         quest::say("You will find an acquaintance who is elvish and dark. Be forewarned that in this city it is best not to bark.");
      }
      elsif($text=~/Innoruuk/i)
      {
         if($faction > 4)
         {
            quest::say("You need to prove your dedication to our cause before I can discuss such matters with you.");
         }
         else
         {
            quest::say("To hate is your way. Just as the father of the dark race. To Nektulos is where you should head at good pace.");
         }
      }
      elsif($text=~/Karana/i)
      {
         quest::say("You will be very safe in this city of thunder. Travel to the catacombs for easy plunder.");
      }
      elsif($text=~/Marr/i)
      {
         if($text=~/Erollisi/i)
         {
            quest::say("To be strong in the ways of love is truly the only way. Go into Karana's Paw and enjoy your day.");
         }
         elsif($text=~/Mithaniel/i)
         {
            quest::say("As is your god you are one of true valor from which you cannot part. Go forth into the catacombs and say hail Mister Bloodheart.");
         }
         else
         {
            quest::say("Which Marr? Come on, work with me here!");
         }
      }
      elsif($text=~/Prexus/i)
      {
         quest::say("He created the Kedge freaks which are now gone from this land. Go deep into the caves of the Jaggedpine and someone will take your hand.");
      }
      elsif($text=~/Quellious/i)
      {
         quest::say("The tranquility and peace of the child lies in your heart. By fighting the opal elves you shall be doing your part.");
      }
      # doesn't matter which ro
      elsif($text=~/Ro/i)
      {
         quest::say("To set foot upon his land would set your body ablaze. Go far north of Freeport to find the eye in days.");
      }
      elsif($text=~/Rodcet Nife/i)
      {
         quest::say("The power of healing is brought forth in your mass. Go past the gates and tell Zutros you are from Highpass.");
      }
      elsif($text=~/Tribunal/i)
      {
         quest::say("You wish to bring the land to justice for all crimes which are unpaid. Start your mission in Freeport, where crime is unafraid.");
      }
      elsif($text=~/Tunare/i)
      {
         quest::say("From the mother of all elves you find comfort and peace. Walk the fields of Karana where troubles shall cease.");
      }
      elsif($text=~/Veeshan/i)
      {
         quest::say("The blood of the mother of all wyrms runs deep in great cities. Be aware that you are not alone in this town of no pity.");
      }
      elsif($text=~/Zek/i)
      {
         quest::say("To die in battle is the true and only way. Go into Blackburrow and join the fray.");
      }
   }
}

# Part of quest for Incandescent Mask
sub EVENT_ITEM {

  # Rune of Fortune (Middle)

  if($gold == 50) {

    quest::say("Fifty gold? You must want a rune of fortune. If you want another one, give fifty gold to Mizr N'Mar in the Neriak library.");
   quest::exp(100); # does give a small but unnoticeable amount of XP
    quest::summonitem(10531);
  }

}

# Quest by mystic414
# Text corrected and dialogue added by BatCountry 
