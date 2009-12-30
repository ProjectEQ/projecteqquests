sub EVENT_SAY {
   if(quest::istaskactivityactive(159,4) && $text=~/hail/i) {
       quest::emote("beams a bright smile at you, one that softens his usually dour face dramatically.");
       quest::say("May Tunare bless you, friend. I can no longer keep you here. Certainly you too wish to get back out under the sun and see the new land. Your help has allowed me much freedon and for that I thank you. Look at this compound. using it when you work with the Chunks of Taelosian Rock and the Chunks of Discordian Rock will allow you to work them into the shapes you desire.");
       quest::emote("The smell of the liquid leads you to understand what he has given you. You will be able to incorporate that material into all of your fletching kits and work with this new stone easily. In fact, you believe that in time you can improve on the compound and get better results.");
       quest::updatetaskactivity(159,4); 
       }
elsif(quest::istaskactivityactive(173,4) && $text=~/hail/i) {
       quest::emote("beams a bright smile at you, one that softens his usually dour face dramatically.");
       quest::say("May Tunare bless you, friend. I can no longer keep you here. Certainly you too wish to get back out under the sun and see the new land. Your help has allowed me much freedon and for that I thank you. Look at this compound. using it when you work with the Chunks of Taelosian Rock and the Chunks of Discordian Rock will allow you to work them into the shapes you desire.");
       quest::emote("The smell of the liquid leads you to understand what he has given you. You will be able to incorporate that material into all of your fletching kits and work with this new stone easily. In fact, you believe that in time you can improve on the compound and get better results.");
       quest::updatetaskactivity(173,4); 
       }

elsif ($text=~/hail/i) {
    quest::say("Welcome $name, Tunare smiles upon us all. I don't want to inpose, I know that we are all very busy, but if you have the time and inclination, I could use your help finishing some [tasks] that have been overwhelming me.");
  }
  if ($text=~/tasks/i) {
    quest::say("As you may know, many of our scouts have been lost. That has not kept us from trying to explore, but to do so we need supplies. We also must keep those that stay behind stocked with weapons to use in our defense. This has kept me in here working on those supplies and has prevented me from getting our to see the new lands. A dwarf brought me back some strange stones from Taelosia and it's made me want to go out and explore with all my heart. The stone has a magical properties too. If treated properly, it can be used much like flint to make some of the sharpest arrowheads I've ever come across. If you could [aid] me with some of the simple tasks, I might be able to do more work with the [Taelosian Stone].");
  }
  if ($text=~/taelosian stone/i) {
    quest::say("Truly unusual material. I suspect that there has been some long-term unnatural stress on it. If handled one way, it can be ground to power relitively easily, but with some clever manipulation it can be sheared to make very fine edges. It also seems to hold some magical potential, though. I just haven't had time to explore that possibility. If you come across a Chunk of Taelosian Rock, please bring to me. I'll treat it for you at the cost of keeping a small portion of the treated stone for myself.");
  }
  if ($text=~/aid/i) {
    quest::say("You are as welcome here as a shade tree in the Desert of Ro, friend. I and others have created the [components] needed to make arrows for the Wayfarers. I would be grateful if you could do the final assembly for me. Just take a Wayfarer Arrowhead, a Wayfarer Shaft, and a Wayfarer Fletching and combine them in your fletching kit. There are many chores that need to be completed. If you assist me with them I might be willing to share with you the secret for treating the Chunks of Taelosian Rock to create the useful Taelosian Stones. When you have those arrows finished, please bring them right back to me and I will make certain that they get to those that need them.");
    quest::taskselector(159);
      }
 if(quest::istaskactivityactive(159,0) && $text=~/components/i) {
      quest::summonitem(58173,20);
      quest::summonitem(58207,20);
      quest::summonitem(58186,20);
}
 if(quest::istaskactivityactive(159,1) && $text=~/components/i) {
    quest::say("Hail, Traveler. Thank you for taking the time to help me. I have several bow staves and stings that need to be assembled. A simple enough task, but time consuming. All you need to do is place the Wayfarer Bow Staff and the Wayfarer Bow String into your fletching kit and combine them. These bows will be needed soon, so please bring them directly to me when you have them assembled.");
    quest::summonitem(58179,20);
    quest::summonitem(58178,20);
    }
  if(quest::istaskactivityactive(159,2) && $text=~/components/i) {
     quest::say("Like warm fire on a chill northern eve, you are welcome. We have run low on bow staves. New wood has been hard to find, but we have several staves that van be repaired with some careful work. Place a Scavenged Bow Staff and a Wayfarer Honing Stone into your fletching kit and combine them. The stones are not the best quality, and will be worthless by the time you fix a single staff, but stone is not difficult to find. When you have repaired the staves, bring them to me so I can get someone to assemble them into bows for use.");
     quest::summonitem(58077,20);
     quest::summonitem(58191,20);
     }
 if(quest::istaskactivityactive(159,3) && $text=~/components/i) {
    quest::say("You are the stars on a clear night. I am grateful to you for your assistance. We have several ill-prepared or damaged arrowheads that we would like to repair and put into service. All resources must be watched carefully. Please take a Salvaged Arrowhead and a Wayfarer Honing Stone and combine them in your fletching kit. Some of these are badly damaged, but I think you have the skill to repair them. Bring them to me when you are done.");
    quest::summonitem(58191,20);
    quest::summonitem(58072,20);
    }
    }
    
sub EVENT_ITEM {
 if (plugin::check_handin(\%itemcount, 58030 =>1 )) {
   quest::summonitem(58151,2);
 }
 plugin::return_items(\%itemcount); 
}