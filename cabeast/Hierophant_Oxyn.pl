#Hierophant Oxyn is for the Greenmist quest and is part of the eighth and final quest in the series. He also gives out the Cursed Wafer quest and shaman skullcaps 1 and 2.

#Please note a bare minimum has been done for the shaman quests that Hierophant Oxyn gives, as I was only concerned with the Greenmist quest.

sub EVENT_SAY {
  #Cursed Wafers Event_Say
  if($text=~/hail/i) {
    quest::say("Greetings, and may the pain of the ancients guide you. You have come to us for guidance, have you not? We are the Hierophants of Cabilis and we guide the young Scale Mystics. All petitioners shall speak with me of [temple tasks].");
  }
  elsif(($text=~/temple tasks/i) && ($faction <= 5) && ($class == "Shaman")) {
    quest::say("The Temple of Terror requires all young Scaled Mystics to [perform daily tasks.]. The tasks are necessary to the upkeep of our order as well as that of our brothers, the Crusaders of Greenmist.");
  }
  elsif(($text=~/daily tasks/i) && ($faction <= 5) && ($class == "Shaman")) {
    quest::say("We require many components for various rituals. Take this Component mortar and fill it with the following items - foraged [mud crabs]. two small mosquito wings and one portion of bone chips. You must then use the pestle and combine all the components. When you have a full component mortar, you may return to me and I shall pay you your wages, but most importantly, you shall prove your devotion to the Scaled Mystics.");
    quest::summonitem(17020); #give the player the combine box: Component Mortar
  }
  elsif($text=~/mud crabs/i) { #Cursed Wafers quest
    quest::say("Mud crabs are tiny crustaceans which live along the mudcaked shores of the Lake of Ill Omen. You can forage for them and find a handful of them at a time.");
  }

  #Shaman Skull Quest No.1 Event_Say
  elsif(($text=~/lost skulls/i) && ($faction <= 5) && ($shmskullquest >= 1)) {
    quest::say("You must have heard of the Trilac Brotherhoods disappearance. They are the skulls of three soon to be ancients. They were taken from this temple by a silent intruder. Crusaders are always on duty. I do not know how they got into our vault. Every petitioner is ordered to search for the three skulls and return them to me along with their petitioner cudgel and then they shall become clairvoyants.");
  }
  elsif(($text=~/iron cudgel/i) && ($faction <= 5) && ($shmskullquest >= 1)) {
    quest::say("If you are looking to be handed the Iron Cudgel of the Clairvoyant then you are sadly mistaken. Perhaps if you were to gather a few [lost skulls] for the temple we may find you worthy to wield one.");
  }

  #Shaman Skull Quest No.2 Event_Say
  elsif(($text=~/other skulls/i) && ($faction <= 5) && ($shmskullquest >= 2)) {
    quest::say("A couple of rogue mystics have taken two skulls from another one of our temples. They could not have gone far, but i fear that one of the skulls was [damaged] in their escape.");
  }
  elsif(($text=~/damaged/i) && ($faction <= 5) && ($shmskullquest >= 2)) {
    quest::say("A guard had managed to attack one of the mystics, but hit the bag carrying the skull.  I fear that the skull has been damaged, but it can be repaired.  Acquire it's pieces and some Mendglow clay to put it back together.");
  }
  elsif($text=~/liquid/i) { #Crusaders of Greenmist (Greenmist Quest 8/8)
    quest::say("The bottle contains deklium in a liquid solution. The metal of prophecy has been determined to rest in a mass of living earth. Our scholars have written of a mass of ore that fell from the heavens. This ore was used in the creation of a blade of our father, Rile. We have been filled with visions of this blade. I have seen it in the hands of our Crusaders as they march towards the new age of Greenmist! Seek out the corrupted earth that guards the interlopers. We have an alchemist near there. He will be able to use the deklium to determine which golem contains the metal. Take care to go in force. I sense that there will be a battle.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 3895=>1)) { #Crusaders of Greenmist (Greenmist Quest 8/8)
    quest::emote("takes the note and begins to howl into the air! 'The visions are true! The new prophecy begins today, Crusader,' the mystic growls with pleasure. He quickly turns and takes a bottle of murky liquid from one of his potion bags and hands it to you. 'Take this and keep it safe. Our visions have told of this day. We have been able to learn of the metal of prophecy. This [liquid] will help us to locate its true resting place!");
    quest::summonitem(3892);
    quest::exp(5000);
    quest::ding();
    quest::faction(62,20);
    quest::faction(193,10);
  }
  elsif(plugin::check_handin(\%itemcount, 3886=>1)) { #Crusaders of Greenmist (Greenmist Quest 8/8)
    quest::emote("holds the ore in his hands and begins to chant. His eyes go white as he raises the chunk of ore above his head. He lowers his arms and shakes his head for a moment. His eyes return to their normal state as they focus on you. The shaman hands you the ore and says, 'Seek out the creator of Rile's blade. He is still on this plane. I have felt his torment. Take this note to Librarian Zimor. He learned a great deal from the tome and can instruct you further.'");
    quest::summonitem(3886);
    quest::summonitem(3893);
    quest::exp(5000);
    quest::ding();
    quest::faction(62,20);
    quest::faction(193,10);
  }
  #Cursed Wafers turn in
  elsif(plugin::check_handin(\%itemcount, 12403 => 1) && ($class == "Shaman")) { #Full Component Mortar
    quest::say("We appreciate your service. Take a few copper for your deed as well as some of our cursed waters. They will provide you with nourishment. As for future tasks, we are searching for a few [lost skulls] and i am sure you are searching for your [iron cudgel of the clairvoyant] And i also hear that the furscales are in need of some broodlings to do some manual labor. Tell them Oxyn sent you.");
    quest::setglobal("shmskullquest",1,5,"F"); #set a global flag so that user can do shm skull quest
    quest::faction(282, 10); #Scaled Mystics
    quest::faction(193, 10); #Legion of Cabilis
    quest::summonitem(12406, 2); #Cursed Wafers
  }
  #Shaman Skull Quest No.1 turn in - Check for  Logrin Skull, Morgl Skull, and Waz Skull hand in along with Iron Cudgel of the Petitioner
  elsif((plugin::check_handin(\%itemcount, 12721 => 1, 12722 => 1, 12723 => 1, 5140 => 1)) && ($faction <= 5) && ($shmskullquest >= 1)) {
    quest::say("Excellent, you have retrieved the three skulls of the ancients for us.  There are yet mroe skulls that I must ask you to retrieve before I can assist you in furthering your progress to becoming a clairvoyant. I will tell you with whom you need to speak to to continue the path of clairvoyance upon bringing me the [other skulls].");
    quest::faction(282, 10); #Scaled Mystics
    quest::faction(193, 10); #Legion of Cabilis
    quest::summonitem(5141); #Iron Cudgel of the Clairvoyant
    quest::exp(2000); #give decent xp...
    quest::givecash (0,0,0,1);
    quest::setglobal("shmskullquest",2,5,"F"); #set a global flag so that user can do shm skull quest part 2
  }
  #shaman skull quest no.2 turn in - check for Skull with I and Skull with II turn in and cudgel
  elsif((plugin::check_handin(\%itemcount, 12724 => 1, 12725 => 1, 5141 => 1)) && ($faction <= 5) && ($shmskullquest >= 1)) {
    quest::say("We are in your debt. You are truly one who shall collect all the lost ancient skulls. Take your weapon. Go to Hierophant Zand and he shall guide you further. Tell him you are [the chosen saviour].");
    quest::faction(282, 10); #Scaled Mystics
    quest::faction(193, 10); #Legion of Cabilis
    quest::exp(60000); #give 2 blues of xp
    quest::givecash (0,0,5,1);
    quest::summonitem(5142); #Iron Cudgel of the Seer
    quest::setglobal("shmskullquest",3,5,"F"); #set a global flag so that user can do shm skull quest part 3
  }
  plugin::return_items(\%itemcount);
}
#Submitted by: Jim Mills