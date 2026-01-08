# quests/ponightmare/202365.pl
# 202365 -- #Planar_Projection (Hedge Event)
# Grants only the "Construct of Nightmares" flag and displays confirmation text
# DEBUG-safe, compiles under strict

use strict;
use warnings;

# EQEmu globals that must be declared when using strict
our ($npc, $client, $entity_list, $x, $y, $z, $h, $text, $timer);
our %qglobals;

my $DEBUG = 1;  # set to 0 to silence debug chatter

sub dmsg_zone {
    my ($msg) = @_;
    return unless $DEBUG;
    quest::we(15, "[PP-DBG] $msg");
}

sub dmsg_client {
    my ($c, $msg) = @_;
    return unless $DEBUG;
    return unless $c;
    $c->Message(13, "[PP-DBG] $msg");
}

sub EVENT_SPAWN {
    my $ntid = $npc->GetNPCTypeID();
    my $iid  = quest::GetInstanceID("ponightmare");
    my $hx   = defined $h ? $h : 0;

    dmsg_zone("Spawned PP (npc_type_id=$ntid, EXPECT=202365) at ($x, $y, $z, h=$hx) in instance_id=$iid");
    if ($ntid != 202365) {
        dmsg_zone("WARNING: Running on npc_type_id=$ntid, not 202365. Check npc_types name/file mapping.");
    }

    quest::settimer("depop", 3000); # 50 minutes
}

sub EVENT_TIMER {
    if ($timer eq "depop") {
        quest::stoptimer("depop");
        dmsg_zone("Timer depop firing. PP despawning.");
        quest::depop();
    }
}

sub EVENT_SAY {
    return unless ($text =~ /hail/i);
    return unless defined $client;

    my $name   = $client->GetCleanName();
    my $accid  = $client->AccountID();
    my $charid = $client->CharacterID();

    my $pre  = defined $qglobals{pop_pon_hedge_jezith} ? $qglobals{pop_pon_hedge_jezith} : 'undef';
    my $cons = defined $qglobals{pop_pon_construct}     ? $qglobals{pop_pon_construct}     : 'undef';

    dmsg_client($client, "HAIL: preflag(pop_pon_hedge_jezith)=$pre, construct(pop_pon_construct)=$cons; acct=$accid, char=$charid");

    # Require Adroha preflag
    if (!defined $qglobals{pop_pon_hedge_jezith}) {
        quest::say("You are not yet prepared to face the nightmares of this plane. Seek Adroha Jezith in the Plane of Tranquility.");
        dmsg_client($client, "DENY: missing preflag pop_pon_hedge_jezith.");
        return;
    }

    # Already flagged?
    if (defined $qglobals{pop_pon_construct}) {
        quest::say("You have already triumphed over the Construct of Nightmares. The nightmare no longer holds power over you.");
        dmsg_client($client, "NO-OP: already has pop_pon_construct.");
        return;
    }

    # Award the Construct flag
    quest::say("Your victory over the Construct of Nightmares echoes through the dream. You feel your soul strengthen.");
    quest::setglobal("pop_pon_construct", 1, 5, "F");
    dmsg_client($client, "SET pop_pon_construct=1 for $name (acct=$accid, char=$charid).");

    # Classic-style confirmation messages
    $client->Message(15,  "You have received a new character flag!");
    $client->Message(257, "You have defeated the Construct of Nightmares!");
    quest::we(15, "$name has triumphed over the Construct of Nightmares!");

    quest::settimer("depop", 30); # quick cleanup
}
