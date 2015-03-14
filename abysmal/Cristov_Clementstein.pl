# Cristov's Wine
# Created by Gonner

sub EVENT_SAY {
  if ($text=~/hail/i) {
    if(defined($qglobals{chrisredwinea}) && ($qglobals{chrisredwinea} == 1)) {
      quest::say("Why hello there. I see that you are a fellow wine connoisseur like me. I am of course referring to that bottle of Cristiv's Red Wine you have in your possession. That is my aware winning recipe! Did you just arrive aboard the ship? I have been here for a while. I am very [excited].");
    }
    else {
      quest::say("Hello, friend. Nice view from here, wouldn't you say");
    }
  }
  if ($text=~/excited/i) {
    quest::say("You seem like the trustworthy sort. I will let you in on a little secret. I have come up with a great idea! It is a wonderful little contraption that would crush greapes. This would be no ordinary crushing device however. It crushes them with such finesse that the wine it could produce would be very valuable. I have drawn some diagrams for this but the problem is I am not very proficient at building such a thing and I would need some parts to do it. I sure am parched. Hey, if you give me that wine of yours, I will give you the schematics.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 55579 => 1)) { # Cristov's Red Wine
    quest::say("Thank you! This wine will hit the spot. Here are the schematics I made. It looke like we are business partners! I trust you have some knowledge of blacksmithing so you can build my device. Oh, don't worry, you will be compensated for your efforts. Hand me the device if you are able to construct it.");
    quest::summonitem(55582); # Cristov's Schematics
    quest::exp(1000);
  }
  elsif (plugin::check_handin(\%itemcount, 55584 => 1)) { # Grape crushing device
    quest::say("Outstanding! Nice work, my friend. Now we need to see if it works. I have come up with a new recipe I would like to try out. I believe you can just purchase most of the items for the recipe, but the Talomba Berries are something that can only be found on this continent. An adventurer once gave me some and mentioned that he found them somewhere near the city on the continent. See if you can find them. Hand the completed wine to me when you are done.");
    quest::summonitem(55584); # Grape crushing device
    quest::summonitem(55583); # Cristov's New Wine Recipe
    quest::setglobal("chrisredwinea",2,5,"F");
    quest::exp(2000);
  }
  elsif (defined($qglobals{chrisredwinea}) && ($qglobals{chrisredwinea} == 2) && plugin::check_handin(\%itemcount, 55580 => 1)) { # Cristov's Finest Red Wine
    quest::emote("takes a sip of the newly created Wine");
    quest::say("Truly Magical! The best I have ever tasted! I cannot believe it! Thank you so much, my friend! Take this as your reward!");
    quest::summonitem(55581); # Cristov's Corker
    quest::exp(5000);
  }
  plugin::return_items(\%itemcount);
}
#END of FILE zone:abysmal ID:279256 -- Cristov_Clementstein.pl