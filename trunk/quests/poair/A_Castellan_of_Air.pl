sub EVENT_AGGRO {
	quest::emote("takes form with weapons drawn and begins to pursue you.");
}

sub EVENT_DEATH {
	quest::emote("corpse keels over and falls into numerous pieces of dented armor");

        $x = $npc->GetX();
        $y = $npc->GetY();
        $z = $npc->GetZ();

	quest::spawn2(215063,0,0,$x-5,$y,$z);
	quest::spawn2(215063,0,0,$x+5,$y,$z);
	quest::spawn2(215063,0,0,$x,$y+5,$z);
}
