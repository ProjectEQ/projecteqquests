sub EVENT_SIGNAL {
	if($signal==1) {
		quest::moveto(6,777,66,128,1);
		
	}
	if($signal==2) {
		quest::moveto(4,690,69,128,1);
		
	}
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    # Signal Chamberlain
  }
  if ($text=~/Greetings and good fortune to you, honored Dain Frostreaver IV/i) {
    if ($faction >= 5) {
      quest::emote("seems to stare right into your soul with his one good eye. A chill runs down your spine.");
      # Signal Chamberlain
    }
    elsif ($faction <5 && $faction >= 3) {
      quest::emote("smiles at you and nods his head indicating he has been pleased with your progress.");
      # Signal Chamberlain
    }
    else {
      quest::say("Greetin's and good fortune to yerself, $race. Chamberlain Krystorf speaks highly of the deeds you have performed for our people and so I welcome you to my Keep. I ask you now to take up a most dangerous duty for our people. Would you accept such a challenge from the King of a people not your own?");
    }
  }
  if ($text=~/accept/i) {
    if ($faction < 3) {
      quest::emote("smiles at you with pride and says, 'Something told me you would, $name. For years upon years the plagues of King Tormax have been unleashed upon my people. And indeed it was also by Tormax's hand that me own father, Dain Frostreaver the Third was slain. My attempts at assassinating him have only met with failure, and our forces, while strong, are not yet mighty enough to assault Kael Drakkel. Therefore I have ye and yer companions as my last hope, $name. Kill that bastard who calls himself King Tormax... and bring me his head!");
    }
  }
  if ($text=~/mission/i && plugin::check_hasitem($client, 8898)) {
    # Approved Issue Kit (id:8898)
    quest::say("After General Bragmur has equipped the armor you have created for him, give him these orders. He is a skilled diplomat and will need to reach the pirate Gnomes. We must enter into a pact with them. We will supply them the velium that they need to build their silly gadgets, and they will take their ship back to Antonica and call for reinforcements from out ancestors. We hope they will acceppt this pact, after all Brell has been known to align himself with Bristlebane whom the Gnomes of Iceclad follow. You may be an important [factor] in their success.");
  }
  if ($text=~/factor/i && plugin::check_hasitem($client, 8898)) {
    # Approved Issue Kit (id:8898)
    quest::say("I fear that spies lurk in every corner. You may need to help the General reach the gnomish camp if the Kromrif have gotten word of our efforts. You should call on any allies that you have to assist in case they ambush you. Brell bless you $name, good luck.");
  } 
}

sub EVENT_ITEM {
#Handin for the 9th ring. Needs correct dialogue
  if(plugin::check_handin(\%itemcount, 1500 => 1, 30164 => 1) && ($faction <= 5 || $faction >= 8)) {
    quest::say("%t, you have done a great service to my people. I had not imagined the treachery had run so deeply within our ranks. Here. Take this ring as your reward. From this day forth, you shall be known as the Hero of the Coldain. Take my Dirk as well, and if you wish to further aid us in our cause, then return it to me.");
    quest::summonitem(30369); #9th ring
    quest::summonitem(1465); #dirk of the Dain
    quest::faction(49,50); #coldain
    quest::faction(67,50); #Dain
    quest::faction(188,-50); #Kromrif
    quest::faction(189,-50); #Kromzek
    quest::exp(4000000);
  }
  #Tormax's head
  elsif(plugin::check_handin(\%itemcount, 30516 => 1) && $faction == 1) {
    quest::say("You have done what no Coldain could do, %t! This is indeed a glorious say in our people's history. In return for your invaluable service I present you with the Tri-plated Golden Hackle Hammer. Its magic is powerful and I am sure it will serve you well.");
    quest::ze("Let it be know from this day forth that %t and their companions are Heros of the Coldain Kingdom. King Tormax has been slain, it is a time for celebration. Let no tankard go unfilled!");
    quest::summonitem(30502);
    quest::faction(49,100);
    quest::faction(67,100);
    quest::faction(179,-100);
  }
#Dirk handin for the 10th ring
  elsif(plugin::check_handin(\%itemcount, 1465 => 1) && $faction == 1) {
    quest::say("My good %t, you have served me well. You have flushed out all who sought to oppose me and my people. I am afraid I need to call upon you and your friends one final time. The dissention and treason ran deeper than I had anticipated. Our population has been cleansed, but we lost a full third of our army to the poisonous words of those rebels. In retaliation for your deeds, the Kromrif have made plans to attack us in this, our weakest hour. Can I count on your help outlander?");
    quest::say("Several of our greatest officers, including a few veterans from the war on Yesterwinter are assembling just outside our city. Gather your army at once and give this parchment and the ninth ring to Sentry Badian. I will remain inside the city with a few of my troops to defend it against any who might penetrate your defense. May Brell be with you, %t.");
    quest::summonitem(1567);
  }
  # Runed Coldain Prayer Shawl (7th shawl)
  elsif(plugin::check_handin(\%itemcount, 1199 => 1) || plugin::check_handin(\%itemcount, 8895 => 1)) {
    quest::say("Ah $name. I was hoping to see you. We require your skilled hand. The Armory is overtaxed preparing armor for the war we are preparing to wage on the Kromzek. We need you to help by creating some Field Plate for a mission that is near to execution. Go see Loremaster Solstrin in the Hall of Ancestors, give him these orders. He holds the lore recorded on how to make the field plate. Return to me when you have completed a Standard Issue Kit.");
    quest::summonitem(8895); # Runed Coldain Prayer Shawl (Dain approved)
    quest::summonitem(8896); # Royal Coldain Orders
  }
# Coldain Standard Issue Kit
  elsif(plugin::check_handin(\%itemcount, 8886 => 1)) {
    quest::say("Excellent work $name. If I didn't know I would assume this was made by our most skilled artisans.  You must hurry, General Bragmur has formed camp in Iceclad. Take the kit to the General, he had to drudge forward without any armor. His [mission] must be a success if we hope to successfully defend Thurgadin against the Giants.");
    quest::summonitem(8898); # Approved Issue Kit
    quest::summonitem(8897); # Expedition Orders
  } 
  plugin::return_items(\%itemcount);
}
