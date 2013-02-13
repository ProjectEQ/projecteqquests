sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if (($ulevel == 1) && ($class == "Berserker")) { 
		$client->Message(15,"Before you stands an imposing, yet ruggedly beautiful woman. She looks your way. 'I was told ye would arrive soon. I be Shanis MacDarren, the leader o' the Bloodrage Brawlers, or berserkers as others would call us. If ye be ready for some trainin', hand me yer note and we will begin! Oh and make sure to ask me about [tomes] if you wish to learn about throwin' axes!'");
  }
}

sub EVENT_SAY {
	if($text =~ /hail/i) {
		quest::say("Why, as I live and breathe this frigid air, have ye come to join our fine guild of berserkers?  The Bloodrage Brawlers are a fearsome collection of berserkers, indeed, me friend.  If ye be interested in joinin' up with us, read the note in yer inventory and then hand it to me!  Oh, and don't ye be forgetin' to ask me about that [tome] in yer inventory if ye want ta learn to use it!");
	}
	if($text =~/tome/i) {
		my $Indent = plugin::PWIndent();
		my $Yel = plugin::PWColor("Yellow");
		my $grn = plugin::PWColor("Lime Green");
		quest::popup("Using Berserker Tomes", "<br> In your inventory you will see a book called 'Tome of Corroded Axe'. This tome will allow you to summon throwing axes to be used in combat.  To use your tome, complete the following steps: <br><br>
		$Indent -Open your inventory by pressing the [$Yel I </c>] key on your keyboard. <br>
		$Indent -Click on the 'Tome of Corroded Axe' in your inventory so that it is placed on your mouse cursor. <br>
		$Indent -Move yoour cursor with the tome still on it over to your guildmaster and [$Yel left-click </c>] on him/her. <br>
		$Indent -Now click the [$grn give </c>] button located near the bottom of the trade window. <br>
		$Indent -You should now see a message in your chat window that says 'Use your new skill wisely'. <br>
		$Indent -Press [$Yel ALT-C </c>] on your keyboard to bring up the Combat Abilities window. <br>
		$Indent -Click on the '$grn S </c>' located near the top right corner of the Combat Abilities window.  This will open the Combat Skills window. <br>
		$Indent -Your new skill, 'Corroded Axe' should now be displayed in the window.  Click on the name of the skill once, and then look at the bottom of the window.  Your should see a '$grn Make Hotkey </c>' button.  Clicking on this will allow you to make a hotkey for your new skill. <br>
		$Indent -Place the new hotkey in one of the empty hotkey slots of the Combat Abilities Window. <br><br>
		Remember to stock up on components if you wish to use your new skill and create some throwing axes.  You can visit the Berserker Tome Merchants in your home town to get one free sample of components or to buy more tomes and components.");
	 }
}

sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 36003 => 1)) {  # Frost-Covered Note
   	quest::say("I was hoping ye would see the wisdom of joining our fine guild. Now before ye take off on some fool quest and get yerself killed, take this tunic -- it's not much, but it will keep yer bones from freezing and give you a wee bit o' protection. There's much to be done in and around our fine city. I suggest that ye talk to Haladorf over there. Ye best get to work! Come back and see me as you gain experience and I'll train ye in our way. Oh, and one more thing. You might be wonderin' what that Tome of Corroded Axe be for. Hand it to me and I will grant you your first skill with throwin axes!");
		quest::ding();
    quest::summonitem(36009); # Furless Bearskin Tunic
    quest::exp(100);        # Give exp for turning in quest
  }
	else {
		plugin::try_tome_handins(\%itemcount, $class, 'Berserker');
		plugin::return_items(\%itemcount);
	}
}

