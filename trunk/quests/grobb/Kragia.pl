sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("'Mez got secretz!'  Kragia's eyes glint with menace.  'Mez bet yoo wantz to know my [secretz]!'");
}
if($text=~/what secretz/i){
quest::say("'The Dark Stranger!  He show me how to make some...' Kragia cackles. '...some fingz for hurti and bashin!'  Kragia grins. and brandishes a long sword that crackles with an energy of its own.  'Yoo need to [work] dem weaponz. and den [finish] dem!'");
}
if($text=~/what work/i){
quest::say("'Trollz. we'z always gud at recycling scrap!  Take your [old weapon] and den use a smithy hammer to bash in two sheetz of dem magic [acrylia ore]. wiv a special [mold]!  Yooz have to use da special Grobb forge.'");
}
if($text=~/what acrylia ore/i){
quest::say("'He show me some real gud metal. he sayz it come from far away.  It look funny to me!  He tellz me dat a block of it. and a smithy hammer and water. can make dem sheet.  Den. wiv dat sheet. yoo use yer hammer again but wiv [magical temper] dis time.'");
}
if($text=~/what mold/i){
quest::say("'Each of dem weaponz needs a special mold.  Yooz try a Short Blade. Curved Blade. Thin Blade. Dagger Blade. Long Blade. Mace Head. Hammer Head or Large Kite Shield mold.  Da stickz need an Oak Shaft. and da Orb needz some Oakmoss!'");
}
if($text=~/what magical temper/i){
quest::say("'Dis is some magical stuffz!'  Kragia's eyes dart about. 'Mez not know how yooz make it. mez just use what he give mez.'");
}
if($text=~/what old weapon/i){
quest::say("'The Dark Stranger. he tellz me dat...' Kragia furrows his brow with concentration. 'Shortsword of the Ykesha. Runed Falchion. Electrum-Bladed Wakizashi. Obsidian Shard. Gigantic Zweihander. Enamelled Black Mace. Sharkbone Warhammer. Glowing Wooden Crook. Staff of the Observer. Crested Mistmoore Shield. Shimmering Orb - dem all good!'");
}
if($text=~/what finish/i){
quest::say("'Dis da fun bit!  In da special forge. yooz put in da worked weapon and use chisel and file. wiv some [bile temper]!  Yooz make weaponz as gud as Kragia!'  Kragia leans over to you and whispers loudly. 'Yooz can also make dem magical wiv imbued shinystonez.  Dey really gud!'");
}
if($text=~/what bile temper/i){
quest::say("'Dis da special brew for trollz. wez alwayz use it!  Youz make da Special Brew from water. froglok tongue. cask and malt.  Den youz mix dat Special Brew wiv Swampy Veggies and dem Mushroomz from da swamp.'"); }
}
#END of FILE Zone:grobb  ID:3097 -- Kragia 

