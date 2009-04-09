sub EVENT_SAY {
  if($text=~/hail/i){
    quest::say("Welcome to the greatness that is Skyshrine, $name. I am Herald to our great leader, Lord Yelinak. It is my position to make sure that all is running in an orderly and functional matter in the mighty shrine before you. I handle the guard assignments as well as granting [access] to pass through the shrine. If you'd like to find out about either of these, please just ask.");
  }
  if($text=~/access/i){
    # Key to Cobalt Scar
    quest::say("You may have seen the large monument in a pond out in the commune area on your journey to see me. This is not just a monument to our great Lord Yelinak, but also a portal to the cold recesses of the Cobalt Scar. Access is, however, only granted to those who are [worthy] to be called allies of the shrine.");
  }
  if($text=~/worthy/i){
    # Key to Cobalt Scar
    quest::say("Perhaps, then again you only say that so you might gain access and plunder through the riches beyond the portal. We shall see. If you truly wish to prove yourself, you will need to entertain a bit of a [challenge].");
  }
  if($text=~/challenge/i){
    # Key to Cobalt Scar
    quest::say("We of the kin have a contact within the giant regime, named Wenglawks Kkeak. He has information on the movements of the storm giants through the arctic homelands of Velious. We have been in contact with him for quite some time, however, as of late, our couriers have been lost on their way to met him. As you can imagine, this worries us and makes it rather difficult to keep abreast of the movements of the giants. What we needs is someone to find Wenglawks and [deliver] the payment to him, so that we can gather further information on their movements.");
  }
  if($text=~/deliver/i){
    # Key to Cobalt Scar
    quest::say("As much I figured you would say that. You must take this request for the information and give it to him, along with 200 platinum pieces. Only then will he part with the information. Once you have it, bring it back to me and your worth to the shrine will be proven.");
    # Summon: Message to Wenglawks
    quest::summonitem(28600);
  }
}

sub EVENT_ITEM {
  # Handin: Message to Herald
  if(plugin::check_handin(\%itemcount, 28601 => 1)){
    # Key to Cobalt Scar [End]
    quest::say("I appear to have mistaken your declaration of worth as a phony attempt at bravado, and do apologize. You have truly proven yourself worthy of the shrine, and in short order as well. For your troubles, and as a token of your worth to the shrine, I grant you this key to traverse into the lands of the Cobalt Scar. Praise be with you and good journeys always, $name.");
    quest::exp(500);
    # Summon: Shrine Key
    quest::summonitem(28602);
   } 
   else {
    quest::say("I have no need for this item $name, you can have it back.");
    plugin::return_items(\%itemcount);
  }
}


#EOF   