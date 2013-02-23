sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 18745)) { 
		$client->Message(15,"As your eyes adjust to the darkness of the cave, a woman with a serious look on her face looks your way. 'You there. What is your business down here? You are here for training you say? Read the note in your inventory and hand it to me if you wish to begin.'");
  }
}

sub EVENT_SAY { 
	if($text=~/hail/i) {
		quest::say("Listen. this is a pretty busy [operation] I run here.  I certainly don't have any spare time to sit around and chit-chat with you all day. got it?");
	}
	if($text=~/operation/i) {
		quest::say("Look. $name . I don't have time for this.  Let's just say importing exotic goods is our main interest. along with a few other profitable ventures.  Now quit pestering me. or you'll force me to sic Grenny here on ya.");
		quest::signal(382208,10);
	}
}

sub EVENT_ITEM { 
	if(plugin::check_handin(\%itemcount, 18745 => 1)) { # A tattered note
		quest::say("Welcome to the Coalition of Tradesfolk underground. We like to keep a low profile around here and not draw any unneeded attention to our operations. you following me? I hope so. for your sake. Anyways. Nestral T'Gaza is in charge with helping out our newest members. Go see her as soon as you get a chance.");
		quest::summonitem(13568); # Brown Faded Tunic
		quest::ding();
		quest::faction(48,10); #Coalition of TradeFolk Underground
		quest::faction(47,10); #Coalition of Trade Folk
		quest::faction(31,10); #Carson McCabe
		quest::faction(53,10); #Corrupt Qeynos Guards
		quest::faction(105,10); #The Freeport Militia
		quest::exp(100);
	}
	#do all other handins first with plugin, then let it do disciplines
	plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
	plugin::return_items(\%itemcount);
}

#END of FILE Zone:freporte  ID:10108 -- Elisi_Nasin