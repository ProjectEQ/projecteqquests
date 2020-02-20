sub EVENT_SAY {
  if ($faction<=3) {
    if ($text=~/hail/i) {
      quest::say("Greetings, Traveler. I do not receive many visitors to my quarters here, besides the occasional unfortunate treasure seeker that often will make for a good snack.");
    }
    if ($CircletFalinkan=="1") { # we did the part with Karkador
      if ($text=~/kardakor.*sent.*me/i) {
        quest::say("You are sent from Kardakor are you? Well surely he must have sent you to stand before me for a reason.");
      }
      if ($text=~/talisman.*identif/i) {
        quest::say("Ah of course, It has been quite a long time sense my powers of identification have been requested. If you are sent from Kardakor then your intent must be well directed. I do have a favor to ask of you before I identify your talisman. I seek some rare treasures to further some studies that I have been working on for a long time.");
      }
      if ($text=~/rare.*treasures/i) {
        quest::say("There are 3 items that I seek to continue my studies of some various and musterious magics. Bring to me the teachings of a high ranking Kromzek that I hear goes by the name of Gkrean, a chipped fang from a beast deep within the Cursed Necropolis. Also for good measure, I require the Head of a Kromzek Staff Sergeant to prove to your dedication to our cause. Present these 3 items to me along with your Talisman that you wish to learn more about and I shall do my best to identify its origin for you.");
      }
    }
  }
}

sub EVENT_ITEM {
  if ($faction<=3) {
 
    if ($CircletFalinkan=="1") {

      # 1861 : An old worn Talisman
      # 1864 : Teaching of Gkrean
      # 1865 : Head of Staff Sergeant Drioc
      # 1863 : A chipped fang
      if (plugin::check_handin(\%itemcount,1861=>1,1864=>1,1865=>1,1863=>1)) {
        quest::say("I had faith I would see you again. Your dedication to aiding me in my studies is quite noteworthy. As I promised I would earlier, I have identified this talisman; it belonged once to Faliana. You may have heard of Faliana before, for she was the mate of Ralgyn, a well respected wurm noble of our Lord Yelinak. However it was last carried by Glanitar, the son of Ralgyn, who we have not seen for some time. To see this weathered trinket, I fear the worst for young Glanitar, however, his father must know that this was found. Please take this to him and, again, I thank you for your assistance in our time of need.");
        quest::summonitem(1866); # 1866  Glanitar's Imbued Talisman
        quest::faction(436,12); # Yelinak
        quest::faction(430,50); # Claws of Veeshan
        quest::faction(448,-24); # Kromzek
        quest::exp(100000);
        quest::targlobal("CircletFalinkan","2","Y1",114002,$charid,114); # sets the global to 2 for Ralgyn in skyshrine
        quest::depop_withtimer();
      }

      # 1861 : An old worn Talisman (alone, you gave him for identification)
      elsif (plugin::check_handin(\%itemcount,1861=>1)) {
        quest::say("It would be my guess that you present this to me in hopes of finding out more about the magics it possesses. Before I can do this I require some rare treasures that you must present to me.");
        quest::summonitem(1861); # you get it back
      }
    }
  }
  plugin::return_items(\%itemcount); # return unused items
}

#End of File, Zone:wakening  NPC:119104 -- Rolandal

