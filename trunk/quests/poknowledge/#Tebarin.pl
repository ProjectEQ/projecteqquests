#BeginFile: poknowledge\#Tebarin.pl
#Quest file for Plane of Knowledge - Tebarin: Necromancer Epic 1.5 (Soulwhisper)

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Hello, $name."); #Real text still needed
  }
  if(($text=~/special box/i) && plugin::check_hasitem($client, 11406)) {
    quest::say("I must have a box made to protect the tome from these thieves! In addition to the rune-covered insert I have given you, you will also need one piece of gnarled wood, and one elaborate hinge. Find those items and combine them in a forge to make the box. If you fail, Kazen and I will not be pleased. Now go!");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 10138 => 1)) { #Ruandia's Instructions
    quest::say("Kazen informed me that you would be coming. Ruandia deciphered the rune for you? Good. That witch better be accurate or Kazen will have her head. I need you to find two balls of elemental clay and combine them in this box. Return them to me when you have them.");
    quest::summonitem(16689); #Intricately Carved Box
  }
  elsif(plugin::check_handin(\%itemcount, 27282 => 1)) { #Sealed Intricately Carved Box
    quest::emote("takes the clay from you and combines them into a large ball. He then flattens it out into a thin sheet and carefully carves a likeness of the rune into the clay sheet with a sharp stick. 'The directions say we will require an ancient tome of lost lore. I believe you can find one somewhere in The Hole. When you find the tome, combine it in the intricately carved box with the oil and then hand it to me. The oil will protect the tome for the ritual ahead.'");
    quest::summonitem(16689); #Intricately Carved Box
    quest::summonitem(16799); #Strange Smelling Oil
  }
  elsif(plugin::check_handin(\%itemcount, 16759 => 1)) { #A Protected Tome
    quest::emote("presses the sheet of clay into the tome and closes it. A red glow begins to engulf the tome. Tebarin opens the tome and you can see words slowly start to appear on the pages as if a ghost were writing on the pages. Tebarin studies the words within for several minutes. 'There is an explanation of the history of the staff. I have decided that our best bet of obtaining the staff is for me to attempt to summon it from its home plane of existence. I would advise you to prepare for the worst. This could end up being very dangerous. Hold the tome for a moment and try to attune yourself to its magics. Hand it to me when you are ready for me to begin the summoning.'");
    quest::summonitem(9834); #Brightly Glowing Tome
  }
  elsif(plugin::check_handin(\%itemcount, 9834 => 1)) { #Brightly Glowing Tome
    quest::emote("holds up the book with both hands and begins to chant. After several minutes, a sudden flash blinds you. When you regain your vision a few seconds later, you are amazed to see the staff floating in the air before you. Before you or Tebarin are able to take the staff as your own, a booming voice echoes throughout the room, 'All who seek my staff will be destroyed!' An explosion of bright magic stuns you as a magical portal opens. Four heavily armored paladins step through the portal and grab the staff. 'Not if we destroy the staff first!' one of the paladins shouts. The paladins rush back into the portal with the staff.");
    quest::emote("tries to follow them into the portal but it disappears. 'This cannot be!' cries Tebarin. 'We must ensure this tome does not also fall into the hands of the paladins. The tome is our only hope of recovering the staff before the paladins destroy it. We must build a [special box] that will protect the tome. Take this rune-covered insert. You will use it to construct the box.'");
    quest::summonitem(11406); #Rune Covered Insert
  }
  elsif(plugin::check_handin(\%itemcount, 13620 => 1)) { #Glowing Box of Protection
    quest::say("This should do nicely. At least I hope so, for your sake. Now that the box is secure, I want revenge on the paladins who took the staff! Find all four of the paladins and take their heads! Once you have their heads, combine them in this sack and hand it to me. I will make sure they are reanimated and suffer for many, many years for what they have done. Now leave me. I must ponder the turn of events that have taken place here.");
    quest::summonitem(11517); #Paladin Headhunting Satchel
  }
  elsif(plugin::check_handin(\%itemcount, 24630 => 1)) { #Full Paladin Headhunting Satchel
    quest::say("Your donation will please my masters greatly. I have a special reanimation spell reserved just for these do-gooders. Now you are to travel to Natimbi and find the paladin who has the staff. You might want to talk to the dead you come across as they often have valuable information. Take this orb to help enhance your natural abilities to communicate with the dead.");
    quest::summonitem(15784); #Orb of Deathspeaking
  }
  else {
    quest::say("I have no use for this, $name.");
    plugin::return_items(\%itemcount);
  }
}
#EndFile: poknowledge\#Tebarin.pl (202333)