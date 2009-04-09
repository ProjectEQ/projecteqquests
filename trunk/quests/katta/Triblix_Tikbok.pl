sub EVENT_SAY {
 if($text=~/hail/i){
  quest::say("Pleasure to meet ya! Have you come to the Illuminarium Industria to gaggle about or have you come looking for [some work]?");
 }
 elsif($text=~/some work/i){
  quest::say("Well in that case I sure could use the assistance of a powerful $race such as yourself. You see my job here is to construct the lighting for Katta Castellum and Im always in need of more supplies. I need a fresh supply of [zelniak oil] for the standard city street lanterns and a fresh supply of [acrylian phosphate] to construct more phosporous lanterns and torches.");
 }
 elsif($text=~/acrylian phosphate/i){
  #Start of Acrylia Phosphate
  quest::say("Acrylian phosphate is an uncommon mineral deposit containing the same mineral compound that provides acrylia ore with its self luminescence. The acrylian phosphate also burns very well and at extremely high temperatures for very long periods of time. I will trade with you for every four piles of acrylian phosphate you can supply me.");
 }
 elsif($text=~/zelniak oil/i){
  #Start Zelniak Oil
  quest::say("Zelniaks are strange creatures that live on the light side of Luclin. Their fat can be boiled in a brew barrel with a flask of water and poured into an empty bottle to produce an oil that is an excellent fuel for lanterns. I will trade for every four bottles of zelniak oil you produce for me.");
 }
}

sub EVENT_ITEM {
 #Handin: 4x Acrylian Phosphate (10690)
 if(plugin::check_handin(\%itemcount, 10690 => 4)){
  #End of Acrylia Phosphate
  quest::summonitem('2596'); #Phosphorous Torch
 }
 #Handin: 4x Zelniak Oil (10691)
 elsif(plugin::check_handin(\%itemcount, 10691 => 4)){
  #End of Zelniak Oil
  quest::say("Thank you $name! It would be pretty hard to see around here if we didnt keep the fires burning, it never being daytime and all.");
  quest::summonitem('10694'); #Combine Fire Flask
  quest::faction(206,10); # +Magus Conlegium
  quest::faction(168,10); # +Katta Castellum Citizens
  quest::faction(350,10); # +Validus Custodus
  quest::faction(37,-10); # -Citizens of Seru
  quest::faction(284,-10); # -Seru
  quest::faction(298,-10); # -Shoulders of Seru
  quest::exp(500);
  quest::givecash(0,0,1,0); 
 }
}


#Submitted By: Senzo