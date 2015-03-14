sub EVENT_SAY {
   if ($text=~/hail/i) {
      quest::say("Hello. It is dangerous out in the woods. You should go to Rivervale. It's at the end of the path. You will find good times there. Travel safely, my friend!");
   }
   elsif ($text=~/shard/i) {
      quest::say("Searching for that blasted emerald shard, are you? That thing has done nothing but bring me bad luck!! I would gladly give it to you if you would do a [small favor] for me.");
   }
   elsif ($text=~/small favor/i) {
      if ($faction <= 4) {
         quest::say("I have been tracked here by a bounty hunter named Slaythe. I have heard reports of his presence beyond the Great Wall. Please seek him out and bring me some body part of his as proof of his passing. Do this and the emerald shard is yours.");
         
         $mob = $entity_list->GetMobByNpcTypeID(33146);
         
         if (!$mob) {
            quest::spawn2(33146, 0, 0, 893.00, 664.00, -34.73, 0); # Spawn Slaythe
         }
      }
      elsif ($faction <= 5) {
         quest::say("When the blood of many Runnyeye goblins has covered your blade, then I shall find you worthy to speak of such matters.");
      }
      else {
         quest::say("You are no ally of the Rivervale Deeppockets!! Leave at once!!");
      }
   }
   elsif ($text=~/second piece of the gem/i) {
      if ($faction <= 4) {
         quest::say("The second emerald shard was hidden in the forest near Kelethin. I heard one of the local guilds found it and now call it the Gem of Tunare. You will have to ask around in Kelethin about it. Good luck.");
      }
      elsif ($faction <= 5) {
         quest::say("When the blood of many Runnyeye goblins has covered your blade, then I shall find you worthy to speak of such matters.");
      }
      else {
         quest::say("You are no ally of the Rivervale Deeppockets!! Leave at once!!");
      }
   }
}

sub EVENT_ITEM {
   if (plugin::check_handin(\%itemcount, 13110 => 1 )) { # Bloody Shank
      quest::say("AHH!! You have been sent by the Highkeep Guards!! You will never take Bronin Higginsbot alive!!");
      quest::faction(77, -25); # Deeppockets
      quest::faction(33, -25); # Circle Of Unseen Hands
      quest::faction(218, 25); # Merchants of Rivervale
      quest::faction(48, -25); # Coalition of Tradefolk Underground
      quest::faction(31, -25); # Carson McCabe
      quest::attack($name);
   }
   elsif (($faction <= 4) && (plugin::check_handin(\%itemcount, 12192 => 1 ))) { # Froglok Leg
      quest::say("So I see you have defeated Slaythe. I shall sleep much better now that he is gone. I placed the emerald shard in one of the Highkeep strongboxes in Highpass. Give the bank clerk's assistant, Kiolna this key. There is a [second piece of the gem] which I hid near Kelethin. You will need it to complete the gem. I hope it brings you better luck than I.");
      quest::faction(77, 10);   # Deeppockets
      quest::faction(33, 10);   # Circle Of Unseen Hands
      quest::faction(218, -10); # Merchants of Rivervale
      quest::faction(48, 10);   # Coalition of Tradefolk Underground
      quest::faction(31, 10);   # Carson McCabe
      quest::exp(500);
      quest::summonitem(12193); # H.K. 106
   }
   
   plugin::return_items(\%itemcount);
}
