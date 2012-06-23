#Meldrath's_Paige script for GM event, actually written by nork! OMG!

sub EVENT_SAY {
	if ($status >= 80 && $text=~/Hail/i) {
	quest::say ("All subvertents will be converted! Meldrath is your new lord and master! All who resist shall be punished!"); 
	}
if ($status >= 80 && $text=~/who the hell is meldrath/i) {
	quest::say ("Blasphemer! Meldrath is the king of all gnomes! The god of tinkering.... The guy I'm here representing? Wow, you guys really dont get out much do you? Surrender or die shorties!");
	}
if ($status >= 80 && $text=~/We shall never surrender/i) {
        quest::say ("That does it! Your in trouble now! Im telling Meldrath!"); 
	quest::emote ("scurries off to tell his master, blabbering about how great he is and how mean you are."); 
	quest::ze (14, "You hear the sound of grinding metal, the earth begins to shake as the mechanised army of Meldrath aproaches.");

	quest::spawn2 (56173,0,0,700,-1224.3,-107.9,125.4);
	quest::spawn2 (56173,0,0,650,-1224.3,-108.9,125.4);
	quest::spawn2 (56173,0,0,600,-1224.3,-108.9,125.4);
	quest::spawn2 (56173,0,0,550,-1224.3,-107.9,125.4);
	quest::spawn2 (56173,0,0,500,-1224.3,-107.9,125.4);
	quest::spawn2 (56173,0,0,450,-1224.3,-107.9,125.4);
	}

if ($status >= 80 && $text=~/your forces are deafeated/i) {
	quest::say ("Oh really? Look out unto the battlefield!");
	quest:emote ("begins to cackle wildly");
if ($entitylist -> GetMobByNpcTypeId(56173) == undef){
	quest::ze (14, "The scattered and scarred remains of Meldraths minions begin to crawl together twisting and contorting into a new and deadly shape"); 
	quest::spawn2 (56174,0,0,700,-1224.3,-107.9,125.4);
	quest::spawn2 (56174,0,0,600,-1224.3,-108.9,125.4);
	quest::spawn2 (56174,0,0,450,-1224.3,-107.9,125.4);
	}
}

if ($status >= 80 && $text=~/you shall not break our defense/i) {
	quest::say ("Now you have done it! Surely the pinicale of tinkering robotics! An Austrian action filmstar shall make you grovel!");
	quest:emote ("starts to cower under the shadow of the mechanical monster");
if ($entitylist -> GetMobByNpcTypeId(16174) == undef){
	quest::spawn2 (56175,0,0,600,-1224.3,-108.9,125.4);
	quest::ze (14, "The scrap metal, allthough broken and shattered, begins to form into a terrifying construct of metal and oil");
	}
}
}

	

