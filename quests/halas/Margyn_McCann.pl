my $randomspell = quest::ChooseRandom(15270,15275,15075,15271,15279,15212,15079);
# : Drowsy : Frost Rift : Sicken : Fleting Fury : Spirit of Bear : Cure Blindness : Spirit Sight : In that order
my $rG = quest::ChooseRandom(3,4,5);
my $rS = int(rand(99));
my $rC = int(rand(99));
#Above 3 variables are used to generate random gold silver and copper coin returns

sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if (($ulevel == 1) && ($class eq "Shaman")) { 
		$client->Message(15,"Margyn McCann greets you. 'Welcome to the Church of the Tribunal. Read the note in your inventory and when you are ready to begin your training, hand it to me.'");
  }
}

sub EVENT_SAY {
	if($text=~/hail/i) {
		quest::say("Hail, young adventurer! I'm the chief overseer o' the Shamans o' Justice. We serve the will o' the Tribunal. Justice is our way. Within Halas, there are none who are above the scales o' justice. There are still some who have defied our laws. We wish to [apprehend the fugitives].");
	}
	if($text=~/apprehend the fugitives/i)	{
		quest::say("Maybe so, however, there are some who may be too much fer ye to handle.I'll need to know if ye're a [young shaman] or a [standin' member of the court].");
	}
	if($text=~/young shaman/i) {
		quest::say("We seek a former member who dared to curse the righteousness of the Tribunal. We'll have his head for that remark. His name is Granin O'Gill and he has run to the wastelands of Everfrost seeking safe haven. Find him. Return his head to me. Do so, and earn the ninth circle spell, Spirit o' the Bear. Go at once!");
	}
	if($text=~/trades/i) {
		quest::say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
		quest::summonitem(51121);
	}
	if($text=~/second book/i)	{
		quest::say("Here is the second volume of the book you requested, may it serve you well!");
		quest::summonitem(51122);
	}
}

sub EVENT_ITEM{
	if(plugin::check_handin(\%itemcount, 13729 => 1)) { #Barbarian Head
   	quest::say("We can now rest assured that justice has been served. Ye'll be a valuable asset to our court. Take and remember this spell, Spirit o' the Bear. I hope ye've attained the necessary skills to scribe it. If not, I'm sure ye soon will. Go now, and serve justice.");
		quest::exp(1600);
		quest::ding();
		quest::givecash($rC,$rS,$rG,0);
		quest::faction(213,2); #Merchants of Halas
		quest::faction(294,2); #Shamen of Justice
		quest::faction(33,-3); #Circle of Unseen Hands
		quest::faction(48,-3); #Coalition of Tradefolk Underground
		quest::faction(137,-3); #Hall of the Ebon Mask
		if($class eq "Shaman" || $class eq "Beastlord")	{
			quest::summonitem($randomspell,1); #A Random Spell Listed Above
		}
	}
	elsif(plugin::check_handin(\%itemcount, 18761 => 1)) {
		quest::say("Welcome t' the Church o' the Tribunal. Here, we practice the will o' the Six Hammers. This is our guild tunic - wear it with pride and represent us well. Once you are ready to begin adventuring please see Jinkus Felligan, he can help you with tasks geared towards your development as a great Shaman. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		quest::ding();
    quest::faction(294, 5);   # Shamen of Justice
		quest::faction(213, 5);   # Merchants of Halas
		quest::faction(33, -5);   # Circle of Unseen Hands
		quest::faction(48, -5);   # Coalition of Tradefolk Underground
		quest::faction(90, -5);   # Ebon Mask
    quest::summonitem(13512); # Faded Blue Tunic
		quest::exp(100);        # Give exp for turning in quest
	}
	else {
		quest::say("I have no need for this $name, you can have it back.");
		plugin::return_items(\%itemcount);
	}
}

#EoF