package LolCatalyst::Lite::Controller::Root;
#use Moose;
use strict;
use warnings;

#use namespace::autoclean;
use parent 'Catalyst::Controller';


#BEGIN { extends 'Catalyst::Controller' }

__PACKAGE__->config(namespace => '');


sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

}

sub default :Path {
    my ( $self, $c ) = @_;
    $c->response->body( 'Page not found' );
    $c->response->status(404);
}


sub translate : Local {
    my ($self, $c) = @_;
    my $lol = $c->req->body_params->{lol};
    $c->stash(
        lol => $lol,
        result => $c->model('Translate')->translate($lol),
        template => 'index.tt',
        );
}

sub translate_service : Local {
    my ($self, $c) = @_;
    $c->forward('translate');
    $c->stash->{current_view} = 'Service';
}


#sub end : ActionClass('RenderView') {}
sub end : ActionClass('RenderView') {
    my ($self, $c) = @_;
    my $errors = scalar @{$c->error};
    if ($errors) {
        $c->res->status(500);
        $c->res->body('internal server error');
        $c->clear_errors;
    }


}

##__PACKAGE__->meta->make_immutable;

1;
