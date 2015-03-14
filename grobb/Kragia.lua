-- Converted to .lua by Speedz
-- added saylink by robregen

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Mez got secretz!'  Kragia's eyes glint with menace.  'Mez bet yoo wantz to know my [" .. eq.say_link("secretz",false,"secretz") .. "]!");
	elseif(e.message:findi("secretz")) then
		e.self:Say("The Dark Stranger!  He show me how to make some...' Kragia cackles. '...some fingz for hurti and bashin!'  Kragia grins. and brandishes a long sword that crackles with an energy of its own.  'Yoo need to [work] dem weaponz. and den [" .. eq.say_link("finish",false,"finish") .. "] dem!");
	elseif(e.message:findi("work")) then
		e.self:Say("Trollz. we'z always gud at recycling scrap!  Take your [" .. eq.say_link("old weapon",false,"old weapon") .. "] and den use a smithy hammer to bash in two sheetz of dem magic [" .. eq.say_link("acrylia ore",false,"acrylia ore") .. "]. wiv a special [" .. eq.say_link("mold",false,"mold") .. "]!  Yooz have to use da special Grobb forge.");
	elseif(e.message:findi("acrylia ore")) then
		e.self:Say("He show me some real gud metal. he sayz it come from far away.  It look funny to me!  He tellz me dat a block of it. and a smithy hammer and water. can make dem sheet.  Den. wiv dat sheet. yoo use yer hammer again but wiv [" .. eq.say_link("magical temper",false,"magical temper") .. "] dis time.");
	elseif(e.message:findi("mold")) then
		e.self:Say("Each of dem weaponz needs a special mold.  Yooz try a Short Blade. Curved Blade. Thin Blade. Dagger Blade. Long Blade. Mace Head. Hammer Head or Large Kite Shield mold.  Da stickz need an Oak Shaft. and da Orb needz some Oakmoss!");
	elseif(e.message:findi("magical temper")) then
		e.self:Say("Dis is some magical stuffz!'  Kragia's eyes dart about. 'Mez not know how yooz make it. mez just use what he give mez.'");
	elseif(e.message:findi("old weapon")) then
		e.self:Say("The Dark Stranger. he tellz me dat...' Kragia furrows his brow with concentration. 'Shortsword of the Ykesha. Runed Falchion. Electrum-Bladed Wakizashi. Obsidian Shard. Gigantic Zweihander. Enamelled Black Mace. Sharkbone Warhammer. Glowing Wooden Crook. Staff of the Observer. Crested Mistmoore Shield. Shimmering Orb - dem all good!");
	elseif(e.message:findi("finish")) then
		e.self:Say("Dis da fun bit!  In da special forge. yooz put in da worked weapon and use chisel and file. wiv some [" .. eq.say_link("bile temper",false,"bile temper") .. "]!  Yooz make weaponz as gud as Kragia!'  Kragia leans over to you and whispers loudly. 'Yooz can also make dem magical wiv imbued shinystonez.  Dey really gud!");
	elseif(e.message:findi("bile temper")) then
		e.self:Say("Dis da special brew for trollz. wez alwayz use it!  Youz make da Special Brew from water. froglok tongue. cask and malt.  Den youz mix dat Special Brew wiv Swampy Veggies and dem Mushroomz from da swamp.");
	end
end
