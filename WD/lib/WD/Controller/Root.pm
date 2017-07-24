package WD::Controller::Root;

use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

__PACKAGE__->config(namespace => '');


sub app_root : Path : Args(0) {
    # Site root - http://whistlingdog.com/
    my ( $self, $c ) = @_;

    my $language = 'en';

    $c->stash(
        'req_page'  => 'index',
        'lang'      => $c->model('DB')->schema->GLOBAL_LANG->{$language},
        'template'  => 'whistlingdog/index.tt',
    );
}


sub default : Path {
    # Default 404
# TODO: redirect or search?
    my ( $self, $c ) = @_;
    $c->response->body( 'Page not found' );
    $c->response->status(404);
}


sub end : ActionClass('RenderView') {
    my ($self, $c) = @_;

    my $errors = scalar @{$c->error};

    if ($errors) {
        $c->log->error("Errors in ${\$c->action}:");
        $c->log->error($_) for @{$c->error};

        $c->res->status(500);
        $c->res->body('internal server error');
        $c->clear_errors;
    }
}


__PACKAGE__->meta->make_immutable;

1;
