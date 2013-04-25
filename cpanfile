recommends 'FCGI', '0.74',
recommends 'FCGI::Client', '0.08',
recommends 'FCGI::ProcManager', '0.24',
recommends 'Net::FastCGI', '0.14',

feature 'stacktrace_with_lexical_variables', 'Stacktrace with lexical variables' => sub {
  recommends 'Devel::StackTrace::WithLexicals', '0.10',
};

recommends 'IO::Handle::Util', '0.01',

recommends 'PSGI', '1.101',
recommends 'Plack', '1.0023',
recommends 'CGI::PSGI', '0.15',
recommends 'CGI::Emulate::PSGI', '0.15',
recommends 'CGI::Compile', '0.16',

recommends 'HTTP::Server::Simple::PSGI', '0.14',
recommends 'Starman', '0.3011',
recommends 'Twiggy', '0.1021',
recommends 'Starlet', '0.18',
recommends 'Corona', '0.1004',

feature 'extra_psgi_servers_and_plack_handlers', 'Extra PSGI servers and Plack handlers' => sub {
  recommends 'Plack::Handler::AnyEvent::ReverseHTTP', '0.04',
  recommends 'Plack::Handler::SCGI', '0.02',
  recommends 'Plack::Handler::AnyEvent::SCGI', '0.02',
  recommends 'Plack::Handler::AnyEvent::HTTPD', '0.03',
  recommends 'Perlbal::Plugin::PSGI', '0.03',
};

feature 'in_development_psgi_servers', 'In-Development PSGI Servers' => sub {
};

recommends 'Plack::Middleware::Deflater', '0.08',
recommends 'Plack::Middleware::Session', '0.18',
recommends 'Plack::Middleware::Debug', '0.14',
recommends 'Plack::Middleware::Header', '0.04',
recommends 'Plack::Middleware::Auth::Digest', '0.04',
recommends 'Plack::App::Proxy', '0.27',
recommends 'Plack::Middleware::ReverseProxy', '0.15',
recommends 'Plack::Middleware::ConsoleLogger', '0.04',

feature 'extra_middleware_components', 'Extra Middleware Components' => sub {
  recommends 'Plack::Middleware::JSConcat', '0.29',
  recommends 'Plack::Middleware::Throttle', '0.01',
  recommends 'Plack::Middleware::Status', '1.101150',
  recommends 'Plack::Middleware::AutoRefresh', '0.08',
  recommends 'Plack::Middleware::File::Sass', '0.03',
};

feature 'tools', 'Tools' => sub {
  recommends 'Test::WWW::Mechanize::PSGI', '0.35',
  recommends 'Flea', '0.04',
};

feature 'catalyst_engine', 'Catalyst Engine' => sub {
  recommends 'Catalyst::Engine::PSGI', '0.13',
};

feature 'squatting_on', 'Squatting::On' => sub {
  recommends 'Squatting::On::PSGI', '0.06',
};

feature 'sledge', 'Sledge' => sub {
};

feature 'cgi_application_psgi', 'CGI::Application::PSGI' => sub {
  recommends 'CGI::Application::PSGI', '1.00',
};

feature 'maypole_psgi', 'Maypole::PSGI' => sub {
};

feature 'mason_psgi_handler', 'Mason PSGI handler' => sub {
};

