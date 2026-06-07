# Supabase-oppsett for delt lagring

Denne appen kan lagre valg i Supabase uten eget API.

## 1) Opprett tabell og RLS

1. Gå til Supabase-prosjektet ditt.
2. Åpne SQL Editor.
3. Kjør skriptet i `supabase/001_handover_choices.sql`.

## 2) Legg inn konfigurasjon i `public/config.js`

Appen leser disse variablene fra `window`:

- `window.SUPABASE_URL`
- `window.SUPABASE_ANON_KEY`

Åpne filen `public/config.js` og fyll inn verdiene fra Supabase Dashboard -> Project Settings -> API.

Eksempel:

```js
window.SUPABASE_URL = 'https://YOUR_PROJECT.supabase.co';
window.SUPABASE_ANON_KEY = 'YOUR_ANON_KEY';
```

## 3) Del lenke med overleveringskode

Appen bruker URL-parameteren `kode` for å avgrense data.

Eksempel:

```text
https://din-side.no/?kode=hus-2026-07
```

Både kjøper og selger må bruke samme `kode` for å se samme valg.

## 4) Verifiser i UI

I intro-seksjonen vises lagringsstatus:

- `Lagring: Koblet til skyen...` betyr at Supabase-synk er aktiv.
- `Lagring: Kun lokalt i nettleseren...` betyr at sky-konfig mangler.

## 5) Viktig sikkerhet

- Bruk kun `anon`-nøkkel i frontend.
- Legg aldri inn `service_role` i frontend.
- Hold `kode` privat (del kun med riktig mottaker).
