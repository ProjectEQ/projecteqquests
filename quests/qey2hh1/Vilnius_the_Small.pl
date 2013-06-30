# Rogue Epic NPC -- Vilnius_the_Small
sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("$name, just because I am short don't mean I can't bounce your $race rump all over these hills. Now, do you have something for me, or are you just in search of a rump bouncing?");
  }
  if($text=~/rump/i) {
    quest::say("My pleasure to oblige you then. Shall I start on the left side or the right side?");
    quest::attack($name);
  }
  if($text=~/you/i) {
    quest::say("Vilnius, as I have told you. And yes, I am not as large as most of my kin. But that is a blessing, because my brain is bigger than that of an $race. <grin> I am a Facilitator. I.. facilitate.. jobs. You want something somebody else has, I can arrange for you to have it.. even if that something is their life. That is why I am here now, waiting on something to turn up in my hands before I pass it on to my client. Though I am a bit tired of waiting. My hired help seem to be delayed.");
  }
  if($text=~/malka/i) {
    quest::say("Malka Rale works for me from time to time. One of the best thieves I have ever met, and damn handy with a blade. She is long overdue to meet me here. I'm afraid she may have run into trouble in Qeynos.");
  }
  if($text=~/delayed/i) {
    quest::say("Yes, delayed. She has always been prompt in the past, but she is several days overdue, and I know for a fact she completed the job. I am beginning to wonder if something happened to her. I would go check, but I run the risk of missing her if she shows up here.");
  }
  if($text=~/job/i) {
    quest::say("I need a few more items for a collector. They are rare and valuable, but I will pay you well for your trouble. I need the sword owned by the king of the Frogloks, the sword my distant cousin Karg is so proud of, and the matched set of Painbringer and Fleshripper, held by the kobolds. Return those to me quickly, and we will take it from there, eh?");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 28014 => 1)) { #Stanos' Pouch
    quest::say("Ah, very nice. Very nice indeed. Good work, and I hope Malka is able to make it out, good help is hard to find. But in the meantime, I am without an acquisition expert. Do you want the job?");
    quest::exp(1500);
  }
  if(plugin::check_handin(\%itemcount, 5411 => 1, 5410 => 1, 5401 => 1, 5308 => 1)) { #Fleshripper, Painbringer, Mithril Two-Handed Sword, Gigantic Zweihander
    quest::say("Very good, though how you managed to lug around all these oversized blades amazes me. I feel we can do business now, and Malka still has not shown up. Take this dagger. I had an old client who didn't, um.. pay.. so this was extracted from him. Right after it was inserted in him. For your next job, I need a collection of robes. The Robe of the Ishva, some Shining Metallic robes, an Oracle robe, and a Robe of the Kedge. I am not even sure where all these come from, but they are on my list here, and Rokyl is one of my best clients, so I figure that is your job.");
    quest::summonitem(7506); #Jagged Diamond Dagger
    quest::givecash(0, 0, 100, 20);
    quest::exp(3000);
  }
  if(plugin::check_handin(\%itemcount, 1357 => 1, 1253 => 1, 1354 => 1, 1360 => 1)) { #Robe of the Ishva, Robe of the Kedge, Robe of the Oracle, Shining Mettalic Robes
    quest::say("You do good work, $race. Here is another trinket for your trouble, you should be able to make use of it. Malka still hasn't made it back yet, and I have one more order to fill, if you're willing. This one should be easy. My sword collector has decided he wants rapiers now, of all things. He has asked for an Eyerazzia, a Martune Rapier, a Burning Rapier, and a well balanced rapier.");
    quest::summonitem(7505); #Cazic Quill
    quest::givecash(0, 0, 200, 15);
    quest::exp(3000);
  }
  if(plugin::check_handin(\%itemcount, 7041 => 1, 7509 => 1, 7508 => 1, 7020 => 1)) { #Burning Rapier, Martune Rapier, Eyerazzia, Well-Balanced Rapier
    quest::say("You never cease to amaze me! I never thought you $race types could be so good at this sort of work. I have been stuck here and haven't any more trinkets to give you, but perhaps you could take this pouch to its new owner, since I do not have the time to deliver it myself. He will pay you in full, and you can just keep what he gives you, how does that sound? The owner is a man named Stanos Herkanor, and he or his friend Anson are supposed to meet me in Highpass this evening. Do not waste too much time getting there, he is a secretive man, and I can not guarantee he will be around long. Good luck, and maybe we will meet again. It is always a pleasure working with another professional such as yourself!");
    quest::summonitem(28014); #Stanos' Pouch
    quest::givecash(0, 0, 300, 10);
    quest::exp(3000);
  }
  plugin::return_items(\%itemcount);
}
#END of FILE  Zone:qey2hh1  ID:12019 -- Vilnius_the_Small