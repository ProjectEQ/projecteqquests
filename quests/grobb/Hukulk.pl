sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 18792)) { 
		$client->Message(15,"As your eyes adjust to the darkness, a large troll decked out in grimy metal armor turns towards you. 'I be Hukulk. You read note in inventory and hand to me to start training!'");
  }
}

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("What you want!! You make fun of [helm of Hukulk]?!! Me smash you!! Maybe you come learn ways of Hate and Fear! You be dark power. You be Pain. You [want join Nightkeep]?");
  }
  if($text=~/helm/i) {
    quest::say("Oh!!  Yooz tink you great enough to wear helm of Hukulk?  Me have another just like it. Me make deal with yooz.  If yooz want helm den yooz help Hukulk get revenge.  Youz better be strong or yooz useless!!  So.. Yooz [make deal with Hukulk]?");
  }
  if($text=~/deal/i) {
    quest::say("Yooz smart!!  Yooz go and walks to dark elf city.  Yooz finds one whos make Lynuga breaks up with Hukulk!  Maybe first yooz find Lynuga.  Find who she visits in dark elf city!!  Den yooz go and top off him head!!  Bash Lynuga too, if she no give me back [happy love bracer]!!  Me want head of dat home wrecker an' me happy love bracers, den me give yooz helm of Hukulk.");
  }
  if($text=~/bracer/i) {
    quest::say("Happy love bracers are mines!!  Me make dem for Lynuga.  Dey all shiny and green like da forests me see in adventures when me young.  Dey make Hukulk all warm and happy.  Den me give to Lynuga and.. and <sob>.. and.. AND LYNUGA RIP OUT HUKULK HEART!!  Yooz makes Lynuga give back [happy love bracers]!!");
  }
  if($text=~/join/i) {
    quest::say("Good. Hate and Pain. Innoruuk teach power, I teach power. Me make you power. You do what me say. You no mess up, I no kill you. We no like dead creature we no own. Go, kill dem. Bring four bone chips. I make you power.");
  }
}

sub EVENT_ITEM { 
  if (plugin::check_handin(\%itemcount, 18792 => 1)) { #Tattered Note
    quest::say("Haaah!! Bow to Hukulk!! Hukulk make you feared.. make you powered! Dark power flow through you! Hate and Fear in your blood!");
    quest::summonitem(13530); #Black and Green Tunic*
	quest::ding();
    quest::faction(292,5); #Shadowknights of Night Keep
    quest::faction(128,5); #Green Blood Knights
    quest::faction(22,-10); #Broken Skull Clan
    quest::faction(66,5);  #Da Bashers
	quest::exp(100); 
  }
  elsif (plugin::check_handin(\%itemcount, 13073 =>4)) { #Bone Chips
    quest::say("You good. Take dis. Make much pain and hurt. Make tings bleeds. Kill, hurt all. Innoruuk and me say do, now go. You do much, come bak. Teach you how more hurt and pain make. Go.");
    quest::summonitem(5023); #Rusty Two Handed Sword
	quest::ding();
    quest::faction(292,10); #Shadowknights of Night Keep
    quest::faction(128,10); #Green Blood Knights
    quest::faction(22,-25); #Broken Skull Clan
    quest::faction(66,10);  #Da Bashers
  }
  elsif (plugin::check_handin(\%itemcount, 12201 =>1, 12202 => 1)) { #Happy Love Bracers and Troll Head(Lumpin)
    quest::say("Ha!! Ha!! Who have last laugh now!! You do good werk.  Now me give you extra helm of Hukulk. Now go away!!");
		quest::summonitem(3316); # Helm of Hukulk
		quest::ding();
    quest::faction(292,10); #Shadowknights of Night Keep
    quest::faction(128,10); #Green Blood Knights
    quest::faction(22,-15); #Broken Skull Clan
    quest::faction(66,10);  #Da Bashers
		quest::exp(250);
	}
  else {
    quest::say("Me no need dis, $name.");
    plugin::return_items(\%itemcount);
  }
}

#END of FILE Zone:grobb  ID:40023 -- Hukulk