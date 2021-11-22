# --
# Copyright (C) 2019–present Efflux GmbH, https://efflux.de/
# Part of the CustomCSS package.
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package Kernel::Output::HTML::FilterElementPost::CustomCSS;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::System::XML',
    'Kernel::System::Cache'
);

sub new {
    my ($Type, %Param) = @_;

    my $Self = {};
    bless($Self, $Type);

    return $Self;
}

sub Run {
    my ($Self, %Param) = @_;

    my $CacheObject = $Kernel::OM->Get('Kernel::System::Cache');

    my $CSS = $CacheObject->Get(
        Type => 'CustomCSS',
        Key  => '1'
    );

    if (!$CSS) {
        my $XMLObject = $Kernel::OM->Get('Kernel::System::XML');

        # Get CSS from DB. 
        my @XMLHash = $XMLObject->XMLHashGet(
            Type => 'CustomCSS',
            Key  => '1'
        );
        $CSS = $XMLHash[0]{'Content'};

        # Only cache if there is something to cache.
        if ($CSS) {
            $CacheObject->Set(
            Type  => 'CustomCSS',
            Key   => '1',
            TTL   => 60 * 60 * 24 * 20,
            Value => $CSS
            );
        }
    }

    # Only return if something exists.
    ${$Param{Data}} =~ s{</body>}{<style>$CSS</style></body>}smx if ($CSS);

    return 1;
}

1;
