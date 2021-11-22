# --
# Copyright (C) 2019–present Efflux GmbH, https://efflux.de/
# Part of the CustomCSS package.
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package Kernel::Modules::AdminCustomCSS;

use strict;
use warnings;

our $ObjectManagerDisabled = 1;

sub new {
    my ($Type, %Param) = @_;

    my $Self = {%Param};
    bless($Self, $Type);

    return $Self;
}

sub Run {
    my ($Self, %Param) = @_;

    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $ParamObject  = $Kernel::OM->Get('Kernel::System::Web::Request');
    my $XMLObject    = $Kernel::OM->Get('Kernel::System::XML');
    my $CacheObject  = $Kernel::OM->Get('Kernel::System::Cache');


    if ($Self->{Subaction} eq 'AddAction') {
        $LayoutObject->ChallengeTokenCheck();

        my $CSSField = $ParamObject->GetParam(Param => 'CSSField') || '';

        # Flush old CSS.
        $XMLObject->XMLHashDelete(
            Type => 'CustomCSS',
            Key  => '1'
        );

        # Update new CSS.
        $XMLObject->XMLHashAdd(
            Key     => 1,
            Type    => 'CustomCSS',
            XMLHash => [({'Content' => $CSSField})]
        );

        # Delete Cache.
        $CacheObject->Delete(
            Type => 'CustomCSS',
            Key  => '1'
        );
    
        return $LayoutObject->Redirect(OP => "Action=AdminCustomCSS");  # Prevent from resubmitting.
    } else {
        $Param{Action} = 'Add';

        # Get the current CSS.
        my @XMLHash = $XMLObject->XMLHashGet(
            Type => 'CustomCSS',
            Key  => '1'
        );

        $Param{'CSSField'} = $XMLHash[0]{'Content'};

        $LayoutObject->Block(
            Name => 'Overview',
            Data => \%Param
        );

        # Create the CodeMirror editor.
        $LayoutObject->SetRichTextParameters(
            Data => {
                %Param,
                RichTextHeight => '600',
                RichTextWidth  => '99%',
                RichTextType   => 'CodeMirror'
            }
        );

        return  $LayoutObject->Header() .
                $LayoutObject->NavigationBar() . 
                $LayoutObject->Output(
                    TemplateFile => 'AdminCustomCSS',
                    Data         => \%Param
                ) . $LayoutObject->Footer();
    }
}

1;
