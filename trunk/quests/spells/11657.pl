sub EVENT_SPELL_EFFECT_CLIENT {
$newrace = quest::ChooseRandom(469,473,464,82,456,367,485,454,471,46,63,339,342,338,341,340,331,433,436,455,458,470,472);
	
	quest::playerrace($newrace);
	if($newrace > 330 && $newrace < 343){
		quest::playergender(quest::ChooseRandom(0,1));
	}
}