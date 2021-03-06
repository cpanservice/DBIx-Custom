package DBIx::Custom::Basic;
use base 'DBIx::Custom';

use warnings;
use strict;
use Encode qw/decode encode/;

my $class = __PACKAGE__;

$class->add_filter(
    encode_utf8 => sub { encode('UTF-8', shift) },
    decode_utf8 => sub { decode('UTF-8', shift) }
);

$class->add_format(
    'SQL99_date'        => '%Y-%m-%d',
    'SQL99_datetime'    => '%Y-%m-%d %H:%M:%S',
    'SQL99_time'        => '%H:%M:%S',
    'ISO-8601_date'     => '%Y-%m-%d',
    'ISO-8601_datetime' => '%Y-%m-%dT%H:%M:%S',
    'ISO-8601_time'     => '%H:%M:%S',
);

# Methods
sub utf8_filter_on {
    my $self = shift;
    
    # Set utf8 filters
    $self->bind_filter($self->filters->{encode_utf8});
    $self->fetch_filter($self->filters->{decode_utf8});
    
    return $self;
}

1;

=head1 NAME

DBIx::Custom::Basic - DBIx::Custom basic implementation

=head1 See DBIx::Custom documentation

This class is L<DBIx::Custom> subclass.

You can use all methods of L<DBIx::Custom>

Please see L<DBIx::Custom> documentation

=head1 Methods

=head2 utf8_filter_on

Encode and decode utf8 filter on

    $dbi->utf8_filter_on;

This equel to

    $dbi->bind_filter($dbi->filters->{encode_utf8});
    $dbi->fetch_filter($dbi->filters->{decode_utf8});

=head1 Available filters

=head2 encode_utf8

Encode internal string to UTF-8 byte stream
If need, utf8::upgrade is also done.

    $dbi->filters->{encode_utf8}->($value);
    
This filter is generally used as bind filter

    $dbi->bind_filter($dbi->filters->{encode_utf8});

=head2 decode_utf8

Decode UTF-8 byte stream to internal string
    $dbi->filters->{decode_utf8}->($value);
    
This filter is generally used as fetch filter

    $dbi->fetch_filter($dbi->filters->{decode_utf8});

=head2 Available formats
    
strptime formats is available
    
    # format name        format
    'SQL99_date'         '%Y-%m-%d',
    'SQL99_datetime'     '%Y-%m-%d %H:%M:%S',
    'SQL99_time'         '%H:%M:%S',
    'ISO-8601_date'      '%Y-%m-%d',
    'ISO-8601_datetime'  '%Y-%m-%dT%H:%M:%S',
    'ISO-8601_time'      '%H:%M:%S',

You get format as the following

    my $format = $dbi->formats->{$format_name};

=head1 AUTHOR

Yuki Kimoto, C<< <kimoto.yuki at gmail.com> >>

Github L<http://github.com/yuki-kimoto>

I develope this module L<http://github.com/yuki-kimoto/DBIx-Custom>

=head1 COPYRIGHT & LICENSE

Copyright 2009 Yuki Kimoto, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut
