program image_bmp;
{$UNITPATH \SDL2} 

uses SDL2;

var
  sdlWindow1: PSDL_Window;
  sdlRenderer: PSDL_Renderer;
  sdlSurface1: PSDL_Surface;
  sdlTexture1: PSDL_Texture;

begin

  //Initialisation du video subsystem
  if SDL_Init(SDL_INIT_VIDEO) < 0 then Halt;

  if SDL_CreateWindowAndRenderer(500, 500, SDL_WINDOW_SHOWN, @sdlWindow1, @sdlRenderer) <> 0
    then Halt;

  // Création d'une surface pour mon .bmp
  sdlSurface1 := SDL_LoadBMP('rider.bmp');
  if sdlSurface1 = nil then
    Halt;

  // Création d'une texture pour ma surface créée précédement
  sdlTexture1 := SDL_CreateTextureFromSurface(sdlRenderer, sdlSurface1);
  if sdlTexture1 = nil then
    Halt;

  // Rendu de la texture
  if SDL_RenderCopy(sdlRenderer, sdlTexture1, nil, nil) <> 0 then
    Halt;

  // Affichage de la fenêtre pendant 2000secondes
  SDL_RenderPresent(sdlRenderer);
  SDL_Delay(2000);

  // Nettoyage
  SDL_DestroyTexture(sdlTexture1);
  SDL_FreeSurface(sdlSurface1);
  SDL_DestroyRenderer(sdlRenderer);
  SDL_DestroyWindow (sdlWindow1);

  // Fermeture du video subsystem
  SDL_Quit;

end.                                                                   