################################### 
#Zone: Ak`Anon                    #
#Short Name: akanon               #
#Zone ID: 55                      #
###################################
#NPC Name: Sanfyrd_Featherhead    #
#NPC ID: 55090                    #
#Quest Status: Incomplete         #
#Edit on April 19, 2007 by Kilelen#
#Edit by spre                     #
#for cloak of lesser pernacity    #
###################################

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Greetings! I am the operator of this scrapyard. If you have any scrap metal, I would be glad to purchase it from you in loads of four. The Gemchoppers no longer allow me to accept blackbox fragments and micro servos.");
  }
  if ($text=~/princess joleena/i) {
    quest::say("No!! You cannot have my magic Fairie Wing!! I need it. I read somewhere within the great library that the magic wing from a fairie princess will restore my full head of hair. Look at me!! I am bald!! I have no [friends] at all.");
  }
  if ($text=~/friend/i) {
    quest::say("Oh. You are just saying that so you can get my fairie wing. I will make you a deal. I cannot rely on this wing forever. I will trade it with you if you could get me a case of hair tonic. If you are a true friend you [will fetch the hair tonic] for me.");
  }
  if ($text=~/hair tonic/i) {
    quest::say("Great!! Here you go, my friend. Take this crate and within you shall fill each slot with hair tonic. When all are combined within the crate, return it to me for your wing. I am not sure what the tonic was or where I got it. There is some writing on the crate, but I could not identify it.");
    quest::summonitem(17979);
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 13198 => 4 )) { #Turn in 4 scrap metal
    quest::say("For your efforts I shall reward you"); #Not official dialog, Dont actually know what he says.
    quest::summonitem(quest::ChooseRandom(5013,5013,5013,5014,5014,5014,5015,5015,5015,5016,5016,5016,5019,5019,5019,5020,5020,5020,12340,12340,17033)); # Various rusty weapons, Orb o flight and a contraption given when completed. All randomly.
    quest::exp(1000); #Amount of Experience guessed, No actual Experience Info.
    quest::givecash (4,5,1,1); #Amount of coin recieved is guessed, No actual coin Info.
    quest::faction(115,3);
    quest::faction(176,3);
    quest::faction(210,3);
    quest::faction(71,-3);
    quest::faction(39,-3); 
    quest::ding();
  }
  elsif (plugin::check_handin(\%itemcount, 9426 => 1, 28618 => 1, 29906 => 1, 28165 => 1)) { #Bundle of Super Conductive Wires, Gold Tipped Boar Horn, Shard of Pure Energy, Silicorrosive Grease
    quest::say("I've been waiting for those.  Thank you, please take this!");#Text made up, I have no reference.
    quest::summonitem(15980); #Note for Fimli
  }
  elsif (plugin::check_handin(\%itemcount, 12336 => 1)) {
    quest::say("Huzzah!! You are my friend. Now you can take my old toupee and get it repaired. Just go to Freeport and ask Ping to [repair the toupee]. Hey!! You know what? He is the guy who sells the hair tonic!! I remember now. Well,.. Get my toupee repaired and I will give you the fairie wing.");
    quest::summonitem(12337);
  }
  elsif (plugin::check_handin(\%itemcount, 12254 => 1)) {
    quest::say("Double Huzzah!! You are a good friend $name. Now mayhaps I shall find myself a wife. Here pal, the fairy wing. I hope it can give you a great head of hair. You need it.");
    quest::summonitem(12339);
  }
  elsif(plugin::check_handin(\%itemcount, 13216 => 1, 13217 => 1)) { 
    quest::say("Wow! You took care of those rogue models pretty easily. I bet Drekon told you I'd have a reward, huh? Well it's enough I don't have to worry about those models running around anymore. Here ya go!"); #text not live-like. Need original
    quest::summonitem(quest::chooserandom(17981, 17981, 6027));
    quest::faction(115,3);
    quest::faction(176,3);
    quest::faction(210,3);
    quest::faction(71,-3);
    quest::faction(39,-3); 
    quest::ding();
    quest::exp(1000);
  }
  plugin::return_items(\%itemcount);
}
#Note: The given rare contraption is used for another quest in which you get gems as a reward
#Link for said quest: http://everquest.allakhazam.com/db/quest.html?quest=605
# Allah Info On Him: Sanfyrd is loc at 2021.07, -235.89 across from the Necro / Cleric Guild Enterance. And he does, still take scrap metal 4 at a time.