![Haskell CI](https://github.com/stasiaks/tak-one/workflows/Haskell%20CI/badge.svg)

# TAK - Zadanie programistyczne 1

## Wymagania do zbudowania projektu:

- [The Haskell Tool Stack](https://docs.haskellstack.org/en/stable/README/)

Dalsze zależności, w tym wykorzystana wersja GHC (8.10.2) zostaną zainstalowane przez stack'a.

## Zbudowanie projektu

Do zbudowania projektu należy wywołać

```sh
stack build
```

Jeśli chcemy program uruchomić (z argumentami a, b i c):

```sh
stack run <a> <b> <c>
```

Możemy go także zainstalować jako plik wykonywalny.

Dla domyślnej ścieżki (`.local/bin`)

```sh
stack install
```

Dla dowolnej ścieżki

```sh
stack install --local-bin-path <path>
```

A następnie wykonujemy program

```sh
tak-one-exe <a> <b> <c>
```

## GHCI

Nie należy próbować uzyskać wyniku dla większych danych poprzez załadowanie modułu `Lib` do GHCI.

GHCI nie radzi sobie z wielowątkowością, co **znacznie** obniża prędkość programu. Wydajność programu nie może być tak uczciwie oceniona.

## Testy

Aby wykonać testy, wywołujemy:

```sh
stack test
```

Przykładowy wynik testów:

```
tak-one> test (suite: tak-one-test)
            
Tests
  Properties
    2 / 3, a > 0:                                   OK (0.16s)
      2001 tests completed (but 1001 did not meet the condition)
    10000 / 8, a > 3:                               OK (0.16s)
      2001 tests completed (but 1004 did not meet the condition)
    1 / 2000, a > 1:                                OK (0.16s)
      2001 tests completed (but 1004 did not meet the condition)
  Unit tests
    10000 / 8, 1. cyfra:                            OK
    10000 / 8, 2. cyfra:                            OK
    10000 / 8, 3. cyfra:                            OK
    1 / 2000, 1. cyfra:                             OK
    71 / 700, 1. cyfra:                             OK
    71 / 700, 2. cyfra:                             OK
    71 / 700, 3. cyfra:                             OK
    2 / 3, 10^8. cyfra (performance check):         OK (1.40s)
    7 / 22, 10^8. cyfra (performance check):        OK (1.39s)
    10^5 / 10^5-1, 10^8. cyfra (performance check): OK (1.38s)

All 13 tests passed (1.40s)
```

Testy w kategorii `Properties` wykorzystują bibliotekę [smallcheck](https://hackage.haskell.org/package/smallcheck) do wygenerowania danych testowych,
z tego powodu widzimy komunikaty o przypadkach nie spełniających warunku (argument `a` jest poza dopuszczonym zakresem)

## CI

[Projekt jest budowany oraz testowany za pomocą GitHub Actions](https://github.com/stasiaks/tak-one/actions?query=workflow%3A%22Haskell+CI%22), głównie celem wykluczenia możliwości, że działa tylko na moim komputerze.
