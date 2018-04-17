package WD::Controller::Page;

use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

__PACKAGE__->config(namespace => '');


sub sparks : Chained('/') : PathPart('sparks-and-sticks') : Args(0) {
    my ($self, $c) = @_;

    my $language = 'en';
    $c->stash(
        'req_page' => 'sparks',
        'template' => 'whistlingdog/sparks-and-sticks.tt',
        'lang'     => $c->model('DB')->schema->GLOBAL_LANG->{$language},
    );
}


sub magic_richard : Chained('/') : PathPart('magic-richard') : Args(0) {
    my ($self, $c) = @_;

    my $language = 'en';
    $c->stash(
        'req_page' => 'magic',
        'template' => 'whistlingdog/magic-richard.tt',
        'lang'     => $c->model('DB')->schema->GLOBAL_LANG->{$language},
    );
}


sub magic_history : Chained('/') : PathPart('magic-history') : Args(0) {
    my ($self, $c) = @_;

    my $language = 'en';
    $c->stash(
        'req_page' => 'magic',
        'template' => 'whistlingdog/magic-history.tt',
        'lang'     => $c->model('DB')->schema->GLOBAL_LANG->{$language},
    );
}


sub magic_coney_island : Chained('/') : PathPart('magic-of-coney-island') : Args(0) {
    my ($self, $c) = @_;

    my $language = 'en';
    $c->stash(
        'req_page' => 'magic',
        'template' => 'whistlingdog/magic-of-coney-island.tt',
        'lang'     => $c->model('DB')->schema->GLOBAL_LANG->{$language},
    );
}


sub mm : Chained('/') : PathPart('magical-melodions') : Args(0) {
    my ($self, $c) = @_;

    my $language = 'en';
    $c->stash(
        'req_page' => 'mm',
        'template' => 'whistlingdog/mm.tt',
        'lang'     => $c->model('DB')->schema->GLOBAL_LANG->{$language},
    );
}


sub music : Chained('/') : PathPart('richard-music') : Args(0) {
    my ($self, $c) = @_;

    my $language = 'en';
    $c->stash(
        'req_page' => 'music',
        'template' => 'whistlingdog/music.tt',
        'lang'     => $c->model('DB')->schema->GLOBAL_LANG->{$language},
    );
}


sub about : Chained('/') : PathPart('about') : Args(0) {
    my ($self, $c) = @_;

    my $language = 'en';
    $c->stash(
        'req_page' => 'about',
        'template' => 'whistlingdog/about.tt',
        'lang'     => $c->model('DB')->schema->GLOBAL_LANG->{$language},
    );
}


sub contact : Chained('/') : PathPart('contact') : Args(0) {
    my ($self, $c) = @_;

    my $language = 'en';
    $c->stash(
        'req_page' => 'contact',
        'template' => 'whistlingdog/contact.tt',
        'lang'     => $c->model('DB')->schema->GLOBAL_LANG->{$language},
    );
}


__PACKAGE__->meta->make_immutable;

1;
