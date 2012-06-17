feature 'FastCGI daemon and dispatcher', -default => 1,
  'FCGI', '0.74',
  'FCGI::Client', '0.08',
  'FCGI::ProcManager', '0.24',
  'Net::FastCGI', '0.13',
;
feature 'Stacktrace with lexical variables', -default => 0,
  'Devel::StackTrace::WithLexicals', '0.10',
;
feature 'Utility to create IO::Handle-ish objects', -default => 1,
  'IO::Handle::Util', '0.01',
;
feature 'Core and Essential Tools', -default => 1,
  'PSGI', '1.03',
  'Plack', '0.9985',
  'CGI::PSGI', '0.15',
  'CGI::Emulate::PSGI', '0.14',
  'CGI::Compile', '0.15',
;
feature 'Recommended PSGI Servers and Plack handlers', -default => 1,
  'HTTP::Server::Simple::PSGI', '0.14',
  'Starman', '0.3000',
  'Twiggy', '0.1020',
  'Starlet', '0.14',
  'Corona', '0.1004',
;
feature 'Extra PSGI servers and Plack handlers', -default => 0,
  'Plack::Handler::AnyEvent::ReverseHTTP', '0.04',
  'Plack::Handler::SCGI', '0.02',
  'Plack::Handler::AnyEvent::SCGI', '0.02',
  'Plack::Handler::AnyEvent::HTTPD', '0.01',
  'Plack::Handler::Mongrel2', '',
  'Perlbal::Plugin::PSGI', '0.03',
;
feature 'In-Development PSGI Servers', -default => 0,
;
feature 'Recommended middleware components', -default => 1,
  'Plack::Middleware::Deflater', '0.05',
  'Plack::Middleware::Session', '0.14',
  'Plack::Middleware::Debug', '0.14',
  'Plack::Middleware::Header', '0.04',
  'Plack::Middleware::Auth::Digest', '0.04',
  'Plack::App::Proxy', '0.21',
  'Plack::Middleware::ReverseProxy', '0.11',
  'Plack::Middleware::ConsoleLogger', '0.04',
;
feature 'Extra Middleware Components', -default => 0,
  'Plack::Middleware::JSConcat', '0.29',
  'Plack::Middleware::Throttle', '0.01',
  'Plack::Middleware::Status', '1.101150',
  'Plack::Middleware::AutoRefresh', '0.08',
  'Plack::Middleware::File::Sass', '0.03',
;
feature 'Tools', -default => 0,
  'Test::WWW::Mechanize::PSGI', '0.35',
  'Flea', '0.04',
;
feature 'Catalyst Engine', -default => 0,
  'Catalyst::Engine::PSGI', '0.13',
;
feature 'Squatting::On', -default => 0,
  'Squatting::On::PSGI', '0.06',
;
feature 'Sledge', -default => 0,
;
feature 'CGI::Application::PSGI', -default => 0,
  'CGI::Application::PSGI', '1.00',
;
feature 'Maypole::PSGI', -default => 0,
;
feature 'Mason PSGI handler', -default => 0,
;
