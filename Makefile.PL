use inc::Module::Install;
name 'Task-Plack';
all_from 'lib/Task/Plack.pm';
readme_from 'lib/Task/Plack.pm';

requires 'PSGI';
requires 'Plack';
requires 'Plack::Request';
requires 'CGI::PSGI';

feature 'Extra Plack servers',
    'Plack::Server::ServerSimple',
    'Plack::Server::AnyEvent',
    'Plack::Server::ReverseHTTP',
    'Plack::Server::Coro',
    'Plack::Server::POE';

feature 'Catalyst engine for PSGI',
    -default => has_module('Catalyst'),
    'Catalyst::Engine::PSGI';

feature 'Squatting PSGI adapter',
    -default => has_module('Squatting'),
    'Squatting::On::PSGI';

auto_install;
auto_set_repository;
WriteAll;

sub has_module {
    my $file = shift;
    $file =~ s!::!/!g;
    scalar grep -e "$_/$file.pm", @INC;
}
