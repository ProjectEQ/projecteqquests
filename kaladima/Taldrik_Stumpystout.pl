sub EVENT_SAY {
	if($text=~/hail/i){
		quest::say("Move along dere yer blocking me view lad. I await me friend that has gone off to fetch me some water. I sure is hot out here.");
	}
	if($text=~/recipe/i){
	# Disciple Symbol of Brell Serilis
		quest::say("Well ya see lad I had an ancient recipe passed down to me that told one how to create the holiest of ale. Its far gone now, however I recently had a vision of the ingredients and where they might be found. Do you wish to seek out the [components] for me?");
	}
	if($text=~/components/i){
	# Disciple Symbol of Brell Serilis
		quest::say("Excellent lad! Let meh see here if I can remembur correctly. I know that you need Preserved hops and a Battleworn cantine. I know that these were carried by my good friend Torklar back when I was still a young lad training like you. However one day he adventured to an undead estate with a friend of his that was a skilled brewer. I believe they went there in search of some ingredients they needed for a recipe however neither of them ever returned. But before you go any further I must tell ye that you will need a specific kind of [cask] to combine these items in.");
	}
	if($text=~/cask/i){
	# Disciple Symbol of Brell Serilis
		quest::say("Why a holy cask is what ye will need of course! Find the ingredients that I asked you for before and combine them within this holy cask along with barley from the forests of Kithicor and water summoned from none other then yourself. After doing this if the gods have smiled upon you a thick and hearty keg of Brells Blessed Stout will be created. Give this to me along with a Rat sandwich to enjoy while I sip the finest of ales as well as your initiate symbol that you carry now and I will be sure to reward you.");
		# Summon: holy cask (SQL Submitted)
                quest::summonitem(17070);
	}
}

sub EVENT_ITEM {
	# Handin: Dwarven Ale, Elven Wine, Freeport Stout, a note to Taldril
 	if(plugin::check_handin(\%itemcount, 13036 => 1, 13035 => 1, 13943 => 1, 2429 => 1)){ 
	# Disciple Symbol of Brell Serilis
		quest::say("Ah ha! So ye are Bronlors chosen aye? Well den these fine brews can only mean one thing! Yep its dat youre a drinker like meh! Arg, if I only had me [recipe].");
	}
	# Handin: Keg of Brells Blessed Stout, Rat Sandwich, Initiate Symbol of Brell Serilis
	elsif(plugin::check_handin(\%itemcount, 2440 => 1, 13474 => 1, 1430 => 1)){ 
	# Disciple Symbol of Brell Serilis (End)
		quest::say("Ye are a true Priest of Brell Serilis! And ye make me both proud and happy to have met ye so that I could enjoy this sweet drink once again! Please take this Disciple Symbol of Brell Serilis which I have crafted to enable tyou to turn water into this blessed ale for you have truly earned it! And when ye are ready for your next step come back and visit!");
		# Summon: Disciple Symbol of Brell Serilis
		quest::summonitem(1431); 
	}
	plugin::return_items(\%itemcount);
}


# Spoiler: Ingredient Locations & Combines
#-----------------------------------------
# Holy Cask (Container)
# Preserved Hops (Ingredient)(undead brewer in the Estate of Unrest)
# Battleworn Canteen (Ingredient)(Tolkar Balltemaster also in Unrest)
# Forest Barley (Ingredient)(puchased in Kithicor)
# Summoned: Globe of Water (Ingredient)
# A Keg of Brells Blessed Stout (Product)
#-----------------------------------------