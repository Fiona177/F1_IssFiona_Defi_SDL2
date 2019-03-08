program dessin_carre;
{$UNITPATH \SDL2} 

uses SDL2;

var
sdlWindow1 : PSDL_Window;
sdlRenderer : PSDL_Renderer;
sdlRect1 : PSDL_Rect;

begin

  //Initialisation du video subsystem
  if SDL_Init( SDL_INIT_VIDEO ) < 0 then HALT;

  sdlWindow1 := SDL_CreateWindow( 'Window1', 50, 50, 200, 200, SDL_WINDOW_SHOWN );
  if sdlWindow1 = nil then HALT;

  sdlRenderer := SDL_CreateRenderer( sdlWindow1, -1, 0 );
  if sdlRenderer = nil then HALT;

  SDL_SetRenderDrawColor( sdlRenderer, 0, 255, 255, 255 );
  SDL_RenderClear( sdlRenderer );
  SDL_RenderPresent ( sdlRenderer );
  SDL_Delay( 1000 );

  //Création d'un carré pour le dessin
  new( sdlRect1 );
  sdlRect1^.x := 10; sdlRect1^.y := 10; sdlRect1^.w := 100; sdlRect1^.h := 100;
  SDL_SetRenderDrawColor( sdlRenderer, 0, 255, 0, 255 );
  SDL_RenderDrawRect( sdlRenderer, sdlRect1 );
  SDL_RenderPresent( sdlRenderer );
  SDL_Delay( 1000 );
  dispose( sdlRect1 );

  //Nettoyage
  SDL_DestroyRenderer( sdlRenderer );
  SDL_DestroyWindow ( sdlWindow1 );

  //Fermeture du video subsystem
  SDL_Quit;

end.
