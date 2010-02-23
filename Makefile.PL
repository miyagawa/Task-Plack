use inc::Module::Install;
name 'Task-Plack';
all_from 'lib/Task/Plack.pm';
readme_from 'lib/Task/Plack.pm';

feature 'Fast XS-based HTTP header parsing',
    'HTTP::Parser::XS', 0.06;

feature 'Prefork HTTP server',
    'Parallel::Prefork';

feature 'FastCGI daemon and dispatcher',
    -default => 0,
    'FCGI' => 0.67,
    'FCGI::Client' => 0.02,
    'FCGI::ProcManager';

feature 'Stacktrace with lexical variables',
    -default => 0,
    'Devel::StackTrace::WithLexicals';

if ($Module::Install::AUTHOR) {
    require 'lib/Task/Plack.pm';
    require FileHandle;
    open my $out, ">", "MakefileX.PL";
    Task::Plack->makefile_pl($out);
}

do "MakefileX.PL";

auto_install;
auto_set_repository;
WriteAll;
