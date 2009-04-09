sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("What you want!! You make fun of [helm of Hukulk]?!! Me smash you!! Maybe you come learn ways of Hate and Fear! You be dark power. You be Pain. You [want join Nightkeep]?");
  }
  if($text=~/join/i) {
    quest::say("Good. Hate and Pain. Innoruuk teach power, I teach power. Me make you power. You do what me say. You no mess up, I no kill you. We no like dead creature we no own. Go, kill dem. Bring four bone chips. I make you power.");
  }
}

sub EVENT_ITEM { 
  if (plugin::check_handin(\%itemcount, 18792 => 1)) { #Tattered Note
    quest::say("Haaah!! Bow to Hukulk!! Hukulk make you feared.. make you powered! Dark power flow through you! Hate and Fear in your blood! Go to Vergad. He give you first lesson in pain.");
    quest::summonitem(13530); #Black and Green Tunic*
    quest::exp(100); 
  }
  elsif (plugin::check_handin(\%itemcount, 13073 =>4)) { #Bone Chips
    quest::say("You good. Take dis. Make much pain and hurt. Make tings bleeds. Kill, hurt all. Innoruuk and me say do, now go. You do much, come bak. Teach you how more hurt and pain make. Go.");
    quest::summonitem(5023); #Rusty Two Handed Sword
    quest::faction(292,2); #Shadowknights of Night Keep
    quest::faction(128,2); #Green Blood Knights
    quest::faction(22,-2); #Broken Skull Clan
    quest::faction(66,2);  #Da Bashers
  }
  else {
    quest::say("Me no need dis, $name.");
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:grobb  ID:40023 -- Hukulk