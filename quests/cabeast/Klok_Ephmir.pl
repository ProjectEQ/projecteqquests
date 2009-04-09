sub EVENT_SAY {
  if($text=~/hail/i){
    quest::emote("stares at you with a wicked smirk. 'So you share the Brood's love of frogloks, do you? Alive, they provide much trouble. Dead, they provide much delight. I have found many uses for the frogloks. From fine meat to fine mats. Be sure to ask if you do not see something you desire.'");
  }
  elsif($text=~/i need thinly sliced froglok/i){
  # Catfish Croak Sandwich [Part 5]
    quest::say("I can provide thin sliced froglok meat, or rather, I used to. First I need to [sharpen the dull cutting disk].");
  }
  elsif($text=~/sharpen.*disk/i){
  # Catfish Croak Sandwich [Part 6]
    quest::say("That would be good. If you are a blacksmith, I am sure you can find a sharpening stone and bring life back in my disk. If you sharpen this I shall gladly provide you with some thin sliced froglok.");
  }
  elsif($text=~/outlander/i){ #Shackle of Copper Quest
   quest::emote("turns pale at the mention of the Outlander. 'The Outlander!! That is what the lizards in the Tink N' Babble have dubbed him!! He is tall and strong. Get close enough and he will kill you on sight!! I think he could even defeat the likes of Bruiser Noz!! I spotted him near the edge of the swamps. He was headed toward the fields of Firiona.'");
 }
}

sub EVENT_ITEM {
 #Handin: Sharpened Cutting Disk (12450)
  if(plugin::check_handin(\%itemcount, 12450 => 1)){
  # Catfish Croak Sandwich [Part 7]
    quest::emote("takes the disk and attaches it to an odd device powered by a foot pedal. He takes a froglok leg and begins to slice it as chunks of gristle flies into your face. When he is done he hands you some thin sliced froglok. 'There you are. Run along.'");
    quest:summonitem(12445,4);
  }
  else {
    plugin::return_items(\%itemcount);
  }
}

#SQL: sharp cutting disk & catfish croak sandwich recipes have been submitted to db.
#Quest: Catfish Croak Sandwich (Submitted By: Senzo)