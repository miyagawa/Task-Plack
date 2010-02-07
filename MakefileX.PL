feature 'Core and Essential Tools', -default => 1,
  'PSGI', 1.03,
  'Plack', 0.9031,
  'Plack::Request', 0.09,
  'CGI::PSGI', 0.07,
  'CGI::Emulate::PSGI', 0.05,
  'CGI::Compile', 0.08,
;
feature 'Extra PSGI Servers and Plack handlers', -default => 0,
  'HTTP::Server::Simple::PSGI', 0.11,
  'Plack::Server::AnyEvent', 0.03,
  'Plack::Server::Coro', 0.02,
  'Plack::Server::POE', 0.4,
  'Plack::Server::ReverseHTTP', 0.02,
;
feature 'In-Development PSGI Servers', -default => 0,
;
feature 'Middleware Components', -default => 0,
  'Plack::Middleware::JSConcat', 0.29,
  'Plack::Middleware::Deflater', 0.02,
  'Plack::Middleware::Session', 0.03,
  'Plack::Middleware::Debug', 0.07,
  'Plack::Middleware::Header', 0.03,
  'Plack::Middleware::Auth::Digest', 0.02,
  'Plack::App::Proxy', 0.10,
  'Plack::Middleware::ReverseProxy', 0.05,
;
feature 'Tools', -default => 0,
  'Test::WWW::Mechanize::PSGI', 0.35,
;
feature 'Catalyst Engine', -default => 0,
  'Catalyst::Engine::PSGI', 0.07,
;
feature 'Squatting::On', -default => 0,
  'Squatting::On::PSGI', 0.03,
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
