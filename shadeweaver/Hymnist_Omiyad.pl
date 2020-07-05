# items: 31289, 7498
sub EVENT_SAY { 
  if($text=~/hail/i){
    quest::say("Greetings young one, have a seat by the fire.  You will notice the dance being preformed.  This is much more than just a dance though.  It is a ritual that we preform to [purge] the evil spirits that are plaguing the thicket.");
  }
  if($text=~/purge/i){
    #Talisman of the Flame (Start)
    quest::say("Lately there has been a surge in the number of Lodi Kai threatening our trade routes.  This ritual is preformed around a fire that burns from their [remains].  Setting their remains in the fire will free their tie with this world and shall ward off their numbers.");
  }
  if($text=~/remains/i){
    #Talisman of the Flame
    quest::emote("glances toward the fire.");
    quest::say("I see the fire is dying down some. Should you come across the remains of the Loda Kai bring them to me to keep the ritual fire burning. Bring plenty though, four if you can.");
  }
}

sub EVENT_ITEM {
  #Handin: Loda Kai Remains
  if(plugin::check_handin(\%itemcount, 31289 => 4)){
    #Talisman of the Flame (End)
    quest::emote("takes the remains and throws them into the fire, flames blaze immediatey with a sicky hue.");
	quest::say("You have preformed a great service by helping destroy some of the wretched Lodi Kai. Take this small talisman, it is worn by the dancers here. Take it with you and feel free to do a dance whenever you like, haha!");
    #Talisman of the Flame
    quest::summonitem(7498); # Item: Talisman of the Flame
    quest::faction(1513,10); # +Guardians of Shar Vahl
    quest::exp(250);
    quest::ding();
    }
    #do all other handins first with plugin, then let it do disciplines
    plugin::try_tome_handins(\%itemcount, $class, 'Bard');
    plugin::return_items(\%itemcount);
}


#END of FILE Zone:shadeweaver  ID:165115 -- Hymnist_Omiyad 
