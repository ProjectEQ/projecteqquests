sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 36001)) { 
		$client->Message(15,"A crazed ogre stands before you. He seems to be foaming at the mouth. 'Hey wot you doing? Oh you wants join da powerful berserkers? Me think you look weak. But me train you and make you strong. You no fail or me will bash you to deth! Give me your note! Oh, and make sure to ask me about dat [tome] you gots dere in your inventory.'");
  }
}

sub EVENT_SAY {
	if($text =~ /hail/i) {
		quest::say("You want join us?  Read dat note you have and den give to me.  I decide if you be strong enough to join us.  Umm...sumting else I supposed to tell you...Oh ya!  Ask me dat [tome] you have there in yer inventory.");
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
	if(plugin::check_handin(\%itemcount, 36001 =>1)) { #Gore-Splattered Note
		quest::say("Gud!  Gud!  Me gots some clothes for you.  Now that yous a Bonecutter, yous need to start choppins things.  Me gots a few friends dat needs help too.  If you want sumtin to do, talk to Ogomok over dere.  Come see me again when yous got some experience and are ready to learn more."); 
		quest::summonitem(36007); # Torn Bonecutter Tunic
		quest::ding();
		quest::exp(100);
	}
	else {
		#do all other handins first with plugin, then let it do disciplines
		plugin::try_tome_handins(\%itemcount, $class, 'Berserker');
	}
	plugin::return_items(\%itemcount);
}
