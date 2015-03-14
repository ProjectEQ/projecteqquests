sub EVENT_SAY {
 if($text=~/hail/i){
  quest::say("Greetings! I am Drenic Garrison, Governor of Science here in Katta Castellum. I am currently involved in several scientific endeavors with the other governors and am in need of assistance supplying my researchers with the proper [materials and samples] for their studies.");
 }
 elsif($text=~/materials and samples/i){
  quest::say("The Magus Conlegium are assisting with some studies on the physiology of the Vampyres of the Coterie of the Eternal Night and are in need of [ash and blood] samples. Maralicis Dilsm our Governor of Health is assisting in research on [counteragents] to the venom and diseases native to Luclin. Finally, there have been reports from the agents of Erikal Wolfeye that there is a civilation of [snake people] that live on the furthest reaches of the light side of Luclin in a region devoid of atmosphere.");
 }
 elsif($text=~/ash and blood/i){
  #Start of Vampyre Ash and Blood
  quest::say("Every four piles of vampyre ashes or four samples of vampyre blood that is collected should be delivered to Avir Sterbla in the Magus Conlegium. Avir is the Governor of Magician Studies and is currently working with Kellari Autumnfall, Lathin Firetree, and myself on developing better weapons and spells to battle the Coterie of the Eternal Night. Avir is zealous in his battle with the vampyres, he lost a relative to their wicked coterie many years ago.");
 }
 elsif($text=~/counteragents/i){
  #Start of Counteragents
  quest::say("Since our Empires first arrival on Luclin a citizen or in some cases several citizens occasionally fall victim to terrible diseases and toxins. The effects on our people were devastating at first but over the years we have become more accustomed to life on this moon. Still, if we were able to eradicate these diseases and poisons entirely many lives would be saved. The damp subterranean Fungus Grove and Paludal caverns are among the most infested areas. If you brave those dank passageways and return with a Muck Beetle Mandible, Black Fungal Fiend Spores, Green Fungal Fiend Spores, and a Grimfang Poison Sack I will gladly take them to the researchers for further study and experimentation.");
 }
 elsif($text=~/snake people/i){
  #Start of Undead Snake Organs
  quest::say("To the west beyond the Twilight Sea is an airless grey region between the light and dark sides of Luclin. Some time ago our scouts cooperating with powerful members of the Magus Conlegium attempted to chart the expanses of the barren treacherous region. During this excursion the scouts and magi encountered a small group of strange snake like men. The magi detected no magical aid that was allowing the creatures to move freely in the airless void without danger of suffocation. When approached the snake men quickly fled. We wish to know how these creatures survive in such conditions. If they prove to be a hostile species then we will have to resort to examining their [anatomy].");
 }
 elsif($text=~/anatomy/i){
  #Part of Undead Snake Organs
  quest::say("I wish to examine the lungs or whatever breathing organs these creatures have. It would not be prudent to hunt and kill a living member of this species and society we know practically nothing about but there are several undead snake men in the region as well. I will require three such organs however to perform the proper experiments.");
 }
}

sub EVENT_ITEM {
 #Handin: 1x Muck Beetle Mandible (10412), 1x Black Fungal Fiend Spores (10413), 1x Green Fungal Fiend Spores (10414), 1x Grimfang Poison Sac (10415)
 if(plugin::check_handin(\%itemcount, 10412 => 1, 10413 => 1, 10414 => 1, 10415 => 1)){
  #End of Counteragents
  quest::say("Excellent work, the Loyalist Empire is grateful for your assistance. Governor Maralicis and I will have our researchers resume their work on curing Luclin of its diseases.");
  quest::summonitem('31743'); #Mug of Purifying Tonic  
  quest::faction(206,10);  # +Magus Conlegium
  quest::faction(168,10);  # +Katta Castellum Citizens
  quest::faction(350,10);  # +Validus Custodus
  quest::faction(284,-10); # -Seru
  quest::faction(139,-10); # -Hand of Seru
  quest::faction(96,-10);  # -Eye of Seru
  quest::faction(138,-10); # -Hand Legionnaries
 }
 #Handin: 3x Shissar Organs (10416)
 if(plugin::check_handin(\%itemcount, 10416 => 3)){
  #End of Undead Snake Organs
  quest::say("Excellent work $name! The acquisition of these organs is a fantastic accomplishment!");
  quest::summonitem('31744'); #Amulet of the Grey Wastes 
  quest::faction(206,10);  # +Magus Conlegium
  quest::faction(168,10);  # +Katta Castellum Citizens
  quest::faction(350,10);  # +Validus Custodus
  quest::faction(284,-10); # -Seru
  quest::faction(139,-10); # -Hand of Seru
  quest::faction(96,-10);  # -Eye of Seru
  quest::faction(138,-10); # -Hand Legionnaries
 }
}


#Quest: Counteragents (Submitted By: Senzo)
#Quest: Undead Snake Organs (Submitted By: Senzo)
#Quest: Vampyre Ash & Blood (Submitted By: Senzo)