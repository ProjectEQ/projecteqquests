sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 36004)) { 
		$client->Message(15,"A sleek, powerful looking Vah Shir turns to greet you as you get oriented to your surroundings. 'Greetings, I am Vrasha. I am the leader of the Ireblood Ragers. We are gladly accepting young recruits if you think you have what it takes. If you wish to train with me, hand me your note. Oh, I almost forgot. If you wish to know what that [tome] in your inventory is for, please ask me.'");
  }
}

sub EVENT_SAY {
	if($text =~ /hail/i) {
		quest::say('If you are ready to join the Ireblood Ragers, read the note in your inventory and then hand it to me.  Make sure to ask me about that [tome] in your inventory as well.  It will help you greatly during your adventures.');
	}
	if(($text=~/application/i) && ($qglobals{Shar_Vahl_Cit} == 1)) {
		quest::say("Luckily for you someone found it.");
		quest::summonitem(2873);
	}
	if(($text=~/cloak/i) && ($qglobals{Shar_Vahl_Cit} == 7)){
		quest::say("Someone found this under a table at the one of the pubs. Try not to lose it this time.");
		quest::summonitem(2878);
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
	if(plugin::check_handin(\%itemcount,36004 => 1)){ # Shimmering Cloth Note
		quest::say("I am so thrilled you have chosen to join this regal and fearsome crew.  You will find that as a member of the Ireblood Ragers, you have a strong and proud force backing you. Now you must complete your first task.  Take this application to Registrar Bindarah and return to me with proof of your citizenship.");
		quest::say("I know that you may be nervous right now... after all, this should be a very exciting first step for you.  If you happen to get lost while looking for the registrar, just ask one of the other citizens or guards for directions.  They will most likely know where to find the place or person that you are looking for.");
		quest::ding();
		quest::exp(100);
		quest::setglobal("Shar_Vahl_Cit",1,5,"F");
		quest::summonitem(2873); # Application for Citizenship
	}
	elsif (plugin::check_handin(\%itemcount, 2897 => 1)) {
		quest::say("$name, citizen of Shar Vahl, accept this cloak as a symbol of your loyalty and service to our noble people. It will grow with you, young initiate, and like you it has incredible potential.  If you wish to complete further tasks, you should talk to Pashir.  Farewell.");
		quest::summonitem(2878);
		quest::ding();
		quest::exp(100);
		quest::setglobal("Shar_Vahl_Cit",7,5,"F");
	}
	else {
		#do all other handins first with plugin, then let it do disciplines
		plugin::try_tome_handins(\%itemcount, $class, 'Berserker');
	}
	plugin::return_items(\%itemcount);
}
