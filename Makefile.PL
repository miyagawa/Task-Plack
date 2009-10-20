use inc::Module::Install;
name 'Task-Plack';
all_from 'lib/Task/Plack.pm';
readme_from 'lib/Task/Plack.pm';

requires 'PSGI';
requires 'Plack';
requires 'Plack::Request';
requires 'CGI::PSGI';

require 'lib/Task/Plack.pm';
Task::Plack->makefile_pl;

auto_install;
auto_set_repository;
WriteAll;
