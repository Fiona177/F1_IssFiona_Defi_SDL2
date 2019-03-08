program Helicopter;
{$UNITPATH \SDL2}

uses SDL2, SDL2_image;

var
  i: integer;
  sdlWindow1: PSDL_Window;
  sdlRenderer: PSDL_Renderer;
  sdltext: PSDL_Texture;
  sdlheli: TSDL_Rect;
  sdlheli2: TSDL_Rect;
  sorti: boolean;
  sdlEvent: PSDL_Event;
  sdlKeyh: PUInt8;

begin


  //Initialisation du video subsystem
  if SDL_Init(SDL_INIT_VIDEO) < 0 then Halt;

  sdlWindow1 := SDL_CreateWindow ('Fenetre1', 0, 0, 720, 480, SDL_WINDOW_SHOWN); 
  if sdlWindow1 = nil then HALT;

  sdlRenderer := SDL_CreateRenderer( sdlWindow1, -1, 0 ); 
  if sdlRenderer = nil then HALT;

  //Initialisation de la texture avec l'image
  sdltext := IMG_LoadTexture(sdlRenderer,'image\helicopter.png');
  if sdltext = nil then Halt;

  //Placement des rectangles + initialisation d'un booleen pour sortir du programme et d'un evenement
  sdlheli.x := 0;
  sdlheli.y := 0;
  sdlheli.w := 128;
  sdlheli.h := 55;

  sdlheli2.w:= 128;
  sdlheli2.h:= 55;

  sorti:= false;
  new(sdlEvent);


  writeln('Veuillez appuyer sur F1 pour quitter');
  //Boucle tant que la touche F1 n'est pas actionné le programme continu
  while sorti=false do   
  begin
  	//Boucle permettant d'avoir l'image de l'hélicoptère qui suit la souris
    While SDL_PollEvent ( sdlEvent ) = 1 do 
      begin
          sdlheli2.x:=sdlEvent^.motion.x-(128 div 2);
          sdlheli2.y:=sdlEvent^.motion.y-(55 div 2);
        //Boucle permettant à l'hélicoptère d'être animé
        for i:=0 to 4 do         
        begin
    	  	sdlheli.x:=sdlheli.x + 128;
          if (sdlheli.x > 512) then sdlheli.x:=0;
    	  	SDL_RenderCopy(sdlRenderer, sdltext, @sdlheli, @sdlheli2);
    	  	SDL_RenderPresent(sdlRenderer);
          SDL_Delay(1);
    	  	SDL_RenderClear(sdlRenderer);
    	  end;

    //Initialisation de la touche sur laquelle appuyer pour sortir du programme
    SDL_PumpEvents;
    sdlKeyh := SDL_GetKeyboardState(nil);
    if sdlKeyh[SDL_SCANCODE_F1] = 1 then sorti := true ;
      end;
	end;


  //Nettoyage de la mémoire
  dispose(sdlEvent);
  SDL_DestroyTexture(sdltext);
  SDL_DestroyRenderer(sdlRenderer);
  SDL_DestroyWindow (sdlWindow1);

  //On quitte le video subsystem
  SDL_Quit;

end.
