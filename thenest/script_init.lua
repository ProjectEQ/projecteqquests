local version = eq.get_zone_instance_version()
if version == instance_version.the_nest_in_the_shadows then
	eq.load_encounter("in_the_shadows")
elseif version == instance_version.the_nest_spiders_eye then
	eq.load_encounter("spiders_eye")
elseif version == instance_version.the_nest_web_of_lies then
	eq.load_encounter("web_of_lies")
elseif version == instance_version.the_nest_failed_expedition then
	eq.load_encounter("lost_comrades")
elseif version == instance_version.the_nest_rivals then
	eq.load_encounter("rivals")
elseif version == instance_version.the_nest_clues then
	eq.load_encounter("clues")
elseif version == instance_version.the_nest_circle_of_drakes then
	eq.load_encounter("circle_of_drakes")
elseif version == instance_version.the_nest_dragons_egg then
	eq.load_encounter("dragons_egg")
elseif version == instance_version.the_nest_stopping_firionas_henchmen then
	eq.load_encounter("rival_party")
elseif version == instance_version.the_nest_scrap_metal then
	eq.load_encounter("scrap_metal")
elseif version == instance_version.the_nest_curse_of_jurek then
	eq.load_encounter("the_curse_of_jurek")
else
	eq.load_encounter("tshara")
end
