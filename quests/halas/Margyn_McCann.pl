 ###########################################
## DEVELOPER: KOVOU
##
## *** NPC INFORMATION ***
##
## NAME: Margyn McCann
## ID: 29059
## ZONE: halas
##
############################################

my $randomspell = quest::ChooseRandom(15270,15275,15075,15271,15279,15212,15079);
# : Drowsy : Frost Rift : Sicken : Fleting Fury : Spirit of Bear : Cure Blindness : Spirit Sight : In that order
my $rG = quest::ChooseRandom(3,4,5);
my $rS = int(rand(99));
my $rC = int(rand(99));
#Above 3 variables are used to generate random gold silver and copper coin returns

sub EVENT_SAY
{
	if($text=~/hail/i)
		{
		quest::say("Hail, young adventurer! I'm the chief overseer o' the Shamans o' Justice. We serve the will o' the Tribunal. Justice is our way. Within Halas, there are none who are above the scales o' justice. There are still some who have defied our laws. We wish to [apprehend the fugitives].");
		}
	if($text=~/apprehend the fugitives/i)
		{
		quest::say("Maybe so, however, there are some who may be too much fer ye to handle.I'll need to know if ye're a [young shaman] or a [standin' member of the court].");
		}
	if($text=~/young shaman/i)
		{
		quest::say("We seek a former member who dared to curse the righteousness of the Tribunal. We'll have his head for that remark. His name is Granin O'Gill and he has run to the wastelands of Everfrost seeking safe haven. Find him. Return his head to me. Do so, and earn the ninth circle spell, Spirit o' the Bear. Go at once!");
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
    	quest::say("I was hoping ye would see the wisdom of joining our fine guild. Now before ye take off on some fool quest and get yerself killed, take this tunic -- it's not much, but it will keep yer bones from freezing and give you a wee bit o' protection. There's much to be done in and around our fine city. I suggest that ye talk to Haladorf over there. Ye best get to work! Come back and see me as you gain experience and I'll train ye in our way. Oh, and one more thing. You might be wonderin' what that Tome of Corroded Axe be for. Hand it to me and I will grant you your first skill with throwin axes!");
    	quest::faction(294, 2);   # Shamen of Justice
		quest::faction(213, 2);   # Merchants of Halas
		quest::faction(33, -2);   # Circle of Unseen Hands
		quest::faction(48, -2);   # Coalition of Tradefolk Underground
		quest::faction(90, -2);   # Ebon Mask
    	quest::summonitem(13512); # Faded Blue Tunic
       	quest::exp(300);        # Give exp for turning in quest
    }
	else {
		plugin::return_items(\%itemcount);
	}
}


#EoF