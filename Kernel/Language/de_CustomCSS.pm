# --
# Copyright (C) 2019–present Efflux GmbH, https://efflux.de/
# Part of the CustomCSS package.
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::de_CustomCSS;

use strict;
use warnings;
use utf8;

sub Data {
	my $Self = shift;

	$Self->{Translation}->{'Custom CSS'} = 'Eigener CSS';
	$Self->{Translation}->{'Add custom CSS code to the system.'} = 'Eigenen CSS-Code in das System hinzufügen.';
	$Self->{Translation}->{'Manage CSS'} = 'CSS-Verwaltung';
	$Self->{Translation}->{'CSS for agents'} = 'CSS für Agenten';
	$Self->{Translation}->{'This CSS code will be executed on all pages for agents.'} = 'Dieser CSS Code wird auf allen Agenten-Seiten ausgeführt.';
	$Self->{Translation}->{'*will be added to the bottom of the editor.'} = '*werden ans Ende des Editors hinzugefügt.';
	$Self->{Translation}->{'You should make a backup before a major update. You can use the build in export function.'} = 'Vor einem Major-Update sollten Sie eine Sicherheitskopie erstellen. Dafür können Sie die eingebaute Export-Funktion verwenden.';
	$Self->{Translation}->{'Preview'} = 'Vorschau';
	$Self->{Translation}->{'Article Overview'} = 'Artikelübersicht';
	$Self->{Translation}->{'Export as .css'} = 'Als .css exportieren';
	# Templates
	$Self->{Translation}->{'Colors for priorities'} = 'Farben für Prioritäten';
	$Self->{Translation}->{'Colors for the article overview'} = 'Farben für die Artikelübersicht';
}

1;
