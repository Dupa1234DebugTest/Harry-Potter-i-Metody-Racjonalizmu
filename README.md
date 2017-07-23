# Reguły

## Ogólne

Twórz pliki bez spacji i polskich znaków w nazwach

## Markdown / LaTeX

### Podstawowe znaczniki

\**italic*\*

\*\***bold**\*\*

\*\*\****bold italic***\*\*\*

\`\`\````kod```\`\`\`

$math$

\- - dywiz

-- - półpauza

--- - pauza

### Uwagi

Początek musi przylegać do pierwszej litery tekstu a koniec do ostatniej (\*\***cośtam**\*\* i \*\***cośtam**\*\* zamiast \*\***cośtam** \*\*i\*\* **cośtam**\*\*)

Nie rozdzielaj jednego zakresu znacznika na kilka paragrafów.

## Tłumaczenie rozdziału

1. Przetłumaczoną treść w kodowaniu UTF-8 wrzuć do pliku:

```
Rozdzial_NUMER_TYTUŁ.md
```

Na początku pliku powinna znaleźć się linia:

```
# TYTUŁ
```

2. Dodaj wpis w głównym pliku książki:

```
\include{Rozdzial_NUMER_TYTUŁ.md}
```

# Przykłady

## Dialog

-- Moja siostra była czarownicą -- powtórzyła Petunia. Wyglądała na przerażoną, ale upierała się przy swoim. -- Jej mąż był czarodziejem.

-- To jakiś absurd! -- powiedział ostro Michael. -- Byli na naszym weselu -- odwiedzili nas na święta…

-- Mówiłam im, że nie możesz wiedzieć -- szepnęła. -- Ale to prawda. Widziałam to. -- Profesor przewrócił oczami.
