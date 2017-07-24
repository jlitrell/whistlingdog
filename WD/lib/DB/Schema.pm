use utf8;
package DB::Schema;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use Moose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Schema';

__PACKAGE__->load_namespaces;


# Created by DBIx::Class::Schema::Loader v0.07047 @ 2017-07-23 19:29:32
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:2uw8tVe7nX6RTTgeZigtfA
__PACKAGE__->register_class('LanguageRS', 'DB::Schema::Result::Language');
__PACKAGE__->mk_group_accessors('simple' => qw(GLOBAL_LANG GLOBAL_AVAIL_LANGS));

sub connection {
    my ($self, @rest) = @_;
    $self->next::method(@rest);
    # $self is now a live My::Schema object, complete with DB connection

    my $lang_rs = {};
    $lang_rs = $self->resultset('LanguageRS')->search;

    my $global_lang = _build_lang($lang_rs);
    my %global_avail_langs = map {$_ => 1 } keys %$global_lang;

    $self->GLOBAL_LANG( $global_lang );
    $self->GLOBAL_AVAIL_LANGS( \%global_avail_langs  );
}

sub _build_lang {
    my $lang_rs = shift;

    my $global_lang;

    while (my $lang_row = $lang_rs->next) {
        my %data = $lang_row->get_columns;
        my $key_name = $data{'key_name'};

        LANGUAGE:
        for my $lang (keys %data) {
            next LANGUAGE if $lang =~ /(key_name|id)/;
            $global_lang->{$lang}{$key_name} = $data{$lang};
        }
    }

    return $global_lang;
}


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable(inline_constructor => 0);

1;
