use inc::Module::Install;
name 'Task-Plack';
all_from 'lib/Task/Plack.pm';
readme_from 'lib/Task/Plack.pm';

if ($ARGV[0] eq '--regen') {
    warn "regenerating versions.pl\n";
    require 'lib/Task/Plack.pm';
    require FileHandle;
    open my $out, ">", "versions.pl";
    Task::Plack->makefile_pl($out);
}

do "versions.pl";

auto_install;
auto_set_repository;
WriteAll;
