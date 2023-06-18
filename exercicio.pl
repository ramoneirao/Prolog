:- dynamic pos/2.
:- dynamic ande/1. 
:- dynamic onde/0.
:- dynamic objetos/0.
:- dynamic pegue/1.
:- dynamic mochila/0.


pos(tv, sala).
pos(bola, quarto).
pos(carteira, quarto).
pos(chave, garagem).
pos(robo, garagem).

ande(Destino) :-retract(pos(robo, Origem)),
		asserta(pos(robo, Destino)),
		format('Robo, ande de ~w ate ~w', [Origem, Destino]).

onde :- pos(robo, X), 
	format('O robo esta na ~w', [X]).

objetos :- pos(robo, X),
	   pos(Y, X), 
	   Y \= robo, 
	   format('~w ', [Y]).

pegue(Objeto) :- pos(robo, Local),
		 pos(Objeto, Local),
                 Objeto \= robo,
		 retract(pos(Objeto, Local)),
		 asserta(pos(Objeto, mochila)),
		 format('O robô colocou a ~w na mochila.', [Objeto]).

mochila :- findall(X, pos(X, mochila), Obj),
           format('Objetos na mochila: ~w', [Obj]).

solte(Objeto) :- pos(robo, Local),
    			 pos(Objeto, mochila),
    	 	 	 retract(pos(Objeto, mochila)),
    			 asserta(pos(Objeto, Local)),
    			 format('O robô soltou a ~w na ~w.', [Objeto, Local]).
