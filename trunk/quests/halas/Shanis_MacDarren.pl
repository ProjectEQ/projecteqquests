#Shanis_MacDarren.pl in halas loc 576  329.70 4.38


sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 36003 => 1)) {  # Frost-Covered Note
   		quest::say("I was hoping ye would see the wisdom of joining our fine guild. Now before ye take off on some fool quest and get yerself killed, take this tunic -- it's not much, but it will keep yer bones from freezing and give you a wee bit o' protection. There's much to be done in and around our fine city. I suggest that ye talk to Haladorf over there. Ye best get to work! Come back and see me as you gain experience and I'll train ye in our way. Oh, and one more thing. You might be wonderin' what that Tome of Corroded Axe be for. Hand it to me and I will grant you your first skill with throwin axes!");
    	quest::summonitem(36009); # Furless Bearskin Tunic
       	quest::exp(300);        # Give exp for turning in quest
    }
	else {
		plugin::try_tome_handins(\%itemcount, $class, 'Berserker');
		plugin::return_items(\%itemcount);
	}
}

