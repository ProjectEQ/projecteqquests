sub EVENT_SPAWN {
	if ($npc->GetRace() == 330 and not $npc->GetCleanName() eq 'Tolapumj') {
		my $oTex = $npc->GetTexture();
		$npc->SetGender(int(rand(2)));
		$npc->SetTexture($oTex);
	}
}
