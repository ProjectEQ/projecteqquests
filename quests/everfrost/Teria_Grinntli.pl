#
#Quest: Adventurer's Stone
#
#Selephra Giztral, Barstre Songweaver, Vual Stoutest, Teria Grinntli, or Ruanya Windleaf

sub EVENT_SAY {
  if($ulevel >= 15) {
    if(defined($qglobals{Wayfarer}) && ($qglobals{Wayfarer} == 1)) { #PC has spoken to home town Wayfarer recruiter but not received Adventurer's Stone
      if($text=~/hail/i) {
        quest::say("Welcome stranger. I'm afraid you must answer some questions before I can consider opening our wealth of skill and knowledge to you. First, what does the Wayfarers Brotherhood call the tasks they will ask you to do for them?");
      }
      if($text=~/adventures/i) {
        $client->Message(15, "You have completed a step toward becoming a great adventurer. Well done!");
        quest::say("We will reward based on your improving position with the Wayfarers Brotherhood. We keep a certain type of log that records how often and well you help us. What is it called?");
      }
      if($text=~/favor journal/i) {
        $client->Message(15, "You have completed a step toward becoming a great adventurer. Well done!");
        quest::say("Who discovered that some treasures have strange magical properties by poking one with his dagger?");
      }
      if($text=~/morden rasp/i) {
        $client->Message(15, "You have completed a step toward becoming a great adventurer. Well done!");
        quest::say("Our brilliant magi use a special kind of magic to help teleport us between camps. What is it called?");
      }
      if($text=~/farstone/i) {
        $client->Message(15, "You have completed a step toward becoming a great adventurer. Well done!");
        quest::say("Congratulations! I believe now that you are trustworthy enough to take on some of the adventures the Wayfarers Brotherhood have to give. We will be able to continue with our discussions once you complete some adventures. We can also help you with travel between our camps. Be well, fair $name. I'm sure, someday, you will be a great addition to the Wayfarers Brotherhood.");
        quest::faction(356,50); #Wayfarers Brotherhood
        quest::setglobal("Wayfarer",2,5,"F");
        quest::say("Take this Adventurer Stone with you on your journeys into the dungeons. You will find it useful. Should you lose it somehow, come talk to me and I'll replace it.");
        quest::summonitem(41000); #Adventurer's Stone
        $client->KeyRingAdd(41000);
      }
    }
    elsif(defined($qglobals{Wayfarer}) && ($qglobals{Wayfarer} == 2)) { #PC is ready for Adventurer's Stone
      if(!plugin::check_hasitem($client,41000)) { #PC does not have an Adventurer's Stone
        quest::say("Take this Adventurer Stone with you on your journeys into the dungeons. You will find it useful. Should you lose it somehow, come talk to me and I'll replace it.");
        quest::summonitem(41000); #Adventurer's Stone
      }
      else { #PC has an Adventurer's Stone already
#        quest::say("Hello, $name. How do you like the adventures?"); #Text made up
#lore section
      my $mir_wins = $client->GetLDoNWinsTheme(2);
      if(!defined $qglobals{MIRtalk}) {
         quest::setglobal("MIRtalk",0,5,"F");
      }
      if($mir_wins < 2) {
         # text made up
         quest::say("Cold here, wouldn't you agree?");
      }
      elsif($mir_wins >= 2 && $qglobals{MIRtalk} == 0) {
         # 2 wins - MIRtalk 1
         quest::setglobal("MIRtalk",1,5,"F");
         quest::say("Can you believe it's true? Miragul's Menagerie has been found. I remember all the stories I heard after I came to Norrath from Luclin, but the ones that really captured my attention were those about Miragul. Even though I enjoyed the mystery around the tales, I couldn't be more thrilled to actually set foot in that world of madness. I will share the stories with you.");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($mir_wins >= 4) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
         }
      }
      elsif($mir_wins >= 4 && $qglobals{MIRtalk} == 1) {
         # 4 wins - MIRtalk 2
         quest::setglobal("MIRtalk",2,5,"F");
         quest::emote("purrs as she looks at you with piercing feline eyes. 'It is so wonderful to see you again. I remember hearing that under the tundra of the Frigid Plain there was a network of tunnels and rooms that were known as Miragul's Menagerie. Now that we've found it, it's a far stranger place than the stories suggested. To start at the beginning, I should say that Miragul was once a prominent member of the Council of Erud and was a student of all the schools of magic available there. If you knew that we've got a good starting point to continue our meetings. We'll pick up from there when you return to me.'");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($mir_wins >= 6) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
         }
      }
      elsif($mir_wins >= 6 && $qglobals{MIRtalk} == 2) {
         # 6 wins - MIRtalk 3
         quest::setglobal("MIRtalk",3,5,"F");
         quest::emote("scratches her arm with her claws. 'Grrrrreetings $name. I don't have all the details, but a long time ago, it became evident that Miragul, a master mage, wizard, and enchanter, was not impressed or challenged by the erudite way of life and betrayed his people. His fascination with learning and power led him to steal some of the most prized artifacts and tomes belonging to the erudites. And he wasn't the only erudite that pursued the art of necromancy. We shall discuss that more later, fine friend.'");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($mir_wins >= 8) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
         }
      }
      elsif($mir_wins >= 8 && $qglobals{MIRtalk} == 3) {
         # 8 wins - MIRtalk 4
         quest::setglobal("MIRtalk",4,5,"F");
         quest::emote("ears perk as she hears you approach. 'Over time as Miragul studied, he learned the secrets behind immortality. As the story goes, one fateful night long ago within the menagerie, Miragul performed a most unspeakable ritual upon himself. He lay his body down on a slab etched with the most evil collection of runes. That same portion of stone had a dark crimson hue because it was infused with the blood of many victims that were sacrificed for the performance of that one rite. I have other business to attend to for now, but return soon and we shall continue this bizarre tale.'");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($mir_wins >= 10) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
         }
      }
      elsif($mir_wins >= 10 && $qglobals{MIRtalk} == 4) {
         # 10 wins - MIRtalk 5, MIRpower 1
         quest::setglobal("MIRtalk",5,5,"F");
         quest::setglobal("MIRpower",1,5,"F");
         quest::emote("stops grooming her fur. 'A bit cold isn't it, $name? While Miragul was lying down on that magical slab of stone he started to chant quietly, almost a whispering, until the strange hissing of his voice coalesced into the sound of whipping winds. The room grew dark, so dark that it stole all the light from around the slab of stone. But where Miragul lay, there was a sickly red glow. Terrible event, it was. I will tell you more later my friend.'");
         $client->Message(15, "You have received an invaluable piece of information!");
         $client->Message(15, "Your Adventurer Stone glows with more power as you gain stature with the Wayfarers Brotherhood.");
         if ($mir_wins >= 12) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
         }
      }
      elsif($mir_wins >= 12 && $qglobals{MIRtalk} == 5) {
         # 12 wins - MIRtalk 6
         quest::setglobal("MIRtalk",6,5,"F");
         quest::emote("raises a paw as a warm greeting. 'Welcome once more, $name! Again, the rite of immortality performed by Miragul was so extreme that it shook the ground of all of the Frigid Plain. When Miragul's chant for the undead rite reached its peak, his body disintegrated in a strange fashion. First, his flesh peeled back from the muscle, his muscle tore from the bone, and his bones blackened and crumbled to ash. All was quiet for a short time and then a breeze was conjured out of the stillness. Miragul's ashes were caught in an eddy of evil that began to take a new shape -- the shape of a twisted skeleton. Miragul had successfully transformed himself into a lich. But there was a problem. A critical error. Come back soon and I'll tell you more!'");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($mir_wins >= 14) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
         }
      }
      elsif($mir_wins >= 14 && $qglobals{MIRtalk} == 6) {
         # 14 wins - MIRtalk 7
         quest::setglobal("MIRtalk",7,5,"F");
         quest::say("I spent some time with a good friend of mine, Ubzial Iyeaql, in the Qeynos Hills. He has the whole story about Miragul and is probably better suited to telling you the whole story. I'm certain he would be pleased to share the tale with you. Take care on your journey, friend.");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($mir_wins >= 16) {
            $client->Message(13, "You have additional information to uncover! You must speak to Ubzial Iyeaql to find out more.");
         }
      }
      elsif($mir_wins >= 16 && $qglobals{MIRtalk} == 7) {
         $client->Message(13, "You have additional information to uncover! You must speak to Ubzial Iyeaql to find out more.");
      }
      elsif($mir_wins >= 42 && $qglobals{MIRtalk} == 20) {
         # 42 wins - MIRtalk 21
         quest::setglobal("MIRtalk",21,5,"F");
         quest::emote("purrs as she her gaze rests upon you. 'So nice to see you again, $name. It certainly has been a long time! I understand that Ubzial got as far as Miragul's fear of death? Right. When Miragul started considering the end of his life, he fixed on not being able to learn and see new magic and artifacts. He then turned his pursuit of knowledge toward existential and planar concerns. He read accounts and folklore around the planes of Power and Discord. Then, he found ways to access those planes and created portals for them. Hm, I need to talk to Kipler Steffeal. I've forgotten a few details. Come back and we'll discuss this further!'");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($mir_wins >= 44) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
         }
      }
      elsif($mir_wins >= 44 && $qglobals{MIRtalk} == 21) {
         # 44 wins - MIRtalk 22
         quest::setglobal("MIRtalk",22,5,"F");
         quest::emote("growls lightly as she examines the pads of her paws. 'My paws are numb, $name. It is truly cold here. I did talk to Kipler and he has filled in some details for me. Shortly after creating the portals to the planes of Power and Discord, Miragul's body began to fail him. His frailty terrified him. He became absorbed in the art of necromancy and looked for clues that would allow him to cheat death. He was not successful. That's all I can tell you for now, $name. I need to get more information myself.'");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($mir_wins >= 46) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
         }
      }
      elsif($mir_wins >= 46 && $qglobals{MIRtalk} == 22) {
         # 46 wins - MIRtalk 23
         quest::setglobal("MIRtalk",23,5,"F");
         quest::emote("stretches the length of her graceful feline body. 'Ah! You caught me after a nap! Very well, let's continue. Miragul realized he would have to leave the menagerie to gain more knowledge to overcome the finality of death. He used his knowledge to create portals within Norrath and with what little energy he had, he searched for the necromancers on Odus. He found them in a city they called Paineel and lived among them as he studied. Then he found it . . . magic that could turn the living into the undead, a state where a body lives on and never ages. It is a shame $name, but it's time for me to go. I have to hunt for food for our party. I will have more to enlighten you shortly.'");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($mir_wins >= 48) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
         }
      }
      elsif($mir_wins >= 48 && $qglobals{MIRtalk} == 23) {
         # 48 wins - MIRtalk 24
         quest::setglobal("MIRtalk",24,5,"F");
         quest::emote("has her nose raised to the air and detects your scent. 'Ah, $name! I knew it was you! I was thinking of you recently and your interest in Miragul's Menagerie. I remember my mother telling me that Miragul was in Paineel gathering knowledge on how to make him undead while the heretics around him readied for another war with Erudin. When Miragul believed he had attained enough knowledge, he returned to his menagerie and hid himself in a special laboratory. And that's when he performed that rite I told you about when we first met. But, as I said then, it didn't have the effect he had hoped for. I must be off now, dear $name. I need to go visit Ubzial Iyeaql about some items the Wayfarers Brotherhood recovered from the menagerie.'");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($mir_wins >= 50) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
         }
      }
      elsif($mir_wins >= 50 && $qglobals{MIRtalk} == 24) {
         # 50 wins - MIRtalk 25, MIRpower 5
         quest::setglobal("MIRtalk",25,5,"F");
         quest::setglobal("MIRpower",5,5,"F");
         quest::emote("shivers slightly in the cold. 'We just got back from a hunt and my tail is freezing! We are well stocked with food now, though. Now, in the story about Miragul, we were at the transformation of the magic-user into a lich. Well, that part worked, he did indeed become a lich, but something terrible happened to him. He made a grave miscalculation. The lich of Miragul retained most of his mystical powers, but Miragul's soul was lost. I will be able to explain this better next time. I have to do a bit of research for the next part of the tale.'");
         $client->Message(15, "You have received an invaluable piece of information!");
         $client->Message(15, "Your Adventurer Stone glows with more power as you gain stature with the Wayfarers Brotherhood.");
         if ($mir_wins >= 52) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
         }
      }
      elsif($mir_wins >= 52 && $qglobals{MIRtalk} == 25) {
         # 52 wins - MIRtalk 26
         quest::setglobal("MIRtalk",26,5,"F");
         quest::emote("finishes a conversation with Gizula and turns to you. 'My friend, $name! I found the information for you. After Miragul became a lich, his spirit, the internal voice that drove him to seek knowledge and power, was trapped in a small box, called a phylactery, in the menagerie. The lich, without a spirit, had no traits of the man known as Miragul. His lich wandered aimlessly about the menagerie and then found its way to Everfrost where it has been marching around pathetically and without purpose for many years. But something has changed within the lich recently. We will discuss that later. I need to gather more information on that part of the story.'");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($mir_wins >= 54) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
         }
      }
      elsif($mir_wins >= 54 && $qglobals{MIRtalk} == 26) {
         # 54 wins - MIRtalk 27
         quest::setglobal("MIRtalk",27,5,"F");
         quest::emote("wags her tail, clearly agitated. 'I'm somewhat irritated at the moment, $name. Gizula ate all the stew and now I have to go hungry out in this cold! Petty concern, really, but still . . . Anyway, the lich of Miragul has been heard whispering on the wind lately. The discovery of the menagerie has released some of the strange magic that exists there. The lich can sense it and some say he's been touched by it. I will try to learn more about that. Next time, though, I'll tell you more about the menagerie.'");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($mir_wins >= 56) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
         }
      }
      elsif($mir_wins >= 56 && $qglobals{MIRtalk} == 27) {
         # 56 wins - MIRtalk 28
         quest::setglobal("MIRtalk",28,5,"F");
         quest::emote("expertly polishes her fangs with her tongue. 'Gizula made up for her gluttony. She made us a fine-tasting meal. I dare not ask what was in it, but I am satisfied! We are still a little hazy on what exactly is happening in Miragul's Menagerie, but it seems as though not only his spirit was locked in there. When he turned himself into a lich, there was a rift in his magic, so that some of it was left over. That magic has somehow grown over time and I believe it carries some kind of sentience. I need to do some investigating in the menagerie and then I will be able to tell you more.'");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($mir_wins >= 58) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
         }
      }
      elsif($mir_wins >= 58 && $qglobals{MIRtalk} == 28) {
         # 58 wins - MIRtalk 29
         quest::setglobal("MIRtalk",29,5,"F");
         quest::emote("blinks lazily, clearly tired. 'It has been a long day, dear $name. I have been spending a lot of time in the menagerie trying to ascertain what is happening there. From what we've been able to piece together, that remaining magic left in the menagerie has indeed developed over time. With all of the strange magic and experiments that Miragul performed, there was often some magic left behind. The sentient magical force that formed and grew because of the rite that transformed Miragul into a lich has managed to travel in the walls and on the air collecting all of the remaining magic. We are calling this sentient force the Synarcana of Miragul. Strange thing. I need more information before I can tell you more about it.'");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($mir_wins >= 60) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
         }
      }
      elsif($mir_wins >= 60 && $qglobals{MIRtalk} == 29) {
         # 60 wins - MIRtalk 30, MIRpower 6
         quest::setglobal("MIRtalk",30,5,"F");
         quest::setglobal("MIRpower",6,5,"F");
         quest::emote("waves at you with a mighty paw. 'I'm so thrilled you are back, $name. It does get lonely here at times. So, the Synarcana of Miragul is indeed sentient and very protective of the menagerie. After all, it is the magical force that maintains and protects the integrity of that bizarre place. It has even created or taken over creatures to serve its will. The Synarcana of Miragul has developed some of Miragul's former traits and is attempting to draw knowledge of magic out of all of the adventurers that enter. So, be careful when you enter that place. I will see you after you spend more time there. Hopefully I will have more information for you by then.'");
         $client->Message(15, "You have received an invaluable piece of information!");
         $client->Message(15, "Your Adventurer Stone glows with more power as you gain stature with the Wayfarers Brotherhood.");
         if ($mir_wins >= 62) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
         }
      }
      elsif($mir_wins >= 62 && $qglobals{MIRtalk} == 30) {
         # 62 wins - MIRtalk 31
         quest::setglobal("MIRtalk",31,5,"F");
         quest::emote("scratches behind her ear and her leg twitches. 'Nothing like putting and end to a terrible itch, is there $name? Oh, yes! I have something to tell you. There are different kinds of creatures in the menagerie you should know about. Well, more the odd nature of them. The creatures used to be separated by the ice, but since Miragul's departure many years ago, the menagerie fell into disrepair. While the Synarcana attempts to rebuild, it cannot control the beings that have all been let loose as walls crumbled. It is that fact that has contributed to the madness in the menagerie. Well, I have a meeting with Morden Rasp soon, but I'll be back to talk to you some more soon.'");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($mir_wins >= 64) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
         }
      }
      elsif($mir_wins >= 64 && $qglobals{MIRtalk} == 31) {
         # 64 wins - MIRtalk 32
         quest::setglobal("MIRtalk",32,5,"F");
         quest::emote("repairs a tear in her leather leggings with one of her whiskers threaded through a needle. 'Had a run in with a bone golem, $name. That reminds me. The abominations created by Miragul run among the other creatures that have wandered into the menagerie my mistake. There are also creatures created and motivated by the magic of the Synarcana of Miragul. Then there are creatures that have wandered into the menagerie through the portals he created to various planes of existence. It is this mess of creatures that contributes to the madness of the menagerie. Pardon me, would you? I need to finish up here before we return to do more exploring.'");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($mir_wins >= 66) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
         }
      }
      elsif($mir_wins >= 66 && $qglobals{MIRtalk} == 32) {
         # 66 wins - MIRtalk 33
         quest::setglobal("MIRtalk",33,5,"F");
         quest::emote("licks the blue blood of an ice goblin from her claws. 'Ah yes, $name, I forgot to mention that a tribe of ice goblins has made a home in the menagerie. This tribe reveres the Synarcana of Miragul and its manifestations. I'm not sure how wise that choice is, but goblins aren't exactly known for their intelligence, are they? The goblins have a difficult struggle as they try to survive in the chaos in the menagerie. I'd like to finish this meal, if it's all the same to you. The meat is tough, but reasonably tasty.'");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($mir_wins >= 68) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
         }
      }
      elsif($mir_wins >= 68 && $qglobals{MIRtalk} == 33) {
         # 68 wins - MIRtalk 34, MIRpower 7
         quest::setglobal("MIRtalk",34,5,"F");
         quest::setglobal("MIRpower",7,5,"F");
         quest::emote("bows to you. 'Alas, $name. It seems we're both on the same footing with our knowledge about the madness in Miragul's Menagerie. It has been most satisfying taking this journey with you. I hope as you learn more you will share it with all of us in the Wayfarers Brotherhood. I salute you!'");
         $client->Message(15, "You have received an invaluable piece of information!");
         $client->Message(15, "Your Adventurer Stone glows with more power as you gain stature with the Wayfarers Brotherhood.");
      }
      elsif($mir_wins >= 68 && $qglobals{MIRtalk} == 34) {
         # theme done
         quest::say("I would wager that you know more about those lost dungeons than I do at this stage, $name. I have no more to tell you.");
      }
      else {
         # adventure more message - text made up
         $client->Message(9, "You need to adventure some more in Miragul's Menagerie.");
      }
# end lore section
      }
    }
#    elsif(player_has_maxed_out_stone) { #PC has maxed out stone
#      $client->Message(9, "It's time to acknowledge you as a Wayfarer. Give Chaenz Abella in East Commonlands your Adventurer Stone and he'll replace it with your very own Wayfarers Emblem. Or, if it's being used in a charm, you must remove it to get your new one. And, if you simply destroy the stone, he will replace it with your much-deserved emblem. Just tell him you want your [emblem].");
#      quest::setglobal("Wayfarer",3,5,"F");
#    }
    else { #PC has not talked to hometown Wayfarer recruiter yet
      quest::say("You will have to excuse me, I am quite busy. Maybe you can talk to a Wayfarer in your home town?"); #Text made up
    }
  }
  else {
    quest::say("You will have to excuse me, I am quite busy."); #Text made up
  }
}

sub EVENT_ITEM {
  quest::say("I have no use for this, $name.");
  plugin::return_items(\%itemcount);
}
