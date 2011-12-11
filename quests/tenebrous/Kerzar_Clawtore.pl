sub EVENT_SAY{
	if($text=~/hail/i){
		quest::emote("glares with eyes that seem to pierce through you like fiery daggers.  'Run while you can weakling!  My appetite grows stronger with the presence of your mortal scent!'");
	}
}

sub EVENT_ITEM{
	if(plugin::check_handin(\%itemcount, 31754 => 1)){
		quest::say("You've been sent by the Validus Custodus to question me!! You mortals are more foolish than I had presumed! The only information I have for you is the fact that you are about to face your death!!");
		quest::setglobal("vampyre_vahshir_combat", 1, 1, "M7");
		quest::summonitem(31757); #Third Badge of Service
		quest::attack($name);
		quest::emote(" roars flashing glistening fangs that are sharper and longer than the average Vah Shirs!");
		quest::setnexthpevent(15);
	}
	else{
		quest::say("I have no need for this item, $name. You can have it back");
		plugin::return_items(\%itemcount);
	}
}

sub EVENT_HP {
	if($hpevent == 15) {
		quest::spawn2(172187,0,0,$x,$y,$z,$h);
		quest::depop;
	}
}

sub EVENT_DEATH {
   if(defined $qglobals{vampyre_vahshir_combat}){
		quest::unique_spawn(172187,0,0,$x,$y,$z,$h);
   }
}