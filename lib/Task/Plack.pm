package Task::Plack;

use strict;
use 5.008_001;
our $VERSION = '0.12';
use ExtUtils::MakeMaker;

use base qw(Exporter);
our @EXPORT = qw(git_clone);

sub dependencies {
    return (
        'Core', sub { 1 }, [
            [ 'PSGI',  'git://github.com/miyagawa/psgi-specs.git' ],
            [ 'Plack', 'git://github.com/miyagawa/Plack.git' ],
            [ 'Plack::Request', 'git://github.com/miyagawa/Plack-Request.git' ],
            [ 'CGI::PSGI', 'git://github.com/miyagawa/CGI-PSGI.git' ],
            [ 'CGI::Emulate::PSGI', 'git://github.com/tokuhirom/p5-cgi-emulate-psgi.git' ],
        ],
        'Extra Plack Servers', sub { 0 }, [
            [ 'Plack::Server::ServerSimple', 'git://github.com/miyagawa/Plack-Server-ServerSimple.git' ],
            [ 'Plack::Server::AnyEvent', 'git://github.com/miyagawa/Plack-Server-AnyEvent.git' ],
            [ 'Plack::Server::Coro', 'git://github.com/miyagawa/Plack-Server-Coro.git' ],
            [ 'Plack::Server::POE', 'git://github.com/frodwith/Plack-Server-POE.git' ],
            [ 'Plack::Server::ReverseHTTP', 'git://github.com/miyagawa/Plack-Server-ReverseHTTP.git' ],
        ],
        'In-Development PSGI Servers', sub { 0 }, [
            [ undef, 'Plack::Server::Danga::Socket', 'git://github.com/typester/Plack-Server-Danga-Socket.git' ],
            [ undef, 'Plack::Server::FCGI::EV', 'git://github.com/mala/Plack-Server-FCGI-EV.git' ],
            [ undef, 'Perlbal::Plugin::PSGI', 'git://github.com/miyagawa/Perlbal-Plugin-PSGI.git' ],
            [ undef, 'mod_psgi', 'git://github.com/spiritloose/mod_psgi.git' ],
            [ undef, 'evpsgi', 'git://github.com/sekimura/evpsgi.git' ],
            [ undef, 'nginx', 'git://github.com/yappo/nginx-psgi-patchs.git' ],
        ],
        'Middleware Components', sub { 0 }, [
            [ 'Plack::Middleware::JSConcat', 'git://github.com/clkao/Plack-Middleware-JSConcat.git' ],
        ],
        'Catalyst Engine', sub { has_module('Catalyst') }, [
            [ 'Catalyst::Engine::PSGI', 'git://github.com/miyagawa/Catalyst-Engine-PSGI.git' ],
        ],
        'Squatting::On', sub { has_module('Squatting') }, [
            [ 'Squatting::On::PSGI', 'git://github.com/beppu/Squatting-On-PSGI.git' ],
        ],
        'Sledge', sub { has_module('Sledge') }, [
            [ undef, 'Sledge::PSGI', 'git://github.com/mala/Sledge-PSGI.git' ],
        ],
        'CGI::Application::PSGI', sub { has_module('CGI::Application') }, [
            [ 'CGI::Application::PSGI', 'git://github.com/markstos/CGI-Application-PSGI.git' ],
        ],
        'Maypole::PSGI', sub { has_module('Maypole') }, [
            [ undef, 'Maypole::PSGI', 'git://github.com/miyagawa/Maypole-PSGI.git' ],
        ],
        'Mason PSGI handler', sub { has_module('HTML::Mason') }, [
            [ undef, 'HTML::Mason::PSGIHandler', 'git://github.com/miyagawa/HTML-Mason-PSGIHandler.git' ],
        ],
        'Mojo server', sub { has_module('Mojo') }, [
            [ undef, 'Mojo::Server::PSGI', 'git://github.com/miyagawa/Mojo-Server-PSGI.git' ],
        ],
    );
}

sub has_module {
    my $file = shift;
    $file =~ s!::!/!g;
    scalar grep -e "$_/$file.pm", @INC;
}

sub iter_deps {
    my($class, $cb) = @_;
    my @deps = $class->dependencies;
    while (my($name, $cond, $deps) = splice @deps, 0, 3) {
        $cb->($name, $cond, $deps);
    }
}

sub makefile_pl {
    my $class = shift;
    $class->iter_deps(sub {
        my($name, $cond, $deps) = @_;
        my @modules = grep defined, map $_->[0], @$deps;
        main::feature $name, -default => $cond->(), @modules;
    });
}

sub git_clone {
    my @clone;
    __PACKAGE__->iter_deps(sub {
        my($name, $cond, $deps) = @_;
        my @repos = map { shift @$_ unless $_->[0]; $_ } @$deps;

        print "[$name]\n";
        for my $repo (@repos) {
            print "- $repo->[0] ($repo->[1])\n";
        }

        my $prompt = ExtUtils::MakeMaker::prompt("Want to git clone them? ", $cond->() ? 'y' : 'n');
        if (lc $prompt eq 'y') {
            for my $repo (@repos) {
                push @clone, $repo->[1];
            }
        }
    });

    for my $repo (@clone) {
        system "git", "clone", $repo;
    }
}

1;
__END__

=encoding utf-8

=for stopwords

=head1 NAME

Task::Plack - Plack bundle

=head1 SYNOPSIS

  cpan> install Task::Plack

  # clone development git for all of those modules (You'll be prompted)
  > perl -MTask::Plack -e 'git_clone'

=head1 AUTHOR

Tatsuhiko Miyagawa E<lt>miyagawa@bulknews.netE<gt>

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

L<http://plackperl.org/>

=cut
