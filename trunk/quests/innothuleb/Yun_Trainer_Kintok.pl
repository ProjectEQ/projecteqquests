#BeginFile: innothule\Yun_Trainer_Kintok.pl (46071)
#Quest file for Innothule - Yun Trainer Kintok: Guktan Shield Series

       

sub EVENT_SAY {
  my $TrueRace = $client->GetBaseRace();

   #Third Part of Quest
  if(($class eq "Shaman") && ($TrueRace==74 || $TrueRace==330) && plugin::check_hasitem($client, 51108)) { #Froglok Shaman and Old shield check
      if($text=~/hail/i) {
        quest::say("Oh! Hello again $name.  What's that? Oh yes, your shield... I'm sorry $name, but I won't be able to work on it right now.  I am not attuned with the spirits for I fear my [young apprentice] is in grave peril.");
        }   
        if($text=~/young apprentice/i) {
        quest::say("Aye, young Maldok.  He has been under my training since he was just a tad.  Like a son to me, and now I fear he is in [danger]!");
        }
        if($text=~/danger/i) {
        quest::say("I sent Maldok to inquire about a late shipment of alchemy supplies from Qeynos.  They gather their supplies from the forests on Odus and I know the waters between their ports can be quite treacherous. If you would do me the favor and find out what has become of Maldok you would bring much relief to this old frog's worried mind.");
        }
     }
     #Second Part of Quest
  if(($class eq "Shaman") && ($TrueRace==74 || $TrueRace==330) && plugin::check_hasitem($client, 51107)) { #Froglok Shaman and Old shield check
      if($text=~/hail/i) {
        quest::say("Ahh, so you have returned to me with your shield. It appears to have gotten some good use in the recent months. Before I can get to work on your shield, I need a few components. Would you mind [retrieving the components] for me?");
        }   
        if($text=~/retrieving the components/i) {
          quest::say("A brave young initiate, indeed. This task may prove to be a bit daunting, but the items I require are quite rare, and are not available in this section of the world. Return to me with a [chunk of prismatic metal], a [chunk of refined metal], a [shield frame mold], in addition to your Initiates shield, and then I will get to work on rebuilding your shield for you!");
        }
        if($text=~/chunk of prismatic metal/i) {
          quest::say("This particular type of metal is very difficult to come by, and has only ever been reported to me as being found in the caverns of Permafrost. Last I heard, some sort of sage or something had been hoarding it for some sort of an experiment that he was working on. If you can find the sage, you'll find the metal.");
        }
        if($text=~/chunk of refined metal/i) {
          quest::say("The refined material has only ever been found in the depths of Unrest Mansion. It is regretful, but I cannot recall what, or who was guarding this item, but Im sure, if you explored the mansion thoroughly, you would find some.");
        }
        if($text=~/shield frame mold/i) {
          quest::say("Ahh, the mold, yes... Unfortunately, I do not know exactly where one would obtain one of these particularly useful molds. I used to know a smith in Halas, he may have one, you might go speak with him. Tell him that I sent you.");
        }
     }
     #First Part of Quest
  if(($class eq "Shaman") && ($TrueRace==74 || $TrueRace==330)) { #Froglok Shaman check
      if($text=~/hail/i) {
        quest::say("You must be careful out here! There are many dangers in the swamp. I am thankful for my special [shield] that has saved me many times."); #Text made up
        }
        if($text=~/shield/i) {
        quest::say("It's quite simple and surprisingly effective. Bring me some [Stretched Kobold Leather], a [Bundle of Faydark Twigs], a [Bundle of Thicket Twigs], and some [Leathery Twine] and I'll weave you one in a frog's blink. It is the least I can do for a fellow spiritist.");
        }
        if($text=~/stretched kobold leather/i) {
        quest::emote("nods knowingly, 'With a pair of kobold hides and a skinning knife, it is a relatively simple matter for one to make Stretched Kobold Leather.'");
        }
        if($text=~/twigs/i) {
        quest::emote("gasps, 'Oh, I almost forgot! Here you are. Collect four of the twigs and place them into this box to combine them into a full bundle.'");
        quest::summonitem(17394); #Twig Binder
        }
        if($text=~/leathery twine/i) {
        quest::say("For the best twine I've found that the medium quality skin from a bear and a pair of spider silks does the trick. You will need a skinning knife, of course.");
        }
     }
    else {
    quest::say("Hello, $name. I am waiting to speak to someone attuned to the spirits.");
  }
}
       #First Part of Quest

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 51101 => 1, 51105 => 1, 51104 => 1, 51106 => 1)) { #Stretched Kobold Leather, Bundle of Faydark Twigs, Bundle of Thicket Twigs, Leathery Twine
    quest::say("Here you go, just as simple as I said. Take this shield and good luck!"); #Text made up
    quest::summonitem(51107); #Guktan Initiate's Shield
  }

       #Second Part of Quest

  if(plugin::check_handin(\%itemcount, 51113 => 1, 51115 => 1, 51114 => 1, 51107 => 1)) { #chunk of prismatic metal, chunk of refined metal, sheild frame mold, Guktan Initiates Shield
    quest::say("You have proven to be quite a resourceful young initiate! I had not expected to see you again for quite some time. This was definitely not an easy task to complete, by any means' he says, as he begins working on the shield. A few hammer swings, and a jug of water later, he holds the new shield up for inspection. ' Here you are, you've earned it! I replaced the old wooden shield frame with a metal one, it should increase the durability of the shield ten fold. May it serve you well!");
    quest::summonitem(51108); #Guktan Apprentice's Shield
  }

       #Third Part of Quest - Allakhazam doesn't have any of the dialogue on this so I had to make it all up.

  if(plugin::check_handin(\%itemcount, 51120=> 1, 51108)) { #Note to Kintok, Guktan Apprentice's Shield
    quest::emote("reads the note. A glean of happiness creeps across the old frog's face.");
    quest::say("Rrroaaakkk!! Oh thank you $name! I am so relieved knowing my young friend is safe. I owe you greatly for this deed. Let me see now, ah yes I can enchant this sheild to protect you with all the favor of Mithaniel Marr himself!");
    quest::emote("begins to chant as his eye's grow a dark blue.  Suddenly a mystical rune appears on the sheild glowing brightly then fading leaving behind the mark of Marr.");
    quest::say("Here you are $name, your sheild is complete. Thank you again and may the blessings Marr protect you!");
    quest::summonitem(51109); #Guktan Assistant's Shield
  }
    else {
    quest::say("I have no need for this, $name.");
    quest::return_items(\%itemcount);
  }
}

#endfile: innothule\Yun_Trainer_Kintok.pl (46071)