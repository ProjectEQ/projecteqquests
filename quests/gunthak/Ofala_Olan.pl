#Ofala_Olan.pl
#Started by Angelox, finished by Kilelen
#Leviathan Eyes/Scryer's Trespass

sub EVENT_SAY { 
	if ($text=~/Hail/i){
		if ($class eq "Enchanter"){
			quest::say("Salutations! It is nice to see one such as you in these parts; I do get lonely for some intelligent conversation around here once in awhile. The majority of the time however, I am much too preoccupied [researching]. There are so many interesting things to discover in a new area!");
		}
		else{
			quest::emote("glances up from the book she is reading and looks you over. 'If you are looking for the. . . Ahem. . . Library, it is the building to my right.  Now if you'll excuse me I have some reading to do..");
		}
	}
	if ($text=~/researching/i){
		quest::say("Many things actually. The very land of this island has interesting peculiarities due to the foreign plant life and substances the pirates have introduced into the ecology. I have been working most specifically on deciphering what portions of the strange materials may hold magical properties that could be useful to our work as Enchanters. Why, just the other day I believe I was on the verge of a great breakthrough with some odd substances I had mixed together, unfortunately I was careless and did not seal the vial tightly enough. When I awoke the next morning the [specimen] had completely evaporated.");
	}
	if ($text=~/specimen/i){
		quest::say("Among some of the substances I was experimenting with, I began to notice some peculiar attributes. I noticed some of the dark priests taking cuttings from certain mushrooms, and began experimenting with that first. I discovered that they could be boiled into a salve that had the most wondrous properties for the eyes! (sighs) It will take me ages to get the [necessary components] back to pick up where I left off on that particular spell, not to mention the research that I am compiling for my [brother] to assist with his specialties. I have enough material here to keep me swamped for ages, those spells will just have to wait!");
	}
	if ($text=~/necessary components/i){
		quest::say("Well, I believe that with two specific substances I can concoct a potion that will give certain effects for a specific amount of time. If I have these components I believe I have the understanding to capture the essence of them within a spell, so that the effects may be recalled at will. For this I would need the stalk of one of the local mushrooms, they secrete a fluid that is useful. I also need a mermaid scale from a mermaid here in the Gulf. Are you still willing to [assist] with this?");
	}
	if ($text=~/assist/i){
		quest::say("Take this vial with you then to contain the items that I have requested. Once you have them trapped inside, blend them together by sealing the bottle and shaking gently. Then bring it to me and I will see what I can do about finishing the task. Should the mixture prove true and I unlock the secret of the potion, I will share it with you for your efforts. Be very careful however, as always in dealing with items that we are not yet fully familiar with, the materials may prove dangerous!");
		quest::summonitem(17889);#A Dusty Glass Vial
	}
	if ($text=~/brother/i){
		quest::say("My brother is also an accomplished enchanter by the name of Stofo Olan. He has been hard at work in Erudin researching for his teacher Jeb Lumsed. He has a keen sense for the properties of stone and other such solid objects. For some time now he has been attempting to harness the power of stone for use in some form of mind control, that could be activated through a piece of jewelry. Entirely by accident, it seems that such a substance has been in use on this island for some time. It is very dangerous however, and as such most of my work has been based in theories tossed back and forth between he and I. Are you [interested] in this [strange rock] as well?");
	}
	if ($text=~/strange rock/i){
		quest::say("What a small world! I have skill with gem setting as many of our kind do, although I am afraid my specialties lie more with other types of elements and power. There have been stories of miners down in the Torgiran Mines losing their wits or becoming near zombie like in their actions. I have a hunch that whatever is doing this is being harvested there. Take good care down there, I fear that the miners themselves may not be too friendly. Travel into the mines and bring me two chunks of whatever the ore is that they are gathering, be sure it is of the type that glows brightly. Most likely the miners will have a few samples, but their masters probably have a few as well. Bring these to me with an enchanted bar of gold and I can fashion a test ring from it. Be careful!");
	}
}
sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 54025 => 1)) {#Swirling Vial
    quest::emote("takes the vial gently from your hands and begins murmuring quietly. Thick incense smoke moves lazily through the air as she works, curling about and hanging onto your clothing. The strange liquid inside the vial begins to glow a deep red and seemingly moves of its own volition. Ofala quickly smears a bit of the substance about her eyes and looks up at you. 'We have solved it! I believe I can recall this again, let me get this down for you now before the spell wears. Use it well.' Withdrawing a fine quill from a pouch at her waist, she dips the tip into the swirling potion and scrawls out the words of a spell onto parchment.");
    quest::summonitem(59015);#Spell: Leviathan Eyes
    quest::exp(1107392);#1% of level 45 xp
  }
  elsif(plugin::check_handin(\%itemcount, 16506 => 1, 54006 => 2)) {#Enchanted Gold Bar, 2 Gleaming Zraxthril Ores
    quest::emote("eyes you with a new measure of respect. 'Very well done! I did not think you would be successful in this. Let me harness this energy quickly then you must have Stofo take a look at it!' Being careful not to touch the gems too much with her bare hands, Ofala Olan deftly crafts a slim golden band, crossing strands of gold across the dimly pulsing stones to bind them in place and protect the wearer from harm. 'He still holes himself up in that dim room in Erudin. I don't know HOW he studies like that, but take it to him please! I am sure he will be most interested.");
    quest::summonitem(54008);#A Dimly Glowing Ring
    quest::summonitem(54007);#Note to Stofo
  }
  else {
    quest::say("I don't need this."); #text made up
    plugin::return_items(\%itemcount);
    return 1;
  }
}#Done