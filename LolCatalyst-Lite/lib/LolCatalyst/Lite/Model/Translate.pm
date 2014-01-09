package LolCatalyst::Lite::Model::Translate;

use strict;
use warnings;
use parent 'Catalyst::Model';

use Acme::LOLCAT ();
use Memoize;
memoize ('translate');

sub translate {
    my ($self, $text) = @_;
    return Acme::LOLCAT::translate($text);
}

1;
