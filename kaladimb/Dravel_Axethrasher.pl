# items: 11999, 36000, 36006
sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 36000)) { 
		$client->Message(15,"A stern, commanding looking dwarf looks your way. He has an unsettling gleam in his eye. 'Oy there! been waitin' for ya! Welcome to Kaladim! Tha name's Dravel. If you be wishin' ta join us, hand me your note and we will begin your trainin' Oh, remember to ask me about that [tome] there in yer inventory. Wouldn't want ta ferget about that!'");
  }
}

sub EVENT_SAY {
	if($text =~ /hail/i ) {
		if(defined $qglobals{berserk_epic} && $qglobals{berserk_epic} >= 1) {
		quest::say("Well hello thar! It's good to see ya again, what can I do fer ye? Oh, you lost your soul gem, eh? Well, let's see what I can do here. Ahh yes, here ye go, but take good care of this one, they are not easy to create. Ye might want to seek out Keras and apprise him of yer progress in your quest to learn to focus and control yer rage.");		
		quest::summonitem(11999); # Item: Raging Soul Shard
		}
	elsif($qglobals{berserk_epic} == undef) {
		quest::say("Greetin's $name! You say ye wish to join up with us? That be great! Read the note in yer inventory and then hand it to me and we can start yer trainin! I almost forgot. Ask me about that [tome] in yer inventory if ye want to know how to use it.");
		}
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
	if(plugin::check_handin(\%itemcount, 36000 => 1)) {  # Blood-Smeared Note
   	quest::say("Tis a good thing ye're doing by joining up with us, $name. As a member, ye get a wee gift. Take this tunic. Now, take that rage that rushes through yer veins and go kill some of the vermin around the city! Take a good look around ye as well. Grab some ale or talk to some of the miners. Lots to do around 'ere, me friend. Oh, and Goriba over there wanted to talk to ya. Now, off with ye! Come back when ye've cut a few creatures down and gotten some experience with yer blade. I'll be able to educate ye a bit about the ways of the berserker.");
    quest::ding();
    quest::summonitem(36006); # Tattered Miner's Tunic*
    quest::exp(100);
  }
  plugin::try_tome_handins(\%itemcount, $class, 'Berserker');
  plugin::return_items(\%itemcount);
}
