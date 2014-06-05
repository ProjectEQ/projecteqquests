sub EVENT_SAY {
  if($text=~/Hail/i){
    quest::say("Hello there, $name.  Can I interest you in any components to help you in your research?");
  }
}

sub EVENT_ITEM {
	if (plugin::check_handin(\%itemcount, 14331 => 1)) { #Ro's Breath
		quest::say("So, I've been discovered! You must know Camin - he is one of the only people who could have recognized my work. I have worked very hard to mask my presence here.");
		quest::unique_spawn(29089,0,0,$x,$y,$z,$h);
		quest::depop_withtimer();
	}
	#Return Love Note handin
	elsif (plugin::check_handin(\%itemcount, 14335 => 1)) {
		#quest::targlobal("wizepicA",1,"D30",29089,$charid,29);
		quest::unique_spawn(29089,0,0,$x,$y,$z,$h);
		quest::setglobal("wizepicA",1,1,"F");
		quest::depop_withtimer();
	}
	#Return Oil Note handin
	elsif (plugin::check_handin(\%itemcount, 18168 => 1)) {
		#quest::targlobal("wizepicA",2,"D30",29089,$charid,29);
		quest::unique_spawn(29089,0,0,$x,$y,$z,$h);
		quest::delglobal("wizepicA");
		quest::setglobal("wizepicB",1,1,"F");
		quest::depop_withtimer();
	}
	plugin::return_items(\%itemcount);
}


#END of FILE Zone:halas  ID:29000 -- Dargon 

