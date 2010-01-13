package Task::Plack;

use strict;
use 5.008_001;
our $VERSION = '0.17';
use ExtUtils::MakeMaker;

use base qw(Exporter);
our @EXPORT = qw(git_clone);

sub dependencies {
    return (
        'Core and Essential Tools', 1, [
            [ 'PSGI',  'git://github.com/miyagawa/psgi-specs.git' ],
            [ 'Plack', 'git://github.com/miyagawa/Plack.git' ],
            [ 'Plack::Request', 'git://github.com/miyagawa/Plack-Request.git' ],
            [ 'CGI::PSGI', 'git://github.com/miyagawa/CGI-PSGI.git' ],
            [ 'CGI::Emulate::PSGI', 'git://github.com/tokuhirom/p5-cgi-emulate-psgi.git' ],
            [ 'CGI::Compile', 'git://github.com/miyagawa/CGI-Compile.git' ],
        ],
        'Extra Plack Servers', 0, [
            [ 'Plack::Server::ServerSimple', 'git://github.com/miyagawa/Plack-Server-ServerSimple.git' ],
            [ 'Plack::Server::AnyEvent', 'git://github.com/miyagawa/Plack-Server-AnyEvent.git' ],
            [ 'Plack::Server::Coro', 'git://github.com/miyagawa/Plack-Server-Coro.git' ],
            [ 'Plack::Server::POE', 'git://github.com/frodwith/Plack-Server-POE.git' ],
            [ 'Plack::Server::ReverseHTTP', 'git://github.com/miyagawa/Plack-Server-ReverseHTTP.git' ],
            [ 'Plack::Server::Standalone::Prefork::Server::Starter', 'git://github.com/kazuho/p5-Plack-Server-Standalone-Prefork-Server-Starter.git' ],
        ],
        'In-Development PSGI Servers', 0, [
            [ undef, 'Plack::Server::Danga::Socket', 'git://github.com/typester/Plack-Server-Danga-Socket.git' ],
            [ undef, 'Plack::Server::FCGI::EV', 'git://github.com/mala/Plack-Server-FCGI-EV.git' ],
            [ undef, 'Perlbal::Plugin::PSGI', 'git://github.com/miyagawa/Perlbal-Plugin-PSGI.git' ],
            [ undef, 'mod_psgi', 'git://github.com/spiritloose/mod_psgi.git' ],
            [ undef, 'evpsgi', 'git://github.com/sekimura/evpsgi.git' ],
            [ undef, 'nginx', 'git://github.com/yappo/nginx-psgi-patchs.git' ],
        ],
        'Middleware Components', 0, [
            [ 'Plack::Middleware::JSConcat', 'git://github.com/clkao/Plack-Middleware-JSConcat.git' ],
            [ undef, 'Plack::Middleware::Rewrite', 'git://github.com/snark/Plack-Middleware-Rewrite.git' ],
            [ undef, 'Plack::Middleware::MobileDetector', 'git://github.com/snark/Plack-Middleware-MobileDetector.git' ],
            [ 'Plack::Middleware::Deflater', 'git://github.com/miyagawa/Plack-Middleware-Deflater.git' ],
            [ 'Plack::Middleware::Session', 'git://github.com/stevan/plack-middleware-session.git' ],
            [ 'Plack::Middleware::Debug', 'git://github.com/hanekomu/plack-middleware-debug.git' ],
            [ 'Plack::Middleware::Header', 'git://github.com/nihen/Plack-Middleware-Header.git' ],
            [ undef, 'Plack::Middleware::FirePHP', 'git://github.com/fhelmberger/Plack-Middleware-FirePHP.git' ],
            [ 'Plack::Middleware::Auth::Digest', 'git://github.com/miyagawa/Plack-Middleware-Auth-Digest.git' ],
            [ 'Plack::App::Proxy', 'git://github.com/leedo/Plack-App-Proxy.git' ],
            [ 'Plack::Middleware::ReverseProxy', 'git://github.com/lopnor/Plack-Middleware-ReverseProxy.git' ],
        ],
        'Tools', 0, [
            [ 'Test::WWW::Mechanize::PSGI', 'git://github.com/acme/test-www-mechanize-psgi.git' ],
        ],
        'Catalyst Engine', 0, [
            [ 'Catalyst::Engine::PSGI', 'git://github.com/miyagawa/Catalyst-Engine-PSGI.git' ],
        ],
        'Squatting::On', 0, [
            [ 'Squatting::On::PSGI', 'git://github.com/beppu/Squatting-On-PSGI.git' ],
        ],
        'Sledge', 0, [
            [ undef, 'Sledge::PSGI', 'git://github.com/mala/Sledge-PSGI.git' ],
        ],
        'CGI::Application::PSGI', 0, [
            [ 'CGI::Application::PSGI', 'git://github.com/markstos/CGI-Application-PSGI.git' ],
        ],
        'Maypole::PSGI', 0, [
            [ undef, 'Maypole::PSGI', 'git://github.com/miyagawa/Maypole-PSGI.git' ],
        ],
        'Mason PSGI handler', 0, [
            [ undef, 'HTML::Mason::PSGIHandler', 'git://github.com/miyagawa/HTML-Mason-PSGIHandler.git' ],
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
    my $fh = shift;

    require CPAN;
    $class->iter_deps(sub {
        my($name, $cond, $deps) = @_;
        my @modules = grep defined, map $_->[0], @$deps;
        $fh->print("feature '$name', -default => $cond,\n");
        for my $module (@modules) {
            $fh->print("  '$module', ", version_for($module), ",\n");
        }
        $fh->print(";\n");
    });
}

sub version_for {
    my $name = shift;

    my $module = CPAN::Shell->expand(Module => $name) or return;
    return $module->cpan_version;
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

        my $prompt = ExtUtils::MakeMaker::prompt("Want to git clone them? ", $cond ? 'y' : 'n');
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
