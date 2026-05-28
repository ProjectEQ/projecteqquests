local function hotzone(e)
	local month_set_1 = {
		[1] =  {"Befallen"            ,"5-20" },
		[2] =  {"Howling Stones"      ,"40-60"},
		[3] =  {"Crypt of Dalnir"     ,"25-35"},
		[4] =  {"Frontier Mountains"  ,"20-45"},
		[5] =  {"Lower Guk"           ,"30-50"},
		[6] =  {"Iceclad"             ,"25-45"},
		[7] =  {"Lake of Ill Omen"    ,"1-55" },
		[8] =  {"North Karana"        ,"5-40" },
		[9] =  {"West Karana"         ,"5-35" },
		[10] = {"Solusek Eye"         ,"10-30"},
		[11] = {"South Ro"            ,"5-25" },
		[12] = {"Wakening Lands"      ,"40-55"},
		[13] = {"Plane of Disease"    ,"45-60"},
		[14] = {"Velketor"            ,"45-65"},
		[15] = {"Akheva Ruins"        ,"45-65"},
		[16] = {"Riwwi"               ,"55-65"},
		[17] = {"Bastion of Thunder"  ,"55-70"},
		[18] = {"Plane of Air"        ,"65-70"},
		[19] = {"Riftseekers"         ,"69-70"},
		[20] = {"Broodlands"          ,"40-60"},
		[21] = {"Mistmoore Catacombs" ,"15-70"}
	}

	local month_set_2 = {
		[1] =  {"Beholder"           ,"10-25"},
		[2] =  {"Commons"            ,"1-40" },
		[3] =  {"East Karana"        ,"10-35"},
		[4] =  {"Frozen Shadow"      ,"30-55"},
		[5] =  {"Upper Guk"          ,"5-30" },
		[6] =  {"Kaesora"            ,"30-50"},
		[7] =  {"Lake Rathetear"     ,"15-25"},
		[8] =  {"Oasis"              ,"5-40" },
		[9] =  {"RunnyEye"           ,"10-35"},
		[10] = {"Nagafens Lair"      ,"40-55"},
		[11] = {"Stonebrunt"         ,"15-40"},
		[12] = {"Warrens"            ,"5-30" },
		[13] = {"Chardok"            ,"40-60"},
		[14] = {"Plane of Nightmare" ,"45-65"},
		[15] = {"The Deep"           ,"50-60"},
		[16] = {"Veksar"             ,"40-65"},
		[17] = {"Paw"                ,"15-35"},
		[18] = {"Kodtaz"             ,"65-70"},
		[19] = {"Draniks Scar"       ,"30-55"},
		[20] = {"Stillmoon"          ,"55-70"},
		[21] = {"Deepest Guk"        ,"15-70"},
		[22] = {"Takish-Hiz"         ,"15-70"}
	}

	local month_set_3 = {
		[1] =  {"Burning Woods"            ,"35-50"},
		[2] =  {"Crystal Caverns"          ,"25-45"},
		[3] =  {"Plane of Hate"            ,"45-65"},
		[4] =  {"Great Divide"             ,"30-50"},
		[5] =  {"The Hole"                 ,"40-65"},
		[6] =  {"Kerra Isle"               ,"10-25"},
		[7] =  {"Najena"                   ,"20-35"},
		[8] =  {"Permafrost Keep"          ,"15-50"},
		[9] =  {"Sirens Grotto"            ,"50-65"},
		[10] = {"South Karana"             ,"15-35"},
		[11] = {"Timorous Deep"            ,"15-50"},
		[12] = {"Warsliks Woods"           ,"1-30" },
		[13] = {"Sebilis"                  ,"40-60"},
		[14] = {"Crypt of Nadox"           ,"50-65"},
		[15] = {"Thundercrest"             ,"60-70"},
		[16] = {"Barindu"                  ,"55-65"},
		[17] = {"Halls of Honor"           ,"60-65"},
		[18] = {"Plane of Water"           ,"65-70"},
		[19] = {"Solusek C"                ,"50-65"},
		[20] = {"Muramite Proving Grounds" ,"65-70"},
		[21] = {"Rujarkian Hills"          ,"15-70"},
		[22] = {"Miragul`s Menagerie"      ,"15-70"}
	}

	local day_of_month	= tonumber(os.date("%d"));
	local popup_table	= "";
	local day_cycle		= nil;

	popup_table = popup_table .. eq.popup_table_row(
		eq.popup_table_cell(eq.popup_color_message("cyan", "Zone Name")) ..
		eq.popup_table_cell(eq.popup_color_message("lime_green", "Level Range"))
	);

	if day_of_month >= 1 and day_of_month <= 10 then

		for i = 1, #month_set_1 do
			popup_table = popup_table .. eq.popup_table_row(
				eq.popup_table_cell(eq.popup_color_message("white", month_set_1[i][1])) ..
				eq.popup_table_cell(eq.popup_color_message("white", month_set_1[i][2]))
			);
		end
		day_cycle = "Days 1-10"
	elseif day_of_month >= 11 and day_of_month <= 20 then
		for i = 1, #month_set_2 do
			popup_table = popup_table .. eq.popup_table_row(
				eq.popup_table_cell(eq.popup_color_message("white", month_set_2[i][1])) ..
				eq.popup_table_cell(eq.popup_color_message("white", month_set_2[i][2]))
			);
		end
		day_cycle = "Days 11-20"
	else
		for i = 1, #month_set_3 do
			popup_table = popup_table .. eq.popup_table_row(
				eq.popup_table_cell(eq.popup_color_message("white", month_set_3[i][1])) ..
				eq.popup_table_cell(eq.popup_color_message("white", month_set_3[i][2]))
			);
		end
		day_cycle = "Days 21-31"
	end

	popup_table = eq.popup_table(popup_table)

	eq.popup("Current Hotzones for days: " .. day_cycle, popup_table)
end

return hotzone;
