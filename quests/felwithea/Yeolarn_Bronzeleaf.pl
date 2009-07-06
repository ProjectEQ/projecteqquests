sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Hail, $name! We of Tunare are charged with protecting the Great Mother from the forces of Innoruuk. Even now, the evil minions of this foul deity are despoiling our great forest. Will you help us [protect the Mother]?");
  }
  if($text=~/protect/i) {
    quest::say("Just outside the gates of Felwithe, the forces of Innoruuk gather in the guise of decaying skeletons. Bring me four sets of bone chips as proof of your vigilance. I assure you, your faith shall not go unrewarded.");
  }
  if($text=~/initiate of tunare/i) {
    quest::say("The Teir'Dal behind the undead plague in our forest have discovered a means of creating a terrible undead called a Ghast. These Ghasts have been sighted in the Lesser Faydark and must be destroyed. Bring me four of the vile creatures hearts.");
  }
  if($text=~/slay the necromancer/i) {
    quest::say("The Fier'Dal rangers that inhabit the Lesser Faydark have spotted a courier making deliveries to the Teir'Dal camp near Castle Mistmoore and to a necromancer that lingers near the ancient obelisk. We believe that the crates he carries are supplies needed for the creation of more Ghasts. Another shipment should be arriving soon. Seek out the necromancer at the obelisk and take his head then take the head of the courier and return them to me with the crate that the courier carries and your Initiate Symbol of Tunare.");
  }
  if($text=~/warden of tunare/i) {
    quest::say("The crate that the you recovered from the Courier contained this black candlestick that radiates an aura of great magical power. I request that you deliver the candlestick to Lady Trilani who is studying with the High Men in Erudin. Perhaps she can divine the nature of the candlestick and offer aid in defeating its power. The remaining contents of the crate have been given to Crusader Swiftmoon to be delivered to a gnome in steamfont that is purchasing them on behalf of the Eldrich Collective. When you return be sure to present your Disciple Symbol to me with anything that Trilani may ask you to deliver.");
    quest::summonitem(1598); # Black Stone Candlestick
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 13073 => 4)) { #Bone Chips x 4
    quest::say("Praise Tunare! I knew you would be victorious. I reward you with this spell, and pray that it will help you in your fight against the unholy forces of Innoruk. When you are ready you will make a fine [Initiate of Tunare].");
    quest::summonitem(15014); #Spell: Strike
    quest::exp(2500);
    quest::faction(43,15);  #Clerics of Tunare
    quest::faction(178,15); #King Tearis Thex
    quest::faction(8,15);   #Anti-mage
  }
  elsif(plugin::check_handin(\%itemcount, 10199 => 4)) { #Putrescent Heart x 4
    quest::say("Praise Tunare!! You have done well young Initiate. Here the symbol of your station within our faith. Return to me when you are ready to [slay the necromancer] that has been creating the undead.");
    quest::summonitem(1570); #Initiate Symbol of Tunare
    quest::exp(3250);
    quest::faction(43,15);  #Clerics of Tunare
    quest::faction(178,15); #King Tearis Thex
    quest::faction(8,15);   #Anti-mage
  }
  elsif(plugin::check_handin(\%itemcount, 1570 => 1, 12514 => 1, 19065 =>1, 12513 => 1)) { #Initiate Symbol of Tunare, Larik Z`Vole's Head, Teir`Dal Couriers Head, Teir`Dal Crate
    quest::say("Praise Tunare! The Mother smiles on you this day Disciple Angelsyn! I present you with the symbol of your new station among the Priests of Tunare. Return to me when you are ready to become a [Warden of Tunare]?");
    quest::summonitem(1571); # Disciple Symbol of Tunare
    quest::exp(4000);
    quest::faction(43,15);  #Clerics of Tunare
    quest::faction(178,15); #King Tearis Thex
    quest::faction(8,15);   #Anti-mage
  }
  elsif (plugin::check_handin(\%itemcount, 1571 =>1, 1599 => 1)) { #Disciple Symbol of Tunare, Powder of Unanimation
    quest::say("Praise Tunare!! I will have our sorcerers examine this power immediately to see if we can reproduce it in quantities enough to eliminate the undead plague. I award you the rank of Warden of Tunare, the All Mother smiles upon you, $name!");
    quest::summonitem(1572); # Warden Symbol of Tunare
    quest::exp(5000);
    quest::faction(43,15);  #Clerics of Tunare
    quest::faction(178,15); #King Tearis Thex
    quest::faction(8,15);   #Anti-mage
  }
  elsif (plugin::check_handin(\%itemcount, 18780 => 1)) { #Tattered Note
    quest::say("Welcome, friend, to the Clerics of Tunare. I am Yeolarn Bronzeleaf, head of the guild and devout follower of Tunare. Here is your guild tunic - it will help to protect you against this world's evils.");
    quest::summonitem(13590); #Faded Gold Training Tunic*
    quest::exp(1000);
  }
  else {
    quest::say("I have no need for this.");
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:felwithea  ID:61025 -- Yeolarn_Bronzeleaf.pl