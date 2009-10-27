use inc::Module::Install;
name 'Task-Plack';
all_from 'lib/Task/Plack.pm';
readme_from 'lib/Task/Plack.pm';

requires 'PSGI';
requires 'Plack';
requires 'Plack::Request';
requires 'CGI::PSGI';

feature 'Fast XS-based HTTP header parsing',
    'HTTP::Parser::XS', 0.04;

feature 'Prefork HTTP server',
    'Parallel::Prefork';

feature 'FastCGI daemon and dispatcher',
    -default => 0,
    'FCGI' => 0.67,
    'FCGI::Client' => 0.02,
    'FCGI::ProcManager';

feature 'Serve static files with sendfile(2)',
    -default => 0,
    'Sys::Sendfile' => 0.09;

feature 'Stacktrace with lexical variables',
    -default => 0,
    'Devel::StackTrace::WithLexicals';

require 'lib/Task/Plack.pm';
Task::Plack->makefile_pl;

auto_install;
auto_set_repository;
WriteAll;
