# Necromancer Epic NPC -- Venenzi_Oberzendi
# items: 20642, 20643, 1320, 20649

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("What is it you want! Can't you see I am gathering reagents for my [master]? If I don't get them for him quickly he might punish me.");
  }
  if($text=~/master/i) {
    quest::say("You do not know of my teacher? The great Kazen Fecae! I am one of his illustrious apprentices! If you fancy yourself a necromancer, travel to Lake Rathetear and tell Kazen you wish to study the dark arts.");
  }
  if($text=~/reagents/i) {
    quest::say("My master is working on some great project. He's always busy studying an old text he found and murmuring something about following in the footsteps of Miragul.");
  }
  if($text=~/task/i) {
    quest::emote("looks down at her robes and back at you. 'There is an certain dark elf magician who has decided to wear the same fashion as I have on several occasions. I do not wish to attend another social gathering in Neriak and look exactly the same as another woman. Slay her and bring me her robe, and I will give you my hard earned reagents.'");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 20642 => 1)) {
    quest::say("I see you serve my master as well now. I assume you are here to take the reagents from me which I have gathered for him? I don't know if I like the idea of you gaining the credit for my hard work here. I might consider giving you these reagents, if only you do a small [task] for me.");
    quest::ding();
    quest::exp(500);
    quest::summonitem(20643); # Item: Twisted Symbol of the Apprentice
  }
  elsif(plugin::check_hasitem($client, 20643) && plugin::check_handin(\%itemcount, 1320 => 1)) {
    quest::say("Thank you, $name. I did not think you would track down Najena and slay her. I think that I am going to return to my old life in Neriak. I am sick of the way Kazen has been treating me. He never seems to teach me anything worthwhile. Don't forget to give his lapdog that symbol with the reagents. I'm sure he will give you a new one.");
    quest::ding();
    quest::exp(500);
    quest::summonitem(20649); # Item: Rolling Stone Moss
  }
  plugin::return_items(\%itemcount);
}
#END of FILE  Quest by: Solid11  Zone:nektulos  ID:25099 -- Venenzi_Oberzendi