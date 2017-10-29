﻿/****************************/
/* Blake's 7: the Oric game */
/* Using OASIS              */
/* (c) Chema - 2016         */
/****************************/

#include "globals.h"

#define MAN2 200

script 200
{
	byte i;
	
	scDelay(50);
	scLookDirection(MAN2,FACING_RIGHT);
	scActorTalk(MAN2,200,0);
	scWaitForActor(MAN2);
	scActorTalk(MAN2,200,1);
	scWaitForActor(MAN2);
	scDelay(50);
	scActorTalk(BLAKE,200,2);
	scWaitForActor(BLAKE);
	scDelay(75);
	scActorTalk(MAN2,200,3);
	scWaitForActor(MAN2);
	scDelay(50);
	scActorTalk(MAN2,200,4);
	scWaitForActor(MAN2);
	scDelay(75);

	scActorWalkTo(MAN2, 13,16);
	scDelay(25);
	scActorWalkTo(BLAKE, 18,16);
	//scWaitForActor(MAN2);
	scWaitForActor(BLAKE);
	scPanCamera(1);

	scActorTalk(BLAKE,200,5);
	scWaitForActor(BLAKE);
	scActorTalk(BLAKE,200,6);
	scWaitForActor(BLAKE);

	scActorTalk(MAN2,200,7);
	scWaitForActor(MAN2);
	scDelay(50);
	scActorTalk(BLAKE,200,8);
	scWaitForActor(BLAKE);

	scLookDirection(MAN2,FACING_RIGHT);	
	scDelay(75);
	for(i=9;i<=16;i=i+1)
	{
		if(i==15) scDelay(50);
		scActorTalk(MAN2,200,i);
		scWaitForActor(MAN2);		
	}
	scDelay(75);
	
	// Time for the bad guys to arrive
	scLoadObjectToGame(TRAVIS);
	scLoadObjectToGame(GUARD2);
	scLoadObjectToGame(SERVALAN);
	
	scSetPosition(GUARD,11,15,47);
	scSetPosition(GUARD2,11,16,50);
	scSetPosition(SERVALAN,11,16,42);
	scSetPosition(TRAVIS,11,15,45);
	
	scActorTalk(SERVALAN,201,0);
	scWaitForActor(SERVALAN);

	scLookDirection(BLAKE, FACING_RIGHT);
	scPlaySFX(SFX_THRILL1);
	scWaitForTune();
	
	/*
	scLookDirection(GUARD,FACING_LEFT);
	scLookDirection(GUARD2,FACING_LEFT);
	scLookDirection(SERVALAN,FACING_LEFT);
	scLookDirection(TRAVIS,FACING_LEFT);
	*/
	
	scActorWalkTo(SERVALAN,29, 16);
	scActorWalkTo(TRAVIS, 33, 15);
	scActorWalkTo(GUARD, 37, 15);
	scActorWalkTo(GUARD2, 40, 16);
	scPanCamera(33);
	scWaitForCamera();
	scWaitForActor(GUARD);
	scWaitForActor(GUARD2);
	scWaitForActor(TRAVIS);
	scWaitForActor(SERVALAN);
	
	scSetAnimstate(GUARD,12);
	scSetAnimstate(GUARD2,12);
	
	scDelay(75);

	scActorTalk(SERVALAN,201,1);
	scWaitForActor(SERVALAN);
	scActorTalk(SERVALAN,201,2);
	scWaitForActor(SERVALAN);
	scActorTalk(SERVALAN,201,3);
	scWaitForActor(SERVALAN);
	scDelay(50);
	
	scActorTalk(SERVALAN,201,4);
	scWaitForActor(SERVALAN);
	scActorTalk(SERVALAN,201,5);
	scWaitForActor(SERVALAN);
	scDelay(50);
	scActorTalk(SERVALAN,201,6);
	scWaitForActor(SERVALAN);
	
	scActorTalk(TRAVIS,201,7);
	scWaitForActor(TRAVIS);
	scActorTalk(TRAVIS,201,8);
	scWaitForActor(TRAVIS);
	
	for(i=9;i<=14;i=i+1)
	{
		if(i==14) scDelay(50);
		scActorTalk(SERVALAN,201,i);
		scWaitForActor(SERVALAN);		
	}	
	
	scDelay(50);
	scFadeToBlack();
	scLoadRoom(ROOM_GUILTY);
	
}

stringpack 200{
#ifdef ENGLISH
	/*++++++++++++++++++++++++++++++++++++++*/
	"Don't you remember anything about the";
	"treatments they gave you?";
	"I've had no treatments.";
	"I thought there'd be something left...";
	"some trace of memory.";
	
	//5
	"What is this? I’ve had no treatment, my";
	"memory is alright; now what’s going on?";
	
	"I know, I know, it’s difficult for you.";
	"Tell me what you know about my family!";

	//9
	"They’re dead. Killed by the Federation.";
	"You were and still are a leader of the";
	"resistance, but were captured.";
	"They didn't want you to become a martyr";
	"so the Federation erased your past and";
	"reprogrammed you into a content citizen";
	"Blake, we need you back!";
	"All the leaders of dissent wait inside.";
#endif

#ifdef SPANISH
	/*++++++++++++++++++++++++++++++++++++++*/
	"¿No recuerdas nada de los tratamientos";
	"a los que te sometieron?";
	"No me sometieron a ningún tratamiento.";
	"Pensé que igual quedaba algo...";
	"algún recuerdo residual.";
	
	//5
	"¿Qué significa esto? Tratamientos... mi";
	"memoria está perfecta ¿Qué ocurre aquí?";
	
	"Lo sé. Es difícil para tí.";
	"¡Dime qué sabes de mi familia!";

	//9
	"Muertos. La Federación los eliminó.";
	"Eras y todavía eres un líder de la";
	"resistencia, pero te capturaron.";
	"No querían convertirte en un mártir";
	"así que borraron tu pasado y te";
	"convirtieron en un ciudadano modelo.";
	"¡Blake, te necesitamos!";
	"Todos los líderes te esperan dentro.";
#endif
}

stringpack 201{
#ifdef ENGLISH
	/*++++++++++++++++++++++++++++++++++++++*/
	"What a lovely meeting...!";
	"I am very sorry to interrupt you but";
	"I'm afraid this game of yours is coming";
	"to an end this time, Mr. Foster.";
	
	//"Blake, Blake, always causing trouble...";
	//"You couldn't just behave.";
	"Thank you very much, Blake.";
	"You've been the perfect bait.";
	"Travis, eliminate everyone inside.";

	"At once, Supreme Commander!";
	"And what about Blake? Shall I kill him?";
	
	"No, Travis.";
	"We don't want a martyr.";
	"I have a surprise for him."; 
	"Something that will totally destroy";
	"his reputation forever.";
	"Take him away, please";
#endif
#ifdef SPANISH
	/*++++++++++++++++++++++++++++++++++++++*/
	"¡Una reunión encantadora!";
	"Siento interrumpir pero me temo que";
	"este juego suyo, Sr. Foster, está a";
	"punto de terminarse.";
	
	"Muchas gracias, Blake.";
	"Has sido el cebo perfecto.";
	"Travis, elimina a todo el mundo.";

	"¡A sus órdenes Comandante Supremo!";
	"¿Y Blake? ¿Le elimino también?";
	
	"No, Travis.";
	"No queremos un mártir.";
	"Le tengo reservada una sorpresa."; 
	"Algo que destruirá su reputación de";
	"una vez para siempre.";
	"Llévenselo, por favor.";
#endif
}