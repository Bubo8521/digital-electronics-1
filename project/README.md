# Report z projektu: Štvrtok - Časovač na kruhový tréning

### Členovia týmu

* Buberník Frederic Michael
* Jurkovič Martin

## Teoretický popis

Zadanie znelo vytvoriť časovač na kruhový tréning s možnosťou nastaviť počet kôl, dobu kola a pauzy medzi nimi. To znamená, že budeme mať zobrazený odpočet kola, následne odpočet pauzy a takto stále dookola, pokiaľ neprebehne požadovaný počet kôl. Naše riešenie je principiálne také, že v prvotnom stave (tj. nie je na dokce nič nastavené) je doba kola 10 sekúnd, pauzy tiež 10 sekúnd a jedno kolo. Nastavenie doby kola, pauzy aj počtu kôl je cez 4-bitové vstupné hodnoty, kde každý bit pre nastavenie či už kola, tak pauzy reprezentuje + 10 sekúnd. Pre počet kôl to platí obdobne (tj. 1 bit = + 1 kolo). Maximálne teda môžeme dosiahnuť na 4-minútové kolo, 4-minútovú pauzu a 16 kôl. Samotný odpočet sa zobrazuje v sekundách.

## Hardware popis

Pre ovládanie je využitých 12 prepínačov a 1 tlačítko, výstup je zobrazený na sedem-segmentovom displeji. Prvé 4 prepínače (tj. 0 - 3) slúžia pre nastavenie doby kola, nasledujúce 4 prepínače sú k nastaveniu doby pauzy a ďalšie 4 k nastaveniu počtu kôl. Jedno tlačítko uprostred plní funkciu resetu. Z možných 8 pozícií na displeji sú využívané štyri. Ľavá z týchto štyroch slúži na identifikáciu (tj. či je aktuálne kolo, pauza alebo koniec), zvyšné 3 slúžia pre zobrazenie odpočtu.

## Software popis

Program popisuje nasledujúci algoritmus. 

![algorithm](https://user-images.githubusercontent.com/124887713/235354996-87735a50-c633-424f-b25b-b2030cf71e46.png)

[Zdrojové soubory](/project/project/project.srcs/sources_1/new/)

[Simulační soubory](/project/project/project.srcs/sim_1/new/)

### Simulácie komponentov a popis

* top - prepojenie programu s doskou
* timer - hlavný komponent, riadi celý chod aplikácie
* countdown - generuje signál k zobrazeniu odpočtu
* clock_enable - spomaluje riadiaci hodinový signál
* driver_7seg_4digits - prevod hodnôt k zobrazeniu na 7-segmentovom displeji
* hex_7seg - definovanie kombinácií zobrazovaných na displeji
* cnt_up_down - čítač použitý v driver_7seg_4digits

### Simulácia "coundown"
![sim_countdown](https://user-images.githubusercontent.com/124887713/235355070-70a53ec6-58b6-4c51-a804-4d7abf1e630e.png)

### Simulácia "timer"
![sim_timer](https://user-images.githubusercontent.com/124887713/235355094-024ea20a-ada1-455b-9f39-db3b1e3c0c9d.png)

## Návod k ovládaniu

Po spustení bude aplikácia v istom prvotnom nastavení (tj. 1 10-sekundové kolo), v ktorom môžeme aplikáciu nastaviť podľa našich preferencií.
* Prepínače 0 - 3 slúžia k nastaveniu doby kola, ich nastavením (hodnota je braná binárne) pripočítame k základným 10 sekundám ďalších 10 sekúnd za každý bit.
* Prepínače 4 - 7 slúžia k nastaveniu doby pauzy, ich nastavením (hodnota je braná binárne) pripočítame k základným 10 sekundám ďalších 10 sekúnd za každý bit.
* Prepínače 8 - 11 slúžia k nastaveniu počtu kôl, ich nastavením (hodnota je braná binárne) pripočítame k základu 1 kola ďalšie 1 kolo za každý bit.

Teraz stlačíme tlačítko reset, ktoré nájdeme uprostred skupiny tlačítiek. Na displeji sa potom zobrazí '9' na ľavej pozícií, symbolizujúce 'g' ako go a začne odpočet 1. kola. Akonáhle odpočet skončí zobrazí sa na ľavej pozícií 'P' ako "Pause" a odpočet pauzy. Tieto dva stavy sa budú stále opakovať, až do posledného kola, kedy sa na displeji zobrazí "E000", čo nám signalizuje koniec ('E' ako "End"). V tomto stave aplikácia zostane, kým nedojde k stlačeniu tlačítka reset, kedy sa celý popísaný proces bude opakovať.

### Indikácia kola
![stateGo](https://user-images.githubusercontent.com/124887713/235355136-602b12d5-cd53-4581-8b59-45b04dfccd68.jpg)

### Indikácia pauzy
![statePause](https://user-images.githubusercontent.com/124887713/235355140-f7104b71-6624-4140-8f4a-04333a1b0d65.jpg)

### Indikácia konca
![stateEnd](https://user-images.githubusercontent.com/124887713/235355145-76bc6689-42a3-44e5-ac15-0023c8c5805b.jpg)
