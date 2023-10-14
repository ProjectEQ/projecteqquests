#!/usr/bin/perl

sub soulbinder_say {
	my $text = shift;
	my $client = plugin::val('$client');
	my $name = $client->GetName();
	my $color = 4; # Light Blue

	if ($text=~/hail/i) {
		quest::say("Greetings, ${name}. When a hero of our world is slain, their soul returns to the place it was last bound and the body is reincarnated. As a member of the Order of Eternity, it is my duty to [bind your soul] to this location if that is your wish.");
	}
	elsif ($text=~/bind.*soul/i) {
		quest::doanim(42);
		quest::selfcast(2049);
		$client->Message($color, "You feel yourself bind to the area.");
	}
}
