# Pirate Earrings
# Bracers of Erollisi


sub EVENT_SAY {

   if($text=~/Hail/i){

      quest::say("Welcome to my island. I always welcome visitors, but I would prefer that your stay not last too long. My warriors are sometimes tempted by others. That is why they all wear purity belts. I should warn you, also, to be on the lookout for the [Pirates of Gunthak].");
}

   if($text=~/pirates of gunthak/i){
      quest::say("The Pirates of Gunthak have been stranded on a nearby island. Their ship was sunk by some unknown water beast. They now attempt to take over this island and commandeer the first ship they encounter. I am looking for brave [adventurers] to hunt the rogues. Do you wish to hunt the pirates or are you waiting for the next ship?");
}
   if($text=~/adventurer/i){
      quest::say("Go and seek them out. They are on a nearby island. You will have to swim if you have no boat. Each pirate wears the pirate earring of the Pirates of Gunthak. I shall reward you for each earring you return to me. They have also stolen the Bracers of Erollisi from us. Their leader may have the pair. Return it to me and I shall be very appreciative.");
  }

}

sub EVENT_ITEM {
   if (plugin::check_handin(\%itemcount,13337=>1)) { # Bracers of Erollisi   
      quest::say("Good work. I see you have removed that retchid pirate from here.");
      quest::faction("99","5"); # Faydarks Champoins
      quest::faction("178","5"); # King Tearis Thex
      quest::faction("304","5"); # Soldiers of Tunare
      quest::faction("43","5"); # Clerics of Tunare
      quest::faction("63","-10");  # Crushbone Orcs
      quest::exp(250);
      quest::givecash(0,5,5,0);
      quest::summonitem(quest::ChooseRandom(13339,13342,7017,13340));

 }
   if (plugin::check_handin(\%itemcount,13336=>1)) { # Pirate Earrings
      quest::say("Good work. That is one less pirate to worry about. We do not have much, but take this as payment.");
      quest::faction("99","5"); # Faydarks Champoins
      quest::faction("178","5"); # King Tearis Thex
      quest::faction("304","5"); # Soldiers of Tunare
      quest::faction("43","5"); # Clerics of Tunare
      quest::faction("63","-10");  # Crushbone Orcs
      quest::exp(100);
      quest::givecash(0,1,4,0);
      quest::summonitem(quest::ChooseRandom(13339,13342,7017,13340));    
   }


}


#END of FILE Zone:oot  ID:69008 -- Styria_Fearnon