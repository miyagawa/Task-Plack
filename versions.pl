feature 'FastCGI daemon and dispatcher', -default => 1,
  'FCGI', 0.70,
  'FCGI::Client', 0.04,
  'FCGI::ProcManager', 0.19,
  'Net::FastCGI', 0.08,
;
feature 'Stacktrace with lexical variables', -default => 0,
  'Devel::StackTrace::WithLexicals', 0.05,
;
feature 'Core and Essential Tools', -default => 1,
  'PSGI', 1.03,
  'Plack', 0.9928,
  'CGI::PSGI', 0.09,
  'CGI::Emulate::PSGI', 0.06,
  'CGI::Compile', 0.11,
;
feature 'Recommended PSGI Servers and Plack handlers', -default => 1,
  'HTTP::Server::Simple::PSGI', 0.14,
  'Starman', 0.1005,
  'Twiggy', 0.1005,
  'Starlet', 0.08,
  'Corona', 0.1004,
;
feature 'Extra PSGI servers and Plack handlers', -default => 0,
  'POE::Component::Server::PSGI', 0.5,
  'Plack::Handler::AnyEvent::ReverseHTTP', 0.04,
  'Plack::Handler::SCGI', 0.02,
  'Plack::Handler::AnyEvent::SCGI', 0.02,
  'Plack::Handler::AnyEvent::HTTPD', 0.01,
;
feature 'In-Development PSGI Servers', -default => 0,
;
feature 'Recommended middleware components', -default => 1,
  'Plack::Middleware::Deflater', 0.02,
  'Plack::Middleware::Session', 0.11,
  'Plack::Middleware::Debug', 0.07,
  'Plack::Middleware::Header', 0.03,
  'Plack::Middleware::Auth::Digest', 0.03,
  'Plack::App::Proxy', 0.15,
  'Plack::Middleware::ReverseProxy', 0.06,
;
feature 'Middleware Components', -default => 0,
  'Plack::Middleware::JSConcat', 0.29,
  'Plack::Middleware::File::Sass', 0.01,
;
feature 'Tools', -default => 0,
  'Test::WWW::Mechanize::PSGI', 0.35,
;
feature 'Catalyst Engine', -default => 0,
  'Catalyst::Engine::PSGI', 0.08,
;
feature 'Squatting::On', -default => 0,
  'Squatting::On::PSGI', 0.04,
;
feature 'Sledge', -default => 0,
;
feature 'CGI::Application::PSGI', -default => 0,
  'CGI::Application::PSGI', 1.00,
;
feature 'Maypole::PSGI', -default => 0,
;
feature 'Mason PSGI handler', -default => 0,
;
